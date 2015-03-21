## This R script subsets and cleans a "UCI HAR Dataset".
## Download the zip file into "data" directory under your working directy, and unzip it 
if (!file.exists("./data")) {dir.create("./data")}
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileUrl, destfile = "./data/UCI-HAR-Dataset.zip")
dateDownloaded <- date()
unzip("./data/UCI-HAR-Dataset.zip", exdir = "./data/.", overwrite=TRUE)

# 1. Merges the training and the test sets to create one data set.
# reads train and test readings(X), activity labels (y), subject ids (subject)
y_train <- read.csv("./data/UCI HAR Dataset/train/y_train.txt", sep = "", header=FALSE) 
X_train <- read.csv("./data/UCI HAR Dataset/train/X_train.txt", sep = "", header=FALSE)
subject_train <- read.csv("./data/UCI HAR Dataset/train/subject_train.txt", sep = "", header=FALSE) 
trainDt <- cbind(y_train, subject_train, X_train)

y_test <- read.csv("./data/UCI HAR Dataset/test/y_test.txt", sep = "", header=FALSE)
X_test <- read.csv("./data/UCI HAR Dataset/test/X_test.txt", sep = "", header=FALSE)
subject_test <- read.csv("./data/UCI HAR Dataset/test/subject_test.txt", sep = "", header=FALSE)
testDt <- cbind(y_test, subject_test, X_test)

mergedDt <- rbind(trainDt, testDt)

# 2. Extracts only the measurements on the mean and standard deviation for each measurement. 
features <- read.csv("./data/UCI HAR Dataset/features.txt",  sep = "", header=FALSE )
names(mergedDt) <- c("Activity", "Subject", as.character(features[,2]))
meanstds <- grep("(mean|std)\\(\\)", names(mergedDt))
mergedDt <- mergedDt[, c(1,2,meanstds)]

# 3. Uses descriptive activity names to name the activities in the data set
activitylabel <- read.csv("./UCI HAR Dataset/activity_labels.txt",  sep = "", header=FALSE )
mergedDt$Activity <- factor(mergedDt$Activity, labels =activitylabel[, 2])

# 4. Appropriately labels the data set with descriptive variable names. 
# remove "()", "-"; capitalize "mean", "std"; 
names(mergedDt) <- gsub("\\(\\)", "", names(mergedDt)) 
names(mergedDt) <- gsub("-", "", names(mergedDt)) 
names(mergedDt) <- gsub("mean", "Mean", names(mergedDt)) 
names(mergedDt) <- gsub("std", "Std", names(mergedDt))
names(mergedDt) <- gsub("BodyBody", "Body", names(mergedDt))

# 5. creates a  tidy data set with the average of each variable for each activity and each subject.
install.packages("reshape2")
library(reshape2)
meltDt <- melt(mergedDt, id = c("Activity", "Subject"))
tidyDt <- dcast(meltDt, Activity + Subject ~ variable, mean)

# write the tidy data into a .txt file
write.table(tidyDt, file="./data/tidy_UCI_HAR_data.txt", sep=" ", row.names=FALSE)
