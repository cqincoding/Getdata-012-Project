#The original data set:
Full description can be found here : http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

"The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. " 

The feature variables are: 
- tBodyAcc-XYZ
- tGravityAcc-XYZ
- tBodyAccJerk-XYZ
- tBodyGyro-XYZ
- tBodyGyroJerk-XYZ
- tBodyAccMag
- tGravityAccMag
- tBodyAccJerkMag
- tBodyGyroMag
- tBodyGyroJerkMag
- fBodyAcc-XYZ
- fBodyAccJerk-XYZ
- fBodyGyro-XYZ
- fBodyAccMag
- fBodyAccJerkMag
- fBodyGyroMag
- fBodyGyroJerkMag

"t" means "time", "f" means "frequency". And a set of variables that were estimated from these signals are: mean(): Mean value; std(): Standard deviation; mad(): Median absolute deviation etc. 

This project subsets "mean" and "std" variables (66 variables).

#The tidy data set:
This tidy dataset includes 68 variables.
 - Activity: 6 groups
  - Walking
  - Walking Upstairs
  - Walking Downstairs
  - Sitting
  - Standing
  - Laying
 - Subject: 30 ids.
 - 66 variables: Avarages of 66 feature variables in the original data set by Activity and Subject


