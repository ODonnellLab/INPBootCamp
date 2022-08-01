# INPBootCamp
Data and scripts for analysis of worm behavioral data

Proposed module on analysis of behavioral data using C. elegans and MATLAB 

The purpose of this module is to familiarize students with behavioral tracking data, how they can analyze time series data of this type, and how to plot corresponding trends in behavioral phenotypes. 

The dataset from which we will work is from Khan et al., PLOS Bio 2022. C. elegans are attracted to or repelled by different odors and the olfactory neurons required for these behavioral responses are known for a large number of odorants. In this work, we showed that contextual cues can switch the behavioral response to alcohols like hexanol and heptanol from attraction to repulsion. The contextual cue in this case is a uniform concentration of another attractive chemical (either Isoamyl alcohol or benzaldehyde). These behaviors can be measured by recording worms in microfluidics behavioral arenas in which a spatial stripe of a candidate odorant is presented (See figure 1C from Khan et al., below). 




Students will have access to datasets derived from videotracking of worms (approx. 20-30/assay) over 20 minutes. These data will be in .csv format with centroid position (x, y), time, speed, dye position, and assigned behavioral “states”. 

Less experienced students will import data into MATLAB, and plot histograms of the relative residence from wild-type worms exposed to hexanol and isoamyl alcohol saturated hexanol, as shown in Figure 1D. 

Intermediate students can plot data from mutants (1D) and compare the relative proportion of time spent in the stripe relative to the non-stripe region to generate a chemotaxis index, for each of 3 independent assays per condition. 

More experienced students can determine if chemotaxis index varies by time, or if specific behavioral states are overrepresented in a specific mutant background. 
