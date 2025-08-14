% This script will plot individual tracks of worms over the course of an
% assay

% To choose a different file from the one currently loaded, uncomment
% the next 3 lines to have Matlab give you a GUI to select a file from
% [fileName, filePath] = uigetfile('*.csv');
% fileWithPath = fullfile(fileName, filePath);
% ASSAY = readtable(fileWithPath);

% Plot tracks of each unique worm in a different color:
worms = unique(ASSAY.("worm"));
figure
hold on
for i = 1:length(worms)
    ...
    x_plot = ASSAY(ASSAY.("worm") == i,"x");
    y_plot = ASSAY(ASSAY.("worm") == i,"y");
    % convert array to plot:
    x_plot = table2array(x_plot);
    y_plot = table2array(y_plot);
    plot(x_plot,y_plot)
end
