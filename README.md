# Getdata-012-Project
This repo is created for the project in the course: Getting and Cleaning Data. 

# About the Data
This is a dataset collected from the accelerometers from the Samsung Galaxy S smartphone. 

[Data](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip) can be downloaded here. [Full description](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones) can also be seen here.  

# About the `codebook.md`
Details of variables is included.

#How the `run_analysis.R` works
* Download data: This R script will create a directory `\data` under your working directory and Download data into `\data` directory as `UCI-HAR-Dataset.zip`. Unzip the file. Now all files are in `\data\UCI HAR Dataset` (You don't have to download or unzip data by yourself.)

* Step 1: Read "train" and "test" files into R: "X_train/test" are readings; "y_train/test" are activity ids; "subject_train/test" are subject ids. Create `train` and `test` data seperately, and then combine two together as one dataset called `mergedDt` using `rbind()`.

* Step 2: Load feature variable names from `features.txt` and assign those to colnames of "mergedDt".  Then select colnames containing "mean" and "std" using `grep()`, and subset those columns. 

* Step 3: Read activity names from `activity_labels.txt`. And use them to label $Activity column using `factor()`.

* Step 4:Modify variable names appropriately using `gsub()`.

* Step 5: Creates a new data set with the average of each variable for each activity and each subject using `melt()` and `dcast()` functions in the "reshape2" package. Finally, write.table() writes the dataset into `tidy_UCI_HAR_data.txt`.

# About the `tidy_UCI_HAR_data.txt`
This txt file is the cleaned tidy data created by `run_analysis.R`.

© C. Qin 2015 All Rights reserved.



