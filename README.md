# Sparse Acquisition Functional Magnetic Resonance Imaging (fMRI) with Multiband Sequences

The aim of this project was to optimize sequence parameters for sparse acquisition* fMRI scanning with multiband* sequences, with overarching goal of noise reduction in human neuroimaging data. This project began when a pilot fMRI memory experiment I was running required sparse acquisition to allow for subjects to speak aloud their responses in a memory task conducted during the imaging session.  Because the use of sparse acquisition with multiband sequences is relatively new, the optimal scanner sequence parameters to reduce slice-by-slice noise had not been determined. 

On this project, I worked with an interdisciplinary team of researchers to optimize the scanner sequence parameters. Of particular focus were changes in average slice-by-slice signal intensity as a function of repetition time (TR of 3.2s vs. 10s), multiband shots (even vs. odd number of shots), slice gap (0%, 10%, 20%, and 30%), and acquisition order (interleaved vs. ascending).

*In sparse acquisition fMRI scanning, unlike continuous scanning, there are breaks built into the fMRI pulse sequence in which neuroimaging data is not being collected.  Sparse acquisition can be used in order to more readily allow for things like speech in the scanner that can lead to head motion. 

*A multiband scanning sequence collects multiple, non-adjacent slices of imaging data in each pulse. This allows for greatly reduced TRs (repetition time) for fMRI scanner pulses, such that one can collect an entire "brain's" worth of data in much shorter time (i.e. allowing for much greater temporal resolution). For example, an MB 4 sequence will collect 4 non-adjacent slices of data according to an ascending or interleaved acquisition scheme.

## Explanation of files and folders

For information on scanning parameters: SCAN_INFORMATION.xlsx

Concern to note: The phantom is not equally present in all slices (i.e., the phantom is not always present in end slices)

GRAPHS_AND_INTENSITY_INFO:
Contains slice timing / intensity graphs, with slice-to-slice intensity data in individual txt files.

RELEVANT_SCANS_CONVERTED:
Contains imaging phantom data converted to .nii file type via DCM2NIIX to prepare for preprocessing.

AFNI_SCRIPTS:
1) Contains script to obtain slice-by-slice intensity information (preprocessing/processing done in AFNI)
2) Contains script (“helper” in title) to initialize/automate the first script

ANALYSIS:
Contains the outputs of the AFNI preprocessing/processing script that are needed for plotting in MATLAB.

MATLAB_SCRIPTS:
Contains scripts for graphing slice timing, mean intensity, mean intensity absolute value of percent change

Please note: When using scripts here, files should be altered to reflect path/parameter changes.
