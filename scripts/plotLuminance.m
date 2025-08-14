% script will plot luminance over the y-axis of an arena - this can be used
% to identify the boundaries of a dye (stimulus) region. 
%%%% This script will calculate speed of worms and plot average speed
%%%% along the y axis of the arena
clear all
close all
% Read in data
framerate = 2; % framerate in Hz
dye_pos = readmatrix('../datasets/Figure_3B/WT/HEX/20210824_N2_L_HEX_10000/luminance.csv');
% data are luminance (rows) across frames (columns)
% take the mean over the assay
mean_dye_pos = mean(dye_pos, 2);

%plot the average luminance
plot(mean_dye_pos,1:length(mean_dye_pos))
xlabel('Luminance');
ylabel('Y position (pix)');