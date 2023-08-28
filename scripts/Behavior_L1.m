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
    error(['The current path is not in the scripts subdirectory.',...
           ' Please ask a TA if you need help fixing this :)']);
end

% Choose which file you want to load in via graphical interface
[fileName, filePath] = uigetfile('*.csv','Select a file',...
    [strrep(behavFolder,'\','/'),'/datasets/Figure_3B/WT/HEX/20210824_N2_L_HEX_10000/']);
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
% ASSAY table. Let's do the same for y, time, and state.
x = ASSAY.("x");
% y = ?
% time = ?
% state = ?

% Throw error to notify the TA if the data that was imported had an issue
% This step is only needed because older versions of the data provided by
% O'Donnell lab had different formatting that resulted in errors.
if ~isa(x,'double')
    error(sprintf(['Message for the TAs:\n',...
           'The data loaded in did not load as a double. The most ', ...
           'likely reason is because the .csv file loaded in had NA ',...
           'instead of NaN listed within entries. Please check the ',...
           'file and replace all NA with NaN via Excel.']));
end

% Sometimes worms go untracked (resulting in NaN), so let's eliminate
% anywhere these values happen. The details here aren't that important,
% but if you are interested in learning more about this efficient and
% concise method of choosing only desired entries in vectors, we
% encourage you to look up "vectorization in Matlab"
y = y(~isnan(y),1); % removes all NaNs from y
x = x(~isnan(x),1); % removes all NaNs from x
time = time(~isnan(x),1); % removes all NaNs from time
state = state(~isnan(x),1); % removes all NaNs from state

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
% Note that rel_counts > 1 means that a bin has worms in it more
% often than average while rel_counts < 1 means that a bin has
% worms in it less often than average
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

%% Part 1b - Look at individual worm trajectories

% It is often helpful to visualize very raw forms of your data, so before we
% do anything more complicated, let's go ahead and see what our individual
% worm trajectories look like by running the worm_tracks.m script

worm_tracks;