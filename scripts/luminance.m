% script will plot luminance over the y-axis of an arena - this can be used
% to identify the boundaries of a dye (stimulus) region. 
%%%% This script will calculate speed of worms and plot average speed
%%%% along the y axis of the arena
clear all
close all
% Read in data
framerate = 2; % framerate in Hz
dye_pos = readmatrix('../datasets/1D/WT/HEX/202200630_N2_L_HEX_10000/luminance.csv');
% data are luminance (rows) across frames (columns)
% take the mean over the assay
mean_dye_pos = mean(dye_pos, 2)

%plot the average luminance
plot(mean_dye_pos)

% Fit a regression through the luminance

% Subtract the regression line from the luminance, then smooth the
% luminance to identify the position of the inflection points. Using these
% locations, binarize the luminance values to indicate 0 (buffer) and 1
% (dye). These can be used to calculate the chemotaxis index values based
% on residence in dye vs. buffer. 

