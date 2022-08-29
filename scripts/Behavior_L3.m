%% Part 1 - Relative Residence (auto-completed for L3)

% Read in data
filePath = '/datasets/1D/WT/HEX_IAA/20210727_N2_HEX_IAA_10000/all_matTrack_data.csv';
% filePath = '/datasets/1D/WT/HEX/20200623_N2_HEX_10000/all_matTrack_data.csv';
ASSAY = readtable(filePath);

%assign arrays of positions using column indexing:
x = ASSAY.("x");
y = ASSAY.("y");
direction = categorical(ASSAY.("direction"));
direction = removecats(direction,"NA");

%Some worms are untracked (NaN), eliminate these values
% direction = categorical(direction(~isnan(x),1));
y = y(~isnan(y),1);
x = x(~isnan(x),1);

% Number of tracked worm frames is equivalent to the (non-NaN) rows:
num_tracked = length(x);

%Simple histogram of distributions:
% x is position along (orthogonal to) the stimulus axis:
figure
h = histogram(y,50);
title(['Unnormalized Residence (', ASSAY.("stimulus"){1},')']);
xlabel('Position');

% Normalize the histogram to make plot of relative residence:
% Each tracked frame (non NaN) contributes to the distribution.
% extract parameters from histogram:
counts = h.Values;
sum_counts = sum(counts);
mean_counts = mean(counts);
rel_counts = counts/mean_counts;


% Double check the output from h matches your num_tracked:
assert(sum_counts == num_tracked, ...
    "there is an error in your histogram counts, check that you've filtered 'NaN' and 'NA'")

% Now use barplot to plot these relative values:
figure
bar(rel_counts);
title(['Relative Residence (', ASSAY.("stimulus"){1},')']);
xlabel('Position');

%% Part 2 - Chemotaxis Index

% Establish the y-boundaries of the odorant stripe
y_lower = 3*min(y)/4; % Get this from Mike before sending to students
y_upper = min(y)/4; % Get this from Mike before sending to students

% Determine the number of occurrences (rows) during which worms are within
% the stripe boundary (hint: use a combination of logical operations
% including <, >, and &)


% Compute the chemotaxis index (CI = (num in odorant - num outside)/total)

CI = (num_in_odorant - num_outside)/(num_in_odorant + num_outside);

%% Part 3a - Time Dependence of Chemotaxis Index

% Find and plot CI(t) by computing CI for each frame



%% Part 3b - Behavioral States Among Mutants

% Determine the distribution of states for each genotype of worm and see if
% certain states are more prevalent among differing mutants