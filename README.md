# About run_analysis.R 
This script:
   1. Merges the training and the test sets to create one data set
   2. Extracts only the measurements on the mean and standard deviation for each measurement. 
   3. Uses descriptive activity names to name the activities in the data set
   4. Appropriately labels the data set with descriptive variable names. 
   5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

## How it works
Each group of data sets is contained in 3 tables (subject_\*,X_\* and y_\* where \*=training or test)
##### STEP 1
- Column bind the 3 tables for training and test seperately
- Row bind the training and test tables to create one data set
- Names for columns of X_\* tables come from features.txt, so load that first.
- OUTPUT: data1

##### STEP 2
- create vector of column names to include; by strict name match with '_mean_' and '_std_'.  (This is based on a strict search for '-mean()' and '-std()', a looser search (say on 'mean' and 'std') would produce more variables).
- create extract using select_ function (which allows for selection based on vector of column names)
- OUTPUT: data2

##### STEP 3
- Use activity_labels.txt for activity names
- Read in activity names and merge with data set
- OUTPUT: data3

##### STEP 4
- The 'illegal' characters such as '-', ',', '(', ')' were already replaced in step 1.
-  Remove last underscore '_' if it exists
- The original names, after replacing 'illegal' characters, are interpreted to be sufficiently descriptive in combination with CodeBook.md 
- OUTPUT: data3 (renamed)      

##### STEP 5
- Use dplyr pipe commands to group by activity and subject variables and then summarise by mean
- OUTPUT: data5
