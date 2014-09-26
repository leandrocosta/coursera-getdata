# Introduction

The script `run_analysis.R`:
- download the data for the project if necessary;
- load features names, activity labels and subjects for test and train datasets;
- load test and train datasets (appropriately labeling measurements with feature names);
- load test and train datasets's labels;
- extract only mean and standard deviation of each measurement;
- use descriptive activity names to name the activities in the datasets;
- merge test and train datasets, also adding subject and label to each measurement;
- create tidy dataset with the average of each variable for each activity and each subject;
- write tidy dataset to csv file.
