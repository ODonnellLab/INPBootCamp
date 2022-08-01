% This script will plot individual tracks of worms over the course of an
% assay
clear all 
close all
% Read in data
ASSAY = readtable('1D/WT/HEX/202200630_N2_L_HEX_10000/all_matTrack_data.csv');

% Plot tracks of each unique worm in a different color:
worms = unique(ASSAY.("worm"));
hold on
for i = 1:length(worms)
    ...
    x = ASSAY(ASSAY.("worm") == i,"x");
    y = ASSAY(ASSAY.("worm") == i,"y");
    % convert to array to plot:
    x = table2array(x);
    y = table2array(y);
    plot(x,y)
end