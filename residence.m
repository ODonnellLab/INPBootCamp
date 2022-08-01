
%%%% This script will make a simple histogram of distribution of worms
%%%% along the x and y axis of the arena
clear all
close all
% Read in data
ASSAY = readtable('1D/WT/HEX/202200630_N2_L_HEX_10000/all_matTrack_data.csv');

%assign arrays of positions:
x = ASSAY.("x");
y = ASSAY.("y");

%Simple histogram of distributions:
hold on
% x is position in parralel to stimulus axis (i.e. the flow axis)
histogram(x,50);
% y is position along (orthogonal to) the stimulus axis:
histogram(y,50);


