# GettingAndCleaningDataClassProject
Class Project for Cousera class "Getting and Cleaning Data"
Author:RickR


run_analysis.R does the following:

Goals
  1. Merges the training and the test sets to create one data set.
  2. Extracts only the measurements on the mean and standard deviation for each measurement.
  3. Uses descriptive activity names to name the activities in the data set
  4. Appropriately labels the data set with descriptive activity names.
  5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject.

Running
  To run the script
  1. checkout the repo
  2. source run_analysis.R
  3. ensure that you have the "dplyr" package installed.
  4. you have the required Samsung data

Data Source
  https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

Process
  Assuming in directory with Samsung test and train folders.
  1. Get Train and Subject Data with read.table
  2. Get Test and Subject Data with read.table
  3. Get Variable labels
  4. Check Variable Uniqueness and create new unique variable
  5. Create vector from new Unique Variable for easier column renaming
  6. Add variable labels from Flabels (features)to Test & Train Data Sets
  7. Add Activity Number to Test & Train Data Sets (cbind)
  7. Now add Subjects to Test & Train Data Sets (cbind)
  8. Merge in Activity Labels based on Activity Number for both Test & Train (merge)
  9. Rename Columns into reflect new variables in both Test & Train
  10. Now combine both Test & Train (rbind)
  11. Subset/extract only mean and standard deviation (select)
  12. Create independent tidy data set with the average of each variable for each activity and each subject 
  13. Rename "Tidy Data" data frame to reflect that columns are Averages of features.

  

