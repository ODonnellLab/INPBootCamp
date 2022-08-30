%% Part 1 - Relative Residence
% In this exercise, we try to visualize the relative residence, a
% metric used to quantify how often worms are in a certain region
% of the arena.

% Read in data
% Change this filePath to load different experiments
filePath = '../datasets/1D/WT/HEX/20200623_N2_HEX_10000/all_matTrack_data.csv';
ASSAY = readtable(filePath);

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
% y = ?

% Sometimes worms go untracked (resulting in NaN), so let's eliminate
% anywhere these values happen. The details here aren't that important,
% but if you are interested in learning more about this efficient and
% concise method of choosing only desired entries in vectors, we
% encourage you to look up "vectorization in Matlab"
y = y(~isnan(y),1); % removes all NaNs from y
x = x(~isnan(x),1); % removes all NaNs from x

% Make a histogram h of the y values with 50 bins (hint: check 'histogram'
% function in Matlab)
figure
% h = histogram(?);

% Adds an appropriate title to the histogram based on the stimulus of the
% loaded experiment. If you're interested in learning exactly how this is
% being done, feel free to read the documentation for the horzcat function
title(['Unnormalized Residence (', ASSAY.("stimulus"){1},')']);

% Add a label to the x axis and call it 'Position' (hint: check 'xlabel'
% function in Matlab)
% xlabel(?);

% Now we normalize the histogram to make plot of relative residence:
% Each tracked frame (non NaN) contributes to the distribution.
% We extract parameters from histogram:
% Counts are the number of occurrences within a given bin
counts = h.Values;
% Find the mean number of counts and use it to normalize for rel_counts
% mean_counts = ?;
% rel_counts = ?;

figure
% Now use barplot to plot these relative values (hint: check 'bar' function
% in Matlab)
% bar(?);

% Again we add an appropriate title here automatically based on the file
title(['Relative Residence (', ASSAY.("stimulus"){1},')']);

% Add a label to the x axis and call it 'Position'
% xlabel(?);

%% Part 1b - Look at individual worm trajectories

% It is often helpful to visualize very raw forms of your data, so before
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
minY = nanmin(y);
maxY = nanmax(y);
luminance; % Feel free to open this script to see what it does

% This script returns the variables y_lower and y_upper which are the 
% boundaries of the odor stripe. You should use these for the next steps.

% Now we want to see how often worms are in this stripe. To do this, we
% determine the number of occurrences (rows) during which worms are within
% the stripe boundary (hint: use a combination of logical operators
% including <, >, and &)
% num_in_odorant = ?;

% Compute the chemotaxis index (CI = (num in odorant - num outside)/total)
% num_outside = ?;
% CI = ?;

% When trying to quantify behavior (and data in general), it is often
% useful to consider what you expect a metric to be in extreme cases.
% For instance, what do you expect CI to be in an experiments where
% worms are always in the odor stripe? What do you expect it to be in
% an experiment with worms never in the stripe? Finally, what do you
% expect it to be in a control experiment with a stripe with no odor?
% (Think about this last one carefully, it's a bit tricky and nuanced)

% Now that you've had the chance to think about the physical meaning
% corresponding to your evaluation metric, we can try your intuition on
% real data.
% If you have time, try running your completed script on different data
% sets to see how CI changes for attractive vs repulsive odors. Does it
% match your expectations based on your logic above regarding extremes?
