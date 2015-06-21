---
title: "README"
output: html_document
---

**Directions for Generating the Tidy Data Set**

1. Download the data from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip. 
2. Unzip the data and place the script run_analysis.R in the same directory as the unzipped data, but not in the unzipped data folder.
3. Set the R working directory to the location of run_analysis.R.
4. Run the script run_analysis.R. The script will write a file called final_stats.txt, which contains the final tidy data set.
5. To view the final data set in R, look at the matrix final_stats.

**Explanation of what the Analysis Files Do**

This information is also available in the Transformations section of the CodeBook.

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