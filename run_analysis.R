
require(dplyr)
library(dplyr)

#Assuming in directory with test and train folders.

#Get and verify Train Data
  Xtrain <- read.table("./train/X_train.txt", header=FALSE)
  Ytrain <- read.table("./train/y_train.txt", header=FALSE)
  subjecttrain <- read.table("./train/subject_train.txt", header = FALSE)
  dim(Xtrain)
  dim(Ytrain) 
  dim(subjecttrain)

#Get Test Data
  Xtest <- read.table("./test/X_test.txt", header=FALSE)
  Ytest <- read.table("./test/y_test.txt", header=FALSE)
  subjecttest <- read.table("./test/subject_test.txt", header = FALSE)
  dim(Xtest)
  dim(Ytest)
  dim(subjecttest)

#Get Variable labels
  features <- read.table("./features.txt", header=FALSE)
  head(features) #Two colomuns, Entry Number and Label.

#Check Variable Uniqueness
  duplicated(features$V1) # Unique Entry Number
  duplicated(features$V2) # Duplicates Labels
  head(features$V2, 337)  # See duplcates for labels ssuch as "fBodyAcc-bandsEnergy()-1,8"

#Make New Unique Variable Label V3, by combining V1 & V2
  features <- mutate(features, V3 = paste(V1,"_",V2, sep=""))  
  head(features) # Confirm new column is attached to features

#Create vector from new Unique Variable Lable V3 for renaming columns
#Use gsub to remove double parentheses for readability
  Flabels <- gsub("\\()","",c(as.character(features$V3)))

#Add variable labels from Flabels (features)
  names(Xtrain) <- Flabels
  names(Xtest) <- Flabels

#Now add Activity Numbers (Ytrain) to front of Train & Test data sets
  XyTrain <- cbind(Ytrain,Xtrain)
  XyTest <- cbind(Ytest, Xtest)

#Now add Subjects in front of Activity Numbers
  XySTrain <- cbind(subjecttrain,XyTrain)
  XySTest <- cbind(subjecttest, XyTest)

#Rename Subjects column so there are not duplicate V1s. 
  names(XySTrain) <-c("Subjects", "V1", Flabels)
  names(XySTest) <-c("Subjects", "V1", Flabels)

#merge in Activity Labels based on V1 variable (Activity Number)
#Note: merge places labels as last column
  Alabels <- read.table("./activity_labels.txt", header=FALSE)
  XySTrainA <- merge(XySTrain,Alabels,sort=FALSE)
  XySTestA <- merge(XySTest,Alabels,sort=FALSE)


#Rename Columns to reflect new variables
#This step satisfys both:
#  3.Uses descriptive activity names to name the activities in the data set
#  4.Appropriately labels the data set with descriptive variable names. 

  names(XySTrainA) <-c("ActivityNumber","Subjects", Flabels, "ActivityLabel")
  names(XySTestA) <-c("ActivityNumber", "Subjects", Flabels, "ActivityLabel")


#This step satisfys:
#  1.Merges the training and the test sets to create one data set.
#  Combine Training and Test Datasets
#  Should be 10299 objects and 564 variables (561 + ActivityNumber + Subjects + ActivityLabel")

  XTrainTest <- rbind(XySTrainA,XySTestA)
  dim(XTrainTest)  

#This step satisfys:
#  2.Extracts only the measurements on the mean and standard deviation for each measurement.
#  This creates  82 variables =  3 (Activity, Activity Number, Subjects) + 79(46 mean + 33std) 
 
  XTrainTestSub<- select(XTrainTest, matches("(Activity)+|(Subjects)+|(mean)+|(std)+", ignore.case = FALSE))

  #Note:  Using Notepad++ found 56 matches for mean and 33 matches for std. (56+33) in features.
  #  However, lines 555-561 are 10 duplicates of "Mean" used to calculate angle between measurements.
  #  The angle duplicates use "Mean" vice "mean." Do not need to ignore case.
  #     x <- (grep("mean", features$V2)) #Code to verify mean count       
  #     y <- (grep("std", features$V2))  #Code to verify std count


#This step satisfys:
#  5.From the data set in step 4, creates a second, independent tidy data set with the average of 
#  each variable for each activity and each subject.

  DF <- group_by(XTrainTestSub, ActivityLabel, Subjects)
  DFsum <- summarise_each(DF, funs(mean))

#Rename "Tidy Data" data frame to reflect that columns are Averages of features.
#Append Average to only columns 4 through 82.

  names(DFsum) <-c("ActivityLabel", "Subjects", "ActivityNumber", gsub("^", "Average_", names(DFsum[4:82])))

#Verify final results

  View(DFsum)




