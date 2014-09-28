# Code book

The script `run_analysis.R`:

##### 1. download the data for the project if necessary

Here are the data for the project: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 
A full description is available at the site where the data was obtained: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

##### 2. load features names, activity labels and subjects for test and train datasets;

Features are loaded from `UCI HAR Dataset/features.txt`, activity labels from `UCI HAR Dataset/activity_labels.txt` and subjects from `UCI HAR Dataset/test/subject_test.txt` and `UCI HAR Dataset/train/subject_train.txt`.

##### 3. load test and train datasets (appropriately labeling measurements with feature names);

Datasets are loaded from fixed width formatted files `UCI HAR Dataset/test/X_test.txt` and `UCI HAR Dataset/train/X_train.txt` in which each row contains 516 float numbers in scientific notation, each one occupying 16 characters.

##### 4. load test and train datasets's labels;

Labels are loaded from `UCI HAR Dataset/test/y_test.txt` and `UCI HAR Dataset/train/y_train.txt` in which each row contains 1 integer.

##### 5. extract only mean and standard deviation of each measurement;

It was used a regular expression to extract only features that have 'mean' or 'std' in its names.

##### 6. use descriptive activity names to name the activities in the datasets;

The activity labels loaded by step 2 were added to data sets.

##### 7. merge test and train datasets, also adding subject and label to each measurement;

It was used rbind and cbind to merge the datasets.

##### 8. create tidy dataset with the average of each variable for each activity and each subject;

It was used ddply to summarize the data by subject and activity and get average of each variable.

##### 9. write tidy dataset to csv file.
