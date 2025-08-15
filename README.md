# INPBootCamp: behavior

## Analysis of behavioral data using C. elegans and MATLAB 

The purpose of this module is to familiarize students with behavioral tracking data, how they can analyze time series data of this type, and how to plot corresponding trends in behavioral phenotypes. 

The dataset from which we will work is from [Khan et al., PLOS Bio 2022](https://doi.org/10.1371/journal.pbio.3001677). C. elegans are attracted to or repelled by different odors and the olfactory neurons required for these behavioral responses are known for a large number of odorants. In this work, we showed that contextual cues can switch the behavioral response to alcohols like hexanol and heptanol from attraction to repulsion. The contextual cue in this case is a uniform concentration of another attractive chemical (either Isoamyl alcohol or benzaldehyde). These behaviors can be measured by recording worms in microfluidics behavioral arenas in which a spatial stripe of a candidate odorant is presented (See figure 1C from Khan et al., below). 

![alt text](./Arena.png)

Students will have access to datasets derived from videotracking of worms (approx. 20-30/assay) over 20 minutes. These data will be in .csv format ("all_matTrack_data.csv") with centroid position (x, y), time, and assigned behavioral “states”. Additionally, there is a separate .csv ("luminance.csv"), which contains the luminance values in the arena (vertical axis in the figure), for every frame in the video files (2400 frames, in this case). This file can be used to determine the location of the spatial stripe of odorant within each experiment.

Folder organization is shown below:

```
Figure
    |__genotype (2 or 3 per figure)
              |__assay (at least 3 per genotype)
                    |__all_matTrack_data.csv
                    |__luminance.csv
```
To start, this repository can be either manually downloaded, or using git:

```git clone https://github.com/ODonnellLab/INPBootCamp.git```

The exercises and other useful scripts are available in ./scripts

Behavior_L1.m is intended for students that are newer to Matlab and/or coding in general, Behavior_L2.m is intended for students with some experience with Matlab, and Behavior_L3.m is intended for students with extensive Matlab and coding experience. The 3 different sets build sequentially from one another (i.e., L3 contains L2 which contains L1), so feel free to start from whichever exercise set you are comfortable with and choose to work your way up through more advanced ones if you have time.

In L1, students will import data into MATLAB and plot histograms of the residence (relative proportion of tracked worms per spatial bin) from wild-type worms exposed to hexanol and isoamyl alcohol saturated hexanol, as shown in Figure 1D. If students finish L1 early, try seeing what individual worm tracks in this experiment look like by running the worm_tracks.m script. Afterwards, feel free to move on to L2 if there is still time.

In L2, students will plot data from mutants (1D) and compare the relative proportion of time spent in the stripe relative to the non-stripe region to generate a chemotaxis index (Number in odorant - number outside / (total number)), for each of 3 independent assays per condition. Afterwards, feel free to move on to L3 if there is still time.

In L3, students will determine if chemotaxis index varies by time, or if specific behavioral states are overrepresented in a specific mutant background, either using provided behavioral states or via algorithmic identification of states (e.g. a change in direction indicates a 'turn'). Students are also welcome to think of other properties that may affect the recorded behaviors and explore how these properties or states are present in the data if there is still time.
