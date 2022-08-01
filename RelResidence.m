% This script will plot relative residence (i.e. normalized for track
% counts) 
clear all
close all
% Read in data
ASSAY = readtable('1D/WT/HEX/202200630_N2_L_HEX_10000/all_matTrack_data.csv');

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
h = histogram(y,50);

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
bar(rel_counts);

