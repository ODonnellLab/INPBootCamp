%%%% This script will calculate speed of worms and plot average speed
%%%% along the y axis of the arena
clear all
close all
% Read in data
framerate = 2; % framerate in Hz
ASSAY = readtable('../datasets/Figure_3B/WT/HEX/20210824_N2_L_HEX_10000/all_matTrack_data.csv');

worms = unique(ASSAY.("worm"));
speed = zeros(max(worms),max(ASSAY.("time")));
position = zeros(max(worms),max(ASSAY.("time")));
for i = 1:length(worms)
    ...
    x = ASSAY(ASSAY.("worm") == i,"x");
    y = ASSAY(ASSAY.("worm") == i,"y");
    % convert to array:
    x = table2array(x);
    y = table2array(y);
    for j = 1:(length(x)-1)
        speed(i,j) = sqrt( (x(j) - x(j+1))^2 + (y(j) - y(j+1))^2) * framerate; %speed in mm/sec
        speed(length(x)) = NaN;
    end
   
end

speedtbl = array2table(reshape(transpose(speed), [], 1), 'VariableNames', {'speed'})
ASSAY = [ ASSAY, speedtbl ]

% now calculate mean speed at each position:
tblstats = groupsummary(ASSAY,"y",50,"mean","speed")

bar(tblstats.("disc_y"), tblstats.("mean_speed"))
