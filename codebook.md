
# The R script 'run_analysis.R' that does the following:

0. Getting and Reading UCI HAR dataset
  - downloads the file from "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip "
  - unzips the file
  - reads file inside UCI HAR dataset
  - inputs x_train, x_test, y_train, y_test, subject_test, subject_train, features, activity_labels 
1. Merges the training and the test sets to create one data set.
  - merge x_train and x_test into x_data
  - merge y_train and y_test into y_data
  - merge subject_train and subject_test into subject_data
  - named column of subject_data as "subject" and saved as factor
2. Extracts only the measurements on the mean and standard deviation for each measurement.
  - search indices in feature with the word "mean()" and "std()" 
3. Uses descriptive activity names to name the activities in the data set
  - replaced y_data with the right activity labels through merge)() and saved column as "activity"
  - saved as new_y_data
4. Appropriately labels the data set with descriptive variable names.
  - select column in x_data with "mean()" and "std()" in new_x_data
  - name columns of x_data with "mean()" and "std()"
  - merge new_y_data, new_x_data and subject_data into all_data
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
  - calculate the mean by subject and activity and saved as tidy_data
  - output tidy_data as "tidy.txt"

for the tidy data
subject column is numbered sequentially from 1 to 30.
activity column has 6 types: WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING

Here are the variables used in the tidy.txt
[1] "subject"                    
[2] "activity"                   
[3] "tBodyAcc-mean()-X"          
[4] "tBodyAcc-mean()-Y"          
[5] "tBodyAcc-mean()-Z"          
[6] "tBodyAcc-std()-X"           
[7] "tBodyAcc-std()-Y"           
[8] "tBodyAcc-std()-Z"           
[9] "tGravityAcc-mean()-X"       
[10] "tGravityAcc-mean()-Y"       
[11] "tGravityAcc-mean()-Z"       
[12] "tGravityAcc-std()-X"        
[13] "tGravityAcc-std()-Y"        
[14] "tGravityAcc-std()-Z"        
[15] "tBodyAccJerk-mean()-X"      
[16] "tBodyAccJerk-mean()-Y"      
[17] "tBodyAccJerk-mean()-Z"      
[18] "tBodyAccJerk-std()-X"       
[19] "tBodyAccJerk-std()-Y"       
[20] "tBodyAccJerk-std()-Z"       
[21] "tBodyGyro-mean()-X"         
[22] "tBodyGyro-mean()-Y"         
[23] "tBodyGyro-mean()-Z"         
[24] "tBodyGyro-std()-X"          
[25] "tBodyGyro-std()-Y"          
[26] "tBodyGyro-std()-Z"          
[27] "tBodyGyroJerk-mean()-X"     
[28] "tBodyGyroJerk-mean()-Y"     
[29] "tBodyGyroJerk-mean()-Z"     
[30] "tBodyGyroJerk-std()-X"      
[31] "tBodyGyroJerk-std()-Y"      
[32] "tBodyGyroJerk-std()-Z"      
[33] "tBodyAccMag-mean()"         
[34] "tBodyAccMag-std()"          
[35] "tGravityAccMag-mean()"      
[36] "tGravityAccMag-std()"       
[37] "tBodyAccJerkMag-mean()"     
[38] "tBodyAccJerkMag-std()"      
[39] "tBodyGyroMag-mean()"        
[40] "tBodyGyroMag-std()"         
[41] "tBodyGyroJerkMag-mean()"    
[42] "tBodyGyroJerkMag-std()"     
[43] "fBodyAcc-mean()-X"          
[44] "fBodyAcc-mean()-Y"          
[45] "fBodyAcc-mean()-Z"          
[46] "fBodyAcc-std()-X"           
[47] "fBodyAcc-std()-Y"           
[48] "fBodyAcc-std()-Z"           
[49] "fBodyAccJerk-mean()-X"      
[50] "fBodyAccJerk-mean()-Y"      
[51] "fBodyAccJerk-mean()-Z"      
[52] "fBodyAccJerk-std()-X"       
[53] "fBodyAccJerk-std()-Y"       
[54] "fBodyAccJerk-std()-Z"       
[55] "fBodyGyro-mean()-X"         
[56] "fBodyGyro-mean()-Y"         
[57] "fBodyGyro-mean()-Z"         
[58] "fBodyGyro-std()-X"          
[59] "fBodyGyro-std()-Y"          
[60] "fBodyGyro-std()-Z"          
[61] "fBodyAccMag-mean()"         
[62] "fBodyAccMag-std()"          
[63] "fBodyBodyAccJerkMag-mean()" 
[64] "fBodyBodyAccJerkMag-std()"  
[65] "fBodyBodyGyroMag-mean()"    
[66] "fBodyBodyGyroMag-std()"     
[67] "fBodyBodyGyroJerkMag-mean()"
[68] "fBodyBodyGyroJerkMag-std()"

for tidy data in tidy.txt
subject and activity column is factor
remaining variables are all numeric