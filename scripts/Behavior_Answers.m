%% Part 1 - Relative Residence

% Read in data
filePath = '../datasets/1D/WT/HEX_IAA/20210727_N2_HEX_IAA_10000/all_matTrack_data.csv';
% filePath = '/datasets/1D/WT/HEX/20200623_N2_HEX_10000/all_matTrack_data.csv';
ASSAY = readtable(filePath);

%assign arrays of positions using column indexing:
x = ASSAY.("x");
y = ASSAY.("y");
minY = nanmin(y);
maxY = nanmax(y);
time = ASSAY.("time");
state = ASSAY.("state");
direction = categorical(ASSAY.("direction"));
direction = removecats(direction,"NA");

%Some worms are untracked (NaN), eliminate these values
y = y(~isnan(y),1);
x = x(~isnan(x),1);
time = time(~isnan(x),1);
direction = categorical(direction(~isnan(x),1));
state = state(~isnan(x),1);

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

% To find the lower (y_lower) and upper (y_upper) bounds of the odorant
% stripe, use this script in your path variable:
luminance

% Determine the number of occurrences (rows) during which worms are within
% the stripe boundary (hint: use a combination of logical operations
% including <, >, and &)
in_band = (y < y_upper & y > y_lower);
num_in_odorant = sum(in_band);

% Compute the chemotaxis index (CI = (num in odorant - num outside)/total)
num_outside = length(y) - num_in_odorant;
CI = (num_in_odorant - num_outside)/(num_in_odorant + num_outside);

%% Part 3a - Time Dependence of Chemotaxis Index

% Grab the number of frames each worm was recorded for
numFrames = max(time);
% Initialize vector that holds CI(t) for each frame
CI_of_t = zeros(numFrames,1);

% Loop through each frame and count the number of worms in the band for
% each frame, then use that to compute CI
for frame = 1:numFrames
    num_in_odorant_t = sum(in_band(time == frame));
    num_outside_t = sum(time == frame) - num_in_odorant_t;
    CI_of_t(frame) = (num_in_odorant_t - num_outside_t)/(num_in_odorant_t + num_outside_t);
end

% Plot CI(t)
figure
plot(CI_of_t);
ylabel('CI');
xlabel('Time');
title('CI(t)');

%% Part 3b - Behavioral States Among Mutants

% Grab the number of allowed states (can do this by category via state_name
% if desired)
numStates = max(state);
% Initialize vector that holds how many occurrences of each state takes
% place in a given experiment (this doesn't distinguish between worms)
stateCount = zeros(numStates,1);

% Loop through each possible state and count the number of occurrences
for stateCounter = 1:numStates
    stateCount(stateCounter) = sum(state == stateCounter);
end