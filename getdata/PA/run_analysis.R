# assume the file "getdata_projectfiles_UCI HAR Dataset.zip"
# already unzipped in the current directory
# get the indices and names for all features
features <- read.table("UCI HAR Dataset/features.txt", col.names=c("Seq", "Name"), stringsAsFactors=F)

# get the indices of mean for each measurement
meanIdx <- grep("mean\\(\\)", features$Name)
# get the indices of standard deviation for each measurement
stdIdx <- grep("std\\(\\)", features$Name)
# get the indices for all the measurements of interest
featureIdx <- sort(c(meanIdx, stdIdx))

# clean up the names of measurements of interest
featureNames <- features$Name[featureIdx]
featureNames <- gsub("-", "_", featureNames)
featureNames <- gsub("\\(", "", featureNames)
featureNames <- gsub("\\)", "", featureNames)

# load the "activity labels" data
activity_labels <- read.table("UCI HAR Dataset/activity_labels.txt", col.names=c("ActivityId", "ActivityLabel"))

# extract features of interest from training datasets
X_train <- read.table("UCI HAR Dataset/train/X_train.txt")[featureIdx]
names(X_train) <- featureNames
y_train <- read.table("UCI HAR Dataset/train/y_train.txt")
names(y_train) <- "ActivityId"
acts_train <- merge(y_train, activity_labels, sort=F)
subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt")
names(subject_train) <- "Subject"
# form the training dataset with features of interest
trainSet <- cbind(acts_train, subject_train, X_train)

# extract features of interest from test datasets
X_test <- read.table("UCI HAR Dataset/test/X_test.txt")[featureIdx]
names(X_test) <- featureNames
y_test <- read.table("UCI HAR Dataset/test/y_test.txt")
names(y_test) <- "ActivityId"
acts_test <- merge(y_test, activity_labels, sort=F)
subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt")
names(subject_test) <- "Subject"
# form the test dataset with features of interest
testSet <- cbind(acts_test, subject_test, X_test)

# form the whole dataset with features of interest
allSet <- rbind(trainSet, testSet)

# aggregate data for required tidy dataset
tidySet <- aggregate(allSet[, 4:length(names(allSet))], by=list(allSet$ActivityLabel, allSet$Subject), mean)
# make descriptive names for features of tidy dataset
tidyNames <- paste(featureNames, "Average", sep="_")
tidyNames <- c("Activity", "Subject", tidyNames)
names(tidySet) <- tidyNames
# persist the tidy dataset
write.table(tidySet, "har_tidy.txt", sep=",", row.name=F)

