%% Part 1 - Relative Residence
% In this exercise, we try to visualize the relative residence, a
% metric used to quantify how often worms are in a certain region
% of the arena.

% Before we get started, these next few lines just run a couple of
% checks to help make sure the rest of the code runs smoothly.
currFolder = cd;    % grabs current path
if endsWith(currFolder,'scripts') % if in the right folder, add all to path
    cd ..
    behavFolder = cd;
    addpath(genpath(behavFolder));
    cd scripts
else    % if not on the right path, throw an error
    error('The current path is not in the scripts subdirectory. Please ask a TA if you need help fixing this :)');
end

% Choose which file you want to load in via graphical interface
[fileName, filePath] = uigetfile([behavFolder,'\datasets\Figure_3B\WT\HEX\20210824_N2_L_HEX_10000\'],'*.csv');
fileWithPath = fullfile(fileName, filePath);

% Read in data
ASSAY = readtable(fileWithPath);

% Before doing anything with the data, it is typically helpful to
% see how it is structured. Open the table named ASSAY. What do the
% rows and columns of the table mean? Can you tell how many worms
% were tracked during this experiment?

% It is often times easier to work with only the variables of
% interest in a table rather than working with the whole thing, so
% let's load in the variables we want into vectors below.

% Assign arrays of positions using column indexing. This tells Matlab
% that we want vector x to be equal to the column labeled "x" in the
% ASSAY table.
x = ASSAY.("x");
y = ASSAY.("y");
time = ASSAY.("time");
state = ASSAY.("state");

% Sometimes worms go untracked (resulting in NaN), so let's eliminate
% anywhere these values happen. The details here aren't that important,
% but if you are interested in learning more about this efficient and
% concise method of choosing only desired entries in vectors, we
% encourage you to look up "vectorization in Matlab"
y = y(~isnan(y),1); % removes all NaNs from y
x = x(~isnan(x),1); % removes all NaNs from x
time = time(~isnan(x),1); % removes all NaNs from time
states = state(~isnan(x),1); % removes all NaNs from state

% Make a histogram h of the y values with 50 bins (hint: check 'histogram'
% function in Matlab)
figure
h = histogram(y,50);

% Adds an appropriate title to the histogram based on the stimulus of the
% loaded experiment. If you're interested in learning exactly how this is
% being done, feel free to read the documentation for the horzcat function
title(['Unnormalized Residence (', ASSAY.("stimulus"){1},')']);

% Add a label to the x axis and call it 'Position' (hint: check 'xlabel'
% function in Matlab)
xlabel('Position');

% Now we normalize the histogram to make plot of relative residence:
% Each tracked frame (non NaN) contributes to the distribution.
% We extract parameters from histogram:
% Counts are the number of occurrences within a given bin
counts = h.Values;
% Find the mean number of counts. Use this to compute rel_counts
% (the ratio of counts to mean counts) to tell us whether
% a certain bin has a higher or lower than average residence
% Note that rel_counts > 1 means that a bin has worms in it more
% often than average while rel_counts < 1 means that a bin has
% worms in it less often than average
mean_counts = mean(counts);
rel_counts = counts/mean_counts;

figure
% Now use barplot to plot rel_counts (hint: check 'bar' function
% in Matlab)
bar(rel_counts);

% Again we add an appropriate title here automatically based on the file
title(['Relative Residence (', ASSAY.("stimulus"){1},')']);

% Add a label to the x axis and call it 'Position'
xlabel('Position');

%% Part 1b - Look at individual worm trajectories

% It is often helpful to visualize very raw forms of your data, so before we
% do anything more complicated, let's go ahead and see what our individual
% worm trajectories look like by running the worm_tracks.m script

worm_tracks;

%% Part 2 - Chemotaxis Index: 
% The goal is to quantify the relative time worms spend in the odor stripe
% vs out of the stripe. To do this, we compute a Chemotaxis Index (CI).
% This can be done for several different experiments to compare different
% conditions if desired, or you can choose to just run it for one
% experiment for now.

% Before we do anything, we need to know the y values of the boundaries of
% the odorant stripe. The location and size of this stripe isn't exactly
% the same between experiments, but it is static within a given experiment.
% The location of the stripe can be found for a given experiment from the
% "luminance.csv" file that corresponds to the data, but this is a bit of
% an involved process, so we are providing a script called "luminance.m" 
% that you can run to do it for you. Before running, it needs to know
% the min and max values of y for the currently loaded data.
minY = min(y);
maxY = max(y);
luminance; % Feel free to open this script to see what it does

% This script returns the variables y_lower and y_upper which are the 
% boundaries of the odor stripe. You should use these for the next steps.

% Now we want to see how often worms are in this stripe. To do this, we
% determine the number of occurrences (rows) during which worms are within
% the stripe boundary (hint: use a combination of logical operators
% including <, >, and &)
in_stripe = (y < y_upper & y > y_lower); % hint: y between y_upper & y_lower
num_in_odorant = sum(in_stripe); % hint: how many in stripe?

% Compute the chemotaxis index (CI = (num in odorant - num outside)/total)
num_outside = length(y) - num_in_odorant;
CI = (num_in_odorant - num_outside)/(num_in_odorant + num_outside);

% When trying to quantify behavior (and data in general), it is often
% useful to consider what you expect a metric to be in extreme cases.
% For instance, what do you expect CI to be in an experiment where
% worms are always in the odor stripe? What do you expect it to be in
% an experiment with worms never in the stripe? Finally, what do you
% expect it to be in a control experiment with a stripe with no odor?
% (Think about this last one carefully, it's a bit tricky and nuanced)

% Answers: 
% Always in stripe = +1
% Never in stripe = -1
% Odorless stripe = 2*(fractional size of stripe) - 1
% If stripe is odorless, should be random chance that worms are in the
% stripe or not, so CI should solely depend on how big the stripe is
% relative to the rest of the arena. Note that the above answer is
% equal to (fractional size of stripe) - (fractional size of not stripe)

% Now that you've had the chance to think about the physical meaning
% corresponding to your evaluation metric, we can try your intuition on
% real data.
% If you have time, try running your completed script on different data
% sets to see how CI changes for attractive vs repulsive odors. Does it
% match your expectations based on your logic above regarding extremes?

%% Part 3 - Data Exploration
% If you've made it this far and still have time, the following sections
% are suggestions for different analyses you can consider for the data.
% Feel free to instead ask your own questions and try to answer them
% with the data we've provided you.

% Here are some suggested questions to think about and try to implement:
% Does CI vary over the course of the experiment? Is CI(t) meaningful?
% Do different mutants exhibit different distributions of states during
% their locomotion?
% What other factors may affect CI? Are there any factors that you think
% should be controlled against to avoid seeing false patterns (hint: does
% the starting position of the worms have an effect?)?

%% Part 3a - Time Dependence of Chemotaxis Index

% Grab the number of frames each worm was recorded for
numFrames = max(time);
% Initialize vector that holds CI(t) for each frame
CI_of_t = zeros(numFrames,1);

% Loop through each frame and count the number of worms in the band for
% each frame, then use that to compute CI
for frame = 1:numFrames
    num_in_odorant_t = sum(in_stripe(time == frame));
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
numStates = max(states);
% Initialize vector that holds how many occurrences of each state takes
% place in a given experiment (this doesn't distinguish between worms)
stateCount = zeros(numStates,1);

% Loop through each possible state and count the number of occurrences
for stateCounter = 1:numStates
    stateCount(stateCounter) = sum(states == stateCounter);
end
