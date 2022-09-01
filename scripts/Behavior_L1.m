%% Part 1 - Relative Residence
% In this exercise, we try to visualize the relative residence, a
% metric used to quantify how often worms are in a certain region
% of the arena.

% Choose which file you want to load in via graphical interface
[fileName, filePath] = uigetfile('*.csv');
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
% Find the mean number of counts. Use this to compute rel_counts
% (the ratio of counts to mean counts) to tell us whether
% a certain bin has a higher or lower than average residence
% mean_counts = ?;
% rel_counts = ?;

figure
% Now use barplot to plot rel_counts (hint: check 'bar' function
% in Matlab)
% bar(?);

% Again we add an appropriate title here automatically based on the file
title(['Relative Residence (', ASSAY.("stimulus"){1},')']);

% Add a label to the x axis and call it 'Position'
% xlabel(?);
