# load library plyr
library(plyr)

# download data if necessary
if (!file.exists("UCI HAR Dataset")) {
    download.file(
        url="https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip",
        destfile="UCI HAR Dataset.zip",
        method="curl")
    unzip("UCI HAR Dataset.zip")
}

# load feature names
features<-read.table("UCI HAR Dataset/features.txt", col.names=c("idx", "name"))

# load activity labels
labels<-read.table("UCI HAR Dataset/activity_labels.txt", col.names=c("idx", "activity"))

# load subjects for test and train datasets
subject_test<-read.table("UCI HAR Dataset/test/subject_test.txt", col.names=c("subject"))
subject_train<-read.table("UCI HAR Dataset/train/subject_train.txt", col.names=c("subject"))

# load test and train datasets (appropriately labels the data set with feature names)
x_test<-read.fwf("UCI HAR Dataset/test/X_test.txt", widths=rep(16,561), col.names=features$name, buffersize=100)
x_train<-read.fwf("UCI HAR Dataset/train/X_train.txt", widths=rep(16,561), col.names=features$name, buffersize=100)

# load test and train datasets's labels
y_test<-read.fwf("UCI HAR Dataset/test/y_test.txt", widths=c(1), col.names=c("label"), buffersize=100)
y_train<-read.fwf("UCI HAR Dataset/train/y_train.txt", widths=c(1), col.names=c("label"), buffersize=100)

# extract only mean and standard deviation of each measurement
x_test<-x_test[,grep(".*(mean|std).*", features$name, perl=TRUE)]
x_train<-x_train[,grep(".*(mean|std).*", features$name, perl=TRUE)]

# use descriptive activity names to name the activities in the datasets
y_test$activity<-labels[y_test$label,"activity"]
y_train$activity<-labels[y_train$label,"activity"]

# merge test and train datasets, also add subject and label to each measurement
dataset<-rbind(cbind(subject_test,x_test,y_test), cbind(subject_train,x_train,y_train))

# create tidy dataset with the average of each variable for each activity and each subject
tidydataset<-ddply(dataset, .(subject, activity), numcolwise(mean))

# write tidy dataset to csv file
write.csv(tidydataset, "UCI_HAR_tidy.csv", row.names=FALSE)