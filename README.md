#UCI Human Activity Recognition Analysis

This is just a script. There are no functions.
All it will do is create some variables in your environment.
Step 5 didn't actually say to create a file so if you want to create
your own tidy data file, you'll have to write.table(df\_tidy) 
after running this script.

##What data does this script use?

The data in the 'data' folder is the recordings of 30 subjects performing activities of daily living while carrying
a waist-mounted smartphone with embedded inertial sensors.

Each person performed six activities (WALKING, WALKING\_UPSTAIRS, WALKING\_DOWNSTAIRS, SITTING, STANDING, LAYING), while wearing a smartphone on the waist. Using its embedded accelerometer and gyroscope, 3 axial linear acceleration and 3 axial angular velocity were captured at a constant rate of 50 Hz. The obtained data was randomly partitioned into two sets, where 70% of the volunteers were selected for generating the training data and 30% of the test data.

Several functions were applied to this data to produce a vector of 561 features.
___More details about the data can be found in the data/features_info.txt file___

##What does this script do with the data?

This script uses read.table to create a dataframe of the combined train and test data. The columns are renamed to
a descriptive name. More detailed description is found in data/features\_info.txt. A new dataframe
was created which only contains features relating to the mean and standard deviation of each sample.

The final tidy data set is created by grouping the data by Subject(1-30) and Activity(WALKING, SITTING, etc...) and taking the mean for each group.

