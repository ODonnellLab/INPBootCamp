%% Part 1 - Relative Residence

% Read in data
% Change this filePath to load different experiments
filePath = '/datasets/1D/WT/HEX/20200623_N2_HEX_10000/all_matTrack_data.csv';
ASSAY = readtable(filePath);

%assign arrays of positions using column indexing:
x = ASSAY.("x");
% y = ?

%Some worms are untracked (NaN), eliminate these values
y = y(~isnan(y),1);
x = x(~isnan(x),1);

figure
% Make a histogram h of the y values with 50 bins (hint: check 'histogram'
% function in matlab)
% h = ?;

% Adds an appropriate title to the histogram based on the stimulus of the
% loaded experiment
title(['Unnormalized Residence (', ASSAY.("stimulus"){1},')']);
% Add a label to the x axis and call it 'Position' (hint: check 'xlabel'
% function in matlab)


% Normalize the histogram to make plot of relative residence:
% Each tracked frame (non NaN) contributes to the distribution.
% extract parameters from histogram:
% Counts are the number of occurrences within a given bin
counts = h.Values;
% Find the mean number of counts and use it to normalize for rel_counts
% mean_counts = ?;
% rel_counts = ?;

figure
% Now use barplot to plot these relative values (hint: check 'bar' function
% in matlab)


title(['Relative Residence (', ASSAY.("stimulus"){1},')']);
% Add a label to the x axis and call it 'Position'


%% Part 2 - Chemotaxis Index

% Establish the y-boundaries of the odorant stripe
y_lower = 3*min(y)/4; % Get this from Mike before sending to students
y_upper = min(y)/4; % Get this from Mike before sending to students

% Determine the number of occurrences (rows) during which worms are within
% the stripe boundary (hint: use a combination of logical operations
% including <, >, and &)


% Compute the chemotaxis index (CI = (num in odorant - num outside)/total)

CI = (num_in_odorant - num_outside)/(num_in_odorant + num_outside);