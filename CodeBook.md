# Introduction

The script `run_analysis.R`:

##### 1. download the data for the project if necessary

Here are the data for the project: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

A full description is available at the site where the data was obtained: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

##### 2. load features names, activity labels and subjects for test and train datasets;


Features are loaded from `UCI HAR Dataset/features.txt`, activity labels from `UCI HAR Dataset/activity_labels.txt` and subjects from `UCI HAR Dataset/test/subject_test.txt` and `UCI HAR Dataset/train/subject_train.txt`.

##### 3. load test and train datasets (appropriately labeling measurements with feature names);

Datasets are loaded from fixed width formatted files `UCI HAR Dataset/test/X_test.txt` and `UCI HAR Dataset/train/X_train.txt` in which each row contains 516 float numbers in scientific notation occupying 16 characters.

##### 4. load test and train datasets's labels;

Labels are loaded from `UCI HAR Dataset/test/y_test.txt` and `UCI HAR Dataset/train/y_train.txt` in which each row contains 1 integer.

##### 5. extract only mean and standard deviation of each measurement;

According to feature names (loaded from `UCI HAR Dataset/features.txt`) all features that

##### 6. use descriptive activity names to name the activities in the datasets;

##### 7. merge test and train datasets, also adding subject and label to each measurement;

##### 8. create tidy dataset with the average of each variable for each activity and each subject;

##### 9. write tidy dataset to csv file.
