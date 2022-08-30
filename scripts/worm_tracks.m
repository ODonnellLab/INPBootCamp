% This script will plot individual tracks of worms over the course of an
% assay
% Read in data
ASSAY = readtable('../datasets/1D/WT/HEX/202200630_N2_L_HEX_10000/all_matTrack_data.csv');

% Plot tracks of each unique worm in a different color:
worms = unique(ASSAY.("worm"));
hold on
for i = 1:length(worms)
    ...
    x_plot = ASSAY(ASSAY.("worm") == i,"x");
    y_plot = ASSAY(ASSAY.("worm") == i,"y");
    % convert to array to plot:
    x_plot = table2array(x_plot);
    y_plot = table2array(y_plot);
    plot(x_plot,y_plot)
end
