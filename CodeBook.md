CodeBook.md
-----------

The following are the variables of the resulting data set aggMeasures.csv:

Summary variables - The data set was aggregated on the following varaibles:
	- subject: One of 30 subject who took part i the study
	- activity: The movement activity measured
	- 
These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions. The measure is either
the mean (denoted mean) or the stadard deviation (denoted std). The data set aggMeasures.csv
summarizes the following measures by taking the mean of each subject and activity.
	- tBodyAcc_mean_X
	- tBodyAcc_mean_Y
	- tBodyAcc_mean_Z
	- tGravityAcc_mean_X
	- tGravityAcc_mean_Y
	- tGravityAcc_mean_Z
	- tBodyAccJerk_mean_X
	- tBodyAccJerk_mean_Y
	- tBodyAccJerk_mean_Z
	- tBodyGyro_mean_X
	- tBodyGyro_mean_Y
	- tBodyGyro_mean_Z
	- tBodyGyroJerk_mean_X
	- tBodyGyroJerk_mean_Y
	- tBodyGyroJerk_mean_Z
	- tBodyAccMag_mean
	- tGravityAccMag_mean
	- tBodyAccJerkMag_mean
	- tBodyGyroMag_mean
	- tBodyGyroJerkMag_mean
	- fBodyAcc_mean_X
	- fBodyAcc_mean_Y
	- fBodyAccJerk_mean_X
	- fBodyAccJerk_mean_Y
	- fBodyAccJerk_mean_Z
	- fBodyGyro_mean_X
	- fBodyGyro_mean_Y
	- fBodyGyro_mean_Z
	- fBodyAccMag_mean
	- fBodyBodyAccJerkMag_mean
	- fBodyBodyGyroMag_mean
	- fBodyBodyGyroJerkMag_mean
	- tBodyAcc_std_X
	- tBodyAcc_std_Y
	- tBodyAcc_std_Z
	- tGravityAcc_std_X
	- tGravityAcc_std_Y
	- tGravityAcc_std_Z
	- tBodyAccJerk_std_X
	- tBodyAccJerk_std_Y
	- tBodyAccJerk_std_Z
	- tBodyGyro_std_X
	- tBodyGyro_std_Y
	- tBodyGyro_std_Z
	- tBodyGyroJerk_std_X
	- tBodyGyroJerk_std_Y
	- tBodyGyroJerk_std_Z
	- tBodyAccMag_std
	- tGravityAccMag_std
	- tBodyAccJerkMag_std
	- tBodyGyroMag_std
	- tBodyGyroJerkMag_std
	- fBodyAcc_std_X
	- fBodyAcc_std_Y
	- fBodyAcc_std_Z
	- fBodyAccJerk_std_X
	- fBodyAccJerk_std_Y
	- fBodyAccJerk_std_Z
	- fBodyGyro_std_X
	- fBodyGyro_std_Y
	- fBodyGyro_std_Z
	- fBodyAccMag_std
	- fBodyBodyAccJerkMag_std
	- fBodyBodyGyroMag_std
	- fBodyBodyGyroJerkMag_std

The file aggMeasures.csv was created using the following files:
	- activity_labels.txt
	- features.txt
	- subject_train.txt
	- X_train.txt
	- y_train.txt
	- subject_test.txt
	- X_test.txt
	- y_train.txt

The following the tasks are performed by the script:
 	-Join the activity descriptions in activity_labels.txt with y_train.txt & y_test.txt to give a description o each activity
 	-features.txt contains a description of each column in x_train & x_test. These values will be modified to remove special characters. This list will be used to name each column.
	- x_train and subject_train will be joined to add subject to X_train 
	- x_test and subject_test will be joined to add subject to X_test 
	- X_train and y_train will be joined to add the activity to X_Train
	- X_test and y_test will be joined to add the activity to X_Test
	- x_train and x_test will be combined into one data set
	- The variables were reduced to the mean and standard deviation measures
		- The data set contains mean and meanFreq. Since meanFreq was not mentioned explicitedly in the instructions, I am not including these measures.
	- The mean of each measure is is calclauted for each subject and activity
	- The resulting data set is written to aggMeasures.csv in the workng directory.


