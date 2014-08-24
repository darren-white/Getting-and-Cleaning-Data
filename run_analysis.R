##run_analysis.R

#The following files must be in the working directory:
  #activity_labels.txt
  #features.txt
  #subject_train.txt
  #X_train.txt
  #y_train.txt
  #subject_test.txt
  #X_test.txt
  #y_train.txt


#You should create one R script called run_analysis.R that does the following. 
#1. Merges the training and the test sets to create one data set.
#2. Extracts only the measurements on the mean and standard deviation for each measurement. 
#3. Uses descriptive activity names to name the activities in the data set
#4. Appropriately labels the data set with descriptive variable names. 
#5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 

#Note: The above tasks will not be executed in the order list, but will be clearly labeled.


+#First, read the tables into memory
  filename <- "activity_labels.txt"
  activity_labels <- read.table(filename)

  filename <- "features.txt"
  features <- read.table(filename)

  filename <- "subject_train.txt"
  subject_train <- read.table(filename)

  filename <- "X_train.txt"
  X_train <- read.table(filename)

  filename <- "y_train.txt"
  y_train <- read.table(filename)
  
  filename <- "subject_test.txt"
  subject_test <- read.table(filename)

  filename <- "X_test.txt"
  X_test <- read.table(filename)

  filename <- "y_test.txt"
  y_test <- read.table(filename)

#3. Use descriptive activity names to name the activities in the data set
  #Join the activity descriptions in activity_labels with y_train & y_test
  y_train <- merge(y_train, activity_labels, by.x = "V1", by.y = "V1", all = FALSE)
  y_test <- merge(y_test, activity_labels, by.x = "V1", by.y = "V1", all = FALSE)

#4. Appropriately label the data set with descriptive variable names. 
  #Name the column in subject_train & subject_test
  names(subject_train)<-c("subject")
  names(subject_test)<-c("subject")

  #Name the columns in y_train & y_test
  names(y_train)<-c("activityid","activity")
  names(y_test)<-c("activityid","activity")

  #features contains a description of each column in x_train & x_test
  #Removing/replacing characters from features to create column names
  library(stringr)
  featurelabels <- str_replace_all(features$V2, "[()]", "") # remove "(" & ")"
  featurelabels <- str_replace_all(featurelabels, "[-,]", "_") # replace "-" & "," with "_"

  #Names are formatted. Now rename columns in X_train & X_test using featurelabels
  names(X_train)<-featurelabels
  names(X_test)<-featurelabels

#1. Merge the training and the test sets to create one data set.

  #Add subject to X_train and X_test
  X_train <- cbind(subject_train, X_train)
  X_test <- cbind(subject_test, X_test)

  #Add activity to X_train and X_test
  X_train <- cbind(y_train, X_train)
  X_test <- cbind(y_test, X_test)

  #Now combine X_train & X_test
  X <- rbind(X_train, X_test)    #Everything is in 1 data set!

#2. Extract only the measurements on the mean and standard deviation for each measurement. 
  #Now to get only the mean and standard deviation measures
  #The instructions say nothing about keeping meanFrequency measures,
  #so I am excluding them
  
  # I want to include subject and activity columns
  firstcolumns <- c("subject","activity")
  
  #First, get a vector with all of the mean columns
  #I am using a regular expression with grep to pull only mean and exluding meanFreq
  #regular expression: mean[^F] - return anything containing "mean" that is NOT followed by an "F"
  #regular expression: | - this is the OR operator
  #regular expression:  mean$ - including anything that ends with "mean"
  means <- featurelabels[ grep("mean[^F]|mean$", featurelabels)]
  
  #Use grep to get anything containing std
  stdevs <- featurelabels[ grep("std", featurelabels)]

  #Now I have the list of columns that I need contained in 3 vectors
  #Use the vectors to return only the columns in X that I need
  requiredmeasures <- X[,c(firstcolumns,means, stdevs)]

#5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 
  #This will get the mean of each measure by subject & activity
  aggMeasures <- aggregate(requiredmeasures, by=list(requiredmeasures$subject,requiredmeasures$activity), FUN=mean)

  #The aggregate function created new columns Group.1 and Group.2, which are what the mean function
  #was grouped by. Group.1 is the subject and Group.2 is the activity. The subject and activity
  #columns in the resulting data frame are the calculated means for those columns, which doesn't make sense.
  #The subject and activity columns will be dropped and Group.1 and Group.2 will be renamed.
  
  #First drop subject & activity
  drops <- c("subject","activity")
  aggMeasures <- aggMeasures[,!(names(aggMeasures) %in% drops)]
  
  #Now rename Group.1 & Group.2 using the plyr function rename
  library(plyr)
  aggMeasures <- rename(aggMeasures, c("Group.1"="subject", "Group.2"="activity")) #Tidy data set!

#Write data frame to file
  write.table(aggMeasures, file = "aggMeasures.txt", sep = ",", row.names = FALSE, col.names = TRUE)
