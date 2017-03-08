## Subject

These data were recorded from 30 subject, labeled with whole numbers from 1 to 30. 

Was read in from the files 'test/subject_test.txt' and 'train/subject_train' in the original data folder 'UCI HAR Dataset' 

## Activity


These data were recorded while subjects were doing one of six activities:

* WALKING
* WALKING_UPSTAIRS
* WALKING_DOWNSTAIRS
* SITTING
* STANDING
* LAYING

Was read in from the files 'test/y_test.txt' and 'train/y_train.txt' in the original data folder 'UCI HAR Dataset' 

These files contained the numbers of activities. This was subsequently translated to descriptive namesusing the file 'activity_labels' in the original data folder 'UCI HAR Dataset'

The values in this column are factors.

## Feature

(Information in this section comes from the file 'features_info.txt' in the original data folder 'UCI HAR Dataset')

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'.X' '.Y' or '.Z' is used to denote 3-axial signals in the X, Y and Z directions.

The mean and standard deviation of these signals were extracted from the original data set, and denoted by '.mean' and '.std' respectively, and placed before the '.X' '.Y' or '.Z' when appropriate.

In the 'data' data frame, each feature is the name of a column, and each row is an observation of each of these features for a subject doing a certain activity.

The 66 features recorded include:

* tBodyAcc.mean.X
* tBodyAcc.std.X
* tBodyAcc.mean.Y
* tBodyAcc.std.Y
* tBodyAcc.mean.Z
* tBodyAcc.std.Z
* tGravityAcc.mean.X
* tGravityAcc.std.X
* tGravityAcc.mean.Y
* tGravityAcc.std.Y
* tGravityAcc.mean.Z
* tGravityAcc.std.Z
* tBodyAccJerk.mean.X
* tBodyAccJerk.std.X
* tBodyAccJerk.mean.Y
* tBodyAccJerk.std.Y
* tBodyAccJerk.mean.Z
* tBodyAccJerk.std.Z
* tBodyGyro.mean.X
* tBodyGyro.std.X
* tBodyGyro.mean.Y
* tBodyGyro.std.Y
* tBodyGyro.mean.Z
* tBodyGyro.std.Z
* tBodyGyroJerk.mean.X	
* tBodyGyroJerk.std.X
* tBodyGyroJerk.mean.Y
* tBodyGyroJerk.std.Y
* tBodyGyroJerk.mean.Z
* tBodyGyroJerk.std.Z	
* tBodyAccMag.mean
* tBodyAccMag.std
* tGravityAccMag.mean
* tGravityAccMag.std
* tBodyAccJerkMag.mean
* tBodyAccJerkMag.std
* tBodyGyroMag.mean
* tBodyGyroMag.std
* tBodyGyroJerkMag.mean
* tBodyGyroJerkMag.std
* fBodyAcc.mean.X
* fBodyAcc.std.X
* fBodyAcc.mean.Y
* fBodyAcc.std.Y
* fBodyAcc.mean.Z
* fBodyAcc.std.Z
* fBodyAccJerk.mean.X
* fBodyAccJerk.std.X
* fBodyAccJerk.mean.Y
* fBodyAccJerk.std.Y	
* fBodyAccJerk.mean.Z
* fBodyAccJerk.std.Z
* fBodyGyro.mean.X
* fBodyGyro.std.X
* fBodyGyro.mean.Y
* fBodyGyro.std.Y
* fBodyGyro.mean.Z
* fBodyGyro.std.Z
* fBodyAccMag.mean
* fBodyAccMag.std
* fBodyAccJerkMag.mean
* fBodyAccJerkMag.std
* fBodyGyroMag.mean
* fBodyGyroMag.std
* fBodyGyroJerkMag.mean
* fBodyGyroJerkMag.std

Was read in from the file 'features.txt' in the original data folder 'UCI HAR Dataset' 

Subsequently, this was filtered to include only those features whose names contained the strings 'mean()' and 'std()' to get the mean and standard deviation data. These strings were then altered to give valid variable names in R: parentheses were removed and dashes '-' were replaced with periods '.'


## Value

The 'value' column in the 'data_narrow' data frame are observations of data. 

The values have been normalized and bounded within [-1, 1].

## Mean

The 'mean' column in the 'averages' data frame gives the mean of each feature for each subject and each activity. 

To do this, we grouped the data frame 'data_narrow' by subject, activity, and feature. We then found the mean within each group (using dplyr::mutate) and removed the 'value' column (using dplyr::select). Finally, we deleted duplicate entries to produced the 'averages' data frame.

Because the 'value' column (see above) was normalized and bounded within [-1, 1], this may also be said about the 'mean' column.

As there are 30 subjects, 6 activities, and 66 features, the data frame 'averages' has (30)(6)(66) = 11880 observations.
