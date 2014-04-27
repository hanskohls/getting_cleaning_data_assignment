# Summary

This repository contains the data and scripts for the Peer Assessment to the Coursera Module "Getting and Cleaning Data".

# Scripts

The project was solved using the script file 'run_analysis.R' and the relevant data files included in the project. 

## Flow of the script

### Imports

The scripts starts with relevant library import. 

### Reading the table names

The next step is a helper task to read the relevant activity names in the data. 
The process creates to vectors: 

* measure_data: contains all the measure names
* measure_data_sub: contains only the measure names that are required in the output. 

### Reading the measure and activity data

In the next section, measure data from both a test and training data set is being read. 
The measure data is stripped to only the required columns and then bound row by row to the matching activities. 

### Merging the data sources

The rbind() function is used to append the tow datasets and produces a data.frame called all_data that contains activities as well as measurements from both the training and test data. 

### Writing a first data set

I was not sure if I had fully understood the last section item in the task (5) and hence wrote an intermediate data set with all mean and std values mapped to the activity. 

### Splitting and calculating the mean

The last section splits the data by the activity column and uses sapply to calculate the mean values for each measure, grouped by activity. The data si then stored in a file called 'data_set.txt'.