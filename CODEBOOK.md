# Getting And Cleaning Data Project

## Files and Folders
This project includes the following files and folders:
* 'README.md'
* 'CODEBOOK.md'
* 'run\_analysis.R'
* '/data'

The data folder contains all of the files and folders from the Human Activity Recognition Using Smartphones Dataset.
For information about how they obtained their data, view the README and CODEBOOK in the /data folder.
In this codebook, I will simply explain how I cleaned their data and what you'll see in the tidy dataset.

## What is in the tidy data

The original data consisted of the following signals from the original data set. These have been renamed in the tidy
dataset to be more descriptive.

* tBodyAcc-XYZ
* tGravityAcc-XYZ
* tBodyAccJerk-XYZ
* tBodyGyro-XYZ
* tBodyGyroJerk-XYZ
* tBodyAccMag
* tGravityAccMag
* tBodyAccJerkMag
* tBodyGyroMag
* tBodyGyroJerkMag
* fBodyAcc-XYZ
* fBodyAccJerk-XYZ
* fBodyGyro-XYZ
* fBodyAccMag
* fBodyAccJerkMag
* fBodyGyroMag
* fBodyGyroJerkMag

It also consisted of several variables estimated from these signals, such as the mean, standard deviation, min/max, entropy, etc...

__To create the tidy data, I extracted only the mean and standard deviation features.__



