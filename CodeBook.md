---
title: "CodeBook"
output: html_document
---

**Overview**
The run_analysis.R script combines numerous data files from the Human Activity Recognition Using Smartphones Data Set and computes statistics on the variables that contain "mean" (mean) or "std" (standard deviation) in their variable name. The data set contains data for six different activities recorded using a Samsung smartphone for 30 subjects. The final tidy data set, which is contained in the file final_stats.txt, displays the average of each mean and std variable for each subject and is grouped by each activity. The file is organized by each subject in order, as demonstrated in the list below.

* 1  LAYING
* 1  SITTING
* 1  STANDING
* 1  WALKING
* 1  WALKING_DOWNSTAIRS
* 1  WALKING_UPSTAIRS
* 2  LAYING
* 2  SITTING
* 2  STANDING
* ...

**Variables**
The original data set contained a 561 vector with time and frequency domain variables for accelerometer and gyroscope measurements obtained from the smartphone, along with activity labels and identifiers of the subject who carried out the experiement. In this study, we were interested in further summarizing the time and frequency domain variables, therefore we did not need to work with the raw accelerometer and gyroscope measurements. 

The final dataset contains 81 variables, which are the 79 variables that contain "mean" or "std" in their name, along with "Subject", which is the identifier of the subject who carried out the experiment, and "Activity", which is the activity they were performing, i.e. WALKING, when the experiment was performed.

**Data**
The initial data sets segregated the test subjects into a "test" and "train" set, where roughly 30% of the subjects were in the test group and the rest were in the train group. In this work, we combined these two sets to view data on the entire population of subjects. The run_analysis.R script uses the following data files from the original data set:

- 'features.txt': List of all features.
- 'activity_labels.txt': Links the class labels with their activity name.
- 'train/X_train.txt': Training set.
- 'train/y_train.txt': Training labels.
- 'test/X_test.txt': Test set.
- 'test/y_test.txt': Test labels.
- 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30.

The final data shown in the final_stats.txt file contains the average of all mean and std variables for all subject. For each subject, the data is grouped by the activity performed.

**Transformations**
The following describes the transformations applied to the original data to arrive at the final tidy data set.

1. read in the test data (X_test.txt, Y_test.txt, and subject_test.txt)
2. create the test data set by adding the activity and the subject to the data and creating one matrix of data
3. read in the train data (X_train.txt, Y_train.txt, and subject_train.txt)
4. create the train data set by adding the train activity and subject to the data and creating one matrix of data
5. merge the data sets by adding the train data to the bottom of the test data set
6. add the variable labels (features.txt) as the names of the variables in the composite data set
7. extract only the mean and standard deviation measurements, along with the subject and activity into a new data set, using the grepl function
8. sort the data by subject and activity
9. change the names of the activities from numerical measurements in the data set to something meaningful, using the data from activity_labels.txt.
10. compute the average of each variable for each activity and each subject, using the aggregate function
11. present the final data ordered by subject
12. write the final data


