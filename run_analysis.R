## read in the test data
test_data <- read.table("./UCI HAR Dataset/test/X_test.txt")
test_data <- data.matrix(test_data)
test_activity <- read.table("./UCI HAR Dataset/test/Y_test.txt")
test_subject <- read.table("./UCI HAR Dataset/test/subject_test.txt")

## create the test data set by adding the activity and the subject
all_test_data <- cbind(test_subject,test_activity,test_data)

## read in the train data
train_data <- read.table("./UCI HAR Dataset/train/X_train.txt")
train_data <- data.matrix(train_data)
train_activity <- read.table("./UCI HAR Dataset/train/Y_train.txt")
train_subject <- read.table("./UCI HAR Dataset/train/subject_train.txt")

## create the train data set by adding the train activity and subject
all_train_data <- cbind(train_subject,train_activity,train_data)

## merge the data sets by adding the train data to the bottom of the test data set
all_data <- rbind(all_test_data,all_train_data)

## add the variable labels as the names
first_labels <- c("Subject","Activity")
column_labels_table <- read.table("./UCI HAR Dataset/features.txt")
column_labels <- lapply(column_labels_table$V2,as.character)
all_column_labels <- c(first_labels,column_labels)
all_data_frame <- data.frame(all_data)
colnames(all_data_frame) <- all_column_labels

## extract only the mean and standard deviation measurements, along with the subject and activity
data_mean_std <- all_data_frame[,(grepl("mean",as.character(names(all_data_frame))) | 
                               grepl("std",as.character(names(all_data_frame))) | 
                               grepl("Subject",as.character(names(all_data_frame))) |
                               grepl("Activity",as.character(names(all_data_frame))))]

## sort the data by subject and activity
df_final <- data_mean_std[order(data_mean_std$Subject,data_mean_std$Activity),]

## change the names of the activities in the data set to something meaningful
df_final$Activity[df_final$Activity == "1"] <- "WALKING"
df_final$Activity[df_final$Activity == "2"] <- "WALKING_UPSTAIRS"
df_final$Activity[df_final$Activity == "3"] <- "WALKING_DOWNSTAIRS"
df_final$Activity[df_final$Activity == "4"] <- "SITTING"
df_final$Activity[df_final$Activity == "5"] <- "STANDING"
df_final$Activity[df_final$Activity == "6"] <- "LAYING"

## compute the average of each variable for each activity and each subject
df_final_by_subject_by_activity <- aggregate(. ~ Subject+Activity, data = df_final, FUN = mean)

## present the final data ordered by subject
final_stats <- df_final_by_subject_by_activity[order(df_final_by_subject_by_activity$Subject),]

## write the final data
write.table(final_stats,"final_stats.txt",row.names = FALSE)