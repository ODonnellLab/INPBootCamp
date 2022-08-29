% script will plot luminance over the y-axis of an arena - this can be used
% to identify the boundaries of a dye (stimulus) region. 
% Read in luminance data
[path, name, ext] = fileparts(filePath);
dye_pos = readmatrix([path, filesep, 'luminance.csv']);
% data are luminance (rows) across frames (columns)
% take the mean over the assay
mean_dye_pos = mean(dye_pos, 2);

% get the width of each y-bin in microns
binwidth = (maxY - minY) / length(mean_dye_pos);

% Fit a regression through the luminance (mean_dye_pos is row vector)
b1 = mldivide(transpose(1:length(mean_dye_pos)),mean_dye_pos);
fitline = b1*transpose(1:length(mean_dye_pos));

% Get smoothed luminance to ID lower and upper bounds using robust loess
smooth_dye = smooth(transpose(1:length(mean_dye_pos)),mean_dye_pos,0.3,'rloess');

%plot the average luminance, regression fit, and smoothed luminance
lumPlot = figure('Name', 'Luminance vs. corrected fitline');
ax1 = axes('Parent', lumPlot);
plot(ax1, mean_dye_pos, 'Color', 'blue');
hold on
plot(ax1, fitline, 'Color', 'red');
plot(ax1, smooth_dye, 'Color', 'magenta');
hold off
title(ax1,'');

% Identify when luminance is below the regression line, indicating dye
% bounds
negvals = find(smooth_dye - fitline < 0);

% Using these values, establish the y-boundaries of the odorant stripe
y_lower = -max(negvals)*binwidth;
y_upper = -min(negvals)*binwidth;


