# Codebook for run_analysis.R

## Introduction
  There are six activities captured when subject wearing a smartphone (Samsung Galaxy S II) on the waist.
  70% of the data was used for Training and 30% of the data was used for Testing. Total observations 10299. 

###  Activity Number & Activity Labels
	1 WALKING
	2 WALKING_UPSTAIRS
	3 WALKING_DOWNSTAIRS
	4 SITTING
	5 STANDING
	6 LAYING

### Every row in the Test and Train data set is a 128 element vector.
- 3-axial raw signals, prefix 't' to denote time                         
   (tAcc-XYZ and tGyro-XYZ)

- Acceleration signal was then separated into body and gravity acceleration signals 
   (tBodyAcc-XYZ and tGravityAcc-XYZ) 

- Body linear acceleration and angular velocity were derived in time to obtain Jerk signals 
   (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ)

- 3D signals were calculated using the Euclidean norm 
   (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag)

- Fast Fourier Transform (FFT) was applied to some of these signals producing 
   (fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag)

- Others
   (tBodyGyro-XYZ,fBodyAccMag)

- Additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle() variable:
   (gravityMean, tBodyAccMean, tBodyAccJerkMean, tBodyGyroMean, tBodyGyroJerkMean)


## Raw data
###  Source:  https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
###  Files: 
- X_train.txt - 7352 obs. of  561 variables
- X_test.txt - 2947 obs. of  561 variables
- y_train.txt - 7352 obs. of   1 variable
- y_test.txt - 2947 obs. of  1 variable
- subject_test.txt
- subject_train.txt
- features.txt
- activity_labels.txt
- features_info.txt
- README.txt (See README.txt for additional information on original variables)
 
### License as Required by Authors:

####  License:
  ========
  Use of this dataset in publications must be acknowledged by referencing the following publication [1] 
  [1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. A Public Domain Dataset for Human Activity Recognition Using Smartphones. 21th European Symposium on Artificial Neural Networks, Computational Intelligence and Machine Learning, ESANN 2013. Bruges, Belgium 24-26 April 2013. 
  This dataset is distributed AS-IS and no responsibility implied or explicit can be addressed to the authors or their institutions for its use or misuse. Any commercial use is prohibited.
  

## Processed data: 
  Assignment was to output a subset of the combined Test & Train data set based on mean and standard (std) measurements.
  This subset was then grouped by Activity and Subject (group_by) and then averaged (summarise_each).

## Output:
-  Combined Test & Train data sets: XTrainTest - 10299 obs. of  564 variables
-  Subset of Combined data set: XTrainTestSub - 10299 obs. of  82 variables
-  Summarized results of Grouping & Averaging: DFsum - 180 obs of  82 variables
-  Uploaded File "tidy_data.txt" is the result of using write.table on DFsum.

## New Variables for Final Output

"Average" appended to feature lables to reflect the calculating the mean on variables with mean and standard measurements.

 [1] "ActivityLabel"                             "Subjects"                                  "ActivityNumber"                           
 [4] "Average_1_tBodyAcc-mean-X"                 "Average_2_tBodyAcc-mean-Y"                 "Average_3_tBodyAcc-mean-Z"                
 [7] "Average_4_tBodyAcc-std-X"                  "Average_5_tBodyAcc-std-Y"                  "Average_6_tBodyAcc-std-Z"                 
[10] "Average_41_tGravityAcc-mean-X"             "Average_42_tGravityAcc-mean-Y"             "Average_43_tGravityAcc-mean-Z"            
[13] "Average_44_tGravityAcc-std-X"              "Average_45_tGravityAcc-std-Y"              "Average_46_tGravityAcc-std-Z"             
[16] "Average_81_tBodyAccJerk-mean-X"            "Average_82_tBodyAccJerk-mean-Y"            "Average_83_tBodyAccJerk-mean-Z"           
[19] "Average_84_tBodyAccJerk-std-X"             "Average_85_tBodyAccJerk-std-Y"             "Average_86_tBodyAccJerk-std-Z"            
[22] "Average_121_tBodyGyro-mean-X"              "Average_122_tBodyGyro-mean-Y"              "Average_123_tBodyGyro-mean-Z"             
[25] "Average_124_tBodyGyro-std-X"               "Average_125_tBodyGyro-std-Y"               "Average_126_tBodyGyro-std-Z"              
[28] "Average_161_tBodyGyroJerk-mean-X"          "Average_162_tBodyGyroJerk-mean-Y"          "Average_163_tBodyGyroJerk-mean-Z"         
[31] "Average_164_tBodyGyroJerk-std-X"           "Average_165_tBodyGyroJerk-std-Y"           "Average_166_tBodyGyroJerk-std-Z"          
[34] "Average_201_tBodyAccMag-mean"              "Average_202_tBodyAccMag-std"               "Average_214_tGravityAccMag-mean"          
[37] "Average_215_tGravityAccMag-std"            "Average_227_tBodyAccJerkMag-mean"          "Average_228_tBodyAccJerkMag-std"          
[40] "Average_240_tBodyGyroMag-mean"             "Average_241_tBodyGyroMag-std"              "Average_253_tBodyGyroJerkMag-mean"        
[43] "Average_254_tBodyGyroJerkMag-std"          "Average_266_fBodyAcc-mean-X"               "Average_267_fBodyAcc-mean-Y"              
[46] "Average_268_fBodyAcc-mean-Z"               "Average_269_fBodyAcc-std-X"                "Average_270_fBodyAcc-std-Y"               
[49] "Average_271_fBodyAcc-std-Z"                "Average_294_fBodyAcc-meanFreq-X"           "Average_295_fBodyAcc-meanFreq-Y"          
[52] "Average_296_fBodyAcc-meanFreq-Z"           "Average_345_fBodyAccJerk-mean-X"           "Average_346_fBodyAccJerk-mean-Y"          
[55] "Average_347_fBodyAccJerk-mean-Z"           "Average_348_fBodyAccJerk-std-X"            "Average_349_fBodyAccJerk-std-Y"           
[58] "Average_350_fBodyAccJerk-std-Z"            "Average_373_fBodyAccJerk-meanFreq-X"       "Average_374_fBodyAccJerk-meanFreq-Y"      
[61] "Average_375_fBodyAccJerk-meanFreq-Z"       "Average_424_fBodyGyro-mean-X"              "Average_425_fBodyGyro-mean-Y"             
[64] "Average_426_fBodyGyro-mean-Z"              "Average_427_fBodyGyro-std-X"               "Average_428_fBodyGyro-std-Y"              
[67] "Average_429_fBodyGyro-std-Z"               "Average_452_fBodyGyro-meanFreq-X"          "Average_453_fBodyGyro-meanFreq-Y"         
[70] "Average_454_fBodyGyro-meanFreq-Z"          "Average_503_fBodyAccMag-mean"              "Average_504_fBodyAccMag-std"              
[73] "Average_513_fBodyAccMag-meanFreq"          "Average_516_fBodyBodyAccJerkMag-mean"      "Average_517_fBodyBodyAccJerkMag-std"      
[76] "Average_526_fBodyBodyAccJerkMag-meanFreq"  "Average_529_fBodyBodyGyroMag-mean"         "Average_530_fBodyBodyGyroMag-std"         
[79] "Average_539_fBodyBodyGyroMag-meanFreq"     "Average_542_fBodyBodyGyroJerkMag-mean"     "Average_543_fBodyBodyGyroJerkMag-std"     
[82] "Average_552_fBodyBodyGyroJerkMag-meanFreq"
