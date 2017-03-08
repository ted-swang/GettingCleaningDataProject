### Introduction

The data that the script run_analysis.R cleans represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

In order for run_analysis.R to work properly, it must be run in the folder "UCI HAR Dataset", a folder that exists after the data from

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

is unzipped.

### Description

When the script run_analysis.R is run in the "UCI HAR Dataset" folder, it takes the raw data in the folder and
  * merges the 'test' and 'train' data sets into one data frame, from the files 'test/X_test.txt' and 'train/X_train.txt'
  * only has measurements of mean and standard deviation for each measurement, determined by if the variable names from the 'features.txt' file contained the strings "mean()" or "std()"
  * has column with subject, an identifying number from 1 to 30, from the 'test/subject_test.txt' and 'train/subject_train.txt' files 
  * has column with activity, a descriptive name, by using the files 'test/y_test.txt' and 'train/y_train.txt' for the activity number and using 'activity_labels.txt' for the corresponding descriptive names.
  * uses descriptive variable names from 'features.txt' edited to be vaild variable names in R.

Three data frames are produced by this script:
  1. The "wide" data frame called 'data' where each row consists of measurements of each variable (feature) for a subject and an activity. 
  2. The "narrow" data frame called 'data_narrow' where each row consists of one measurement from a subject, an activity, and a feature. This data frame is "tidy" in the sense that each observation is a row and each variable is a column.
  3. The data frame called 'averages' where each row is the mean value of each variable (feature) for a each activity and each subject. This data frame is also "tidy" in the sense that each observation is a row and each variable is a column.
