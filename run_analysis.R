### Step 0: Getting and Reading the UCI HAR Dataset 

# get file from internet
fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip "
f <- file.path(getwd(), "getdata_dataset.zip")
download.file(fileURL, f)
# extract file
unzip(f)
# read train data (7352 observations)
x_train <- read.table("./UCI HAR Dataset/train/X_train.txt") # feature labels
y_train <- read.table("./UCI HAR Dataset/train/Y_train.txt") # activity labels
subject_train <- read.table("./UCI HAR Dataset/train/subject_train.txt")
# read test data (2947 observations)
x_test <- read.table("./UCI HAR Dataset/test/X_test.txt") # feature labels
y_test <- read.table("./UCI HAR Dataset/test/Y_test.txt") # activity labels
subject_test <- read.table("./UCI HAR Dataset/test/subject_test.txt")
# read data description ~ variables labels of x_test & x_train data (561)
features <- read.table("./UCI HAR Dataset/features.txt")
# read activity labels ~ join 1: walking; 2: walking_upstairs; 3: walking_down; 4: sitting...; 6: laying;
activity_labels <- read.table("./UCI HAR Dataset/activity_labels.txt")

# merge(subject_test_train); 1s 2s 3s 4s 5s 6s 7s 8s 9s 10s 11s 12s 13s 14s 15s ... 30s

### Step 1: Merges the training and the test sets to create one data set.
# merge x_data
x_data <- rbind(x_train, x_test)
# merge y_data
y_data <- rbind(y_train, y_test)
# merge subject_data
subject_data <- rbind(subject_train, subject_test)
names(subject_data)[1] <- "subject" # name as subject
subject_data$subject <- as.factor(subject_data$subject)

### Step 2: Extracts only the measurements on the mean and standard deviation for each measurement.
# extract with mean and standard deviaton
mean_std_ind <- grep(pattern = "-(mean|std)\\(\\)", x = features[,2]) 

### Step 3: Uses descriptive activity names to name the activities in the data set
# y_data with its activity labels
new_y_data <- merge(y_data, activity_labels)
new_y_data <- as.data.frame(new_y_data[,2])
names(new_y_data)[1] <- "activity"

### Step 4: Appropriately labels the data set with descriptive variable names.
# x_data with column with mean and std in it
new_x_data <- x_data[,mean_std_ind]
# add column name
names(new_x_data) <- features[mean_std_ind,2]
# merge x, y and subject data with proper labels
all_data <- cbind(new_x_data, new_y_data, subject_data)

### Step 5: From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
library(dplyr)
# get mean by each group: subject, activity
tidy_data <- all_data %>%
              group_by(subject, activity) %>%
              summarize_all(funs(mean))
tidy_data <- as.data.frame(tidy_data)
write.table(tidy_data, file = "tidy.txt", row.names = FALSE, col.names = TRUE)




