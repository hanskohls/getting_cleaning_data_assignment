# Code Book - Summary

This code book describes the data stored in 'data_set.txt' as generated for project work to the course "Getting and Cleaning Data" https://class.coursera.org/getdata-002

# Data Sources

The data is based on the study http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones and was obtained from the following zip archive: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

# Data Import and Mapping

The zip archive contains the features_info.txt file which explains the actual features that were derived from initial observations. 
The features for each observation were extracted from the files formatted "[test|train]/X_[test|train].txt". 
The columns of the feature data were mapped in the sequence order of the features documented in the features.txt file.
The feature data was then mapped to the activity data which was in the relevant test nad train folders with corresponding file names starting with Y.

# Data Processing

All features that do not either contain "-mean()" or "-std()" were discarded from the data set and the training data appended to the test data to create a unified data set. 

The resulting matrix was then used to generate mean values for each measure, grouped by activity, and this data exported to the file "data_set.txt"

All code for this process is accessibel in the file "run_analysis.R", which can be rerun, with filepaths set assuming that the UCI HAR Dataset is stored in a folder in the working directory.

# Data Format

The target data is stored in a space spearated text file  called "data_set.txt". each row contains the mean of measurements grouped by activities. 
The columns 2 to 7 each reflect an activity (1 to 6 in increasing order), so column 2 is activity 1, column 3 activity 2, ...

# System Setup

The project was run using R 3.1.0 on Ubuntu Linux 14.04 LTS on a x64 architecture. 




