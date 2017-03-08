library(dplyr)
library(tidyr)

## For this script to work, make sure it's in the "UCI HAR Dataset" folder.

## read in the data
testData <- read.table("test/X_test.txt")
trainData <- read.table("train/X_train.txt")

## put the data in one data frame
data <- rbind(testData, trainData)

## features is a data frame with one column denoting (column) position of a 
## measurement in data and another column with variable (feature) name. 
features <- read.table("features.txt", col.names = c("pos", "name"))

## filter the positions and names of mean and standard deviation measurments. 
## edit the names so they are valid variable names in R by removing 
## parentheses and replacing "-" with "."
features <- features %>%
        filter(grepl("mean()", name, fixed = TRUE)|grepl("std()", name, fixed = TRUE)) %>%
        mutate(name = gsub("\\(\\)", "", name)) %>%
        mutate(name = gsub("-", ".", name))

## select the data with mean and standard deviation measurements, previously 
## filtered in the 'features' data frame.
data <- data[, features$pos]

## give the variables appropriate names, previously changed in 'features'
names(data) <- features$name

## read in subject data and rbind in preparation for cbinding to data
subject_test <- read.table("test/subject_test.txt", col.names = "subject")
subject_train <- read.table("train/subject_train.txt", col.names = "subject")
subject <- rbind(subject_test, subject_train)

## get a vector of descriptive activity labels. 
activity_labels <- read.table("activity_labels.txt")[,2]

## read in activity data (as numbers), transmute to descriptive activity labels, 
## and rbind in prepartion for cbinding to data
y_test <- read.table("test/y_test.txt", col.names = "activity_num") %>%
        transmute(activity = activity_labels[activity_num])
y_train <- read.table("train/y_train.txt", col.names = "activity_num") %>%
        transmute(activity = activity_labels[activity_num])
y <- rbind(y_test, y_train)

## cbind subject and activity columns to data
data <- cbind(subject, y, data)

## tidy up the data by making one observation per row.
data_narrow <- data %>% 
        gather(key = feature, value = value, -subject, -activity) %>%
        group_by(subject, activity, feature)

## give data frame of averages for each variable (feature) for each activity 
## and each subject.
averages <- data_narrow %>% 
        group_by(subject, activity, feature) %>%
        mutate(mean = mean(value)) %>%
        select(-value) %>% 
        unique