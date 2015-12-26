# This script: 
#   1. Merges the training and the test sets to create one data set
#   2. Extracts only the measurements on the mean and standard deviation for each measurement. 
#   3. Uses descriptive activity names to name the activities in the data set
#   4. Appropriately labels the data set with descriptive variable names. 
#   5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

# USES:
    library(dplyr)

# STEP 1
    # Merges the training and the test sets to create one data set.
    # APPROACH:
    #   Each group of data sets is contained in 3 tables (subject_*,X_* and y_* where *=training or test).
    #   Load and clean column names from features.txt (to enable select function in step 2; it also completes most of step 4).
    #   Column bind the 3 tables for training and test seperately.
    #   Row bind the training and test tables to create one data set.
    #   Names for columns of X_* tables come from features.txt, so load that first.
    #   OUTPUT: data1

    # load data from files 

        #(dimensions are shown as rows x columns for tables, or length for vectors on the right side comment).
    
        # load column names for features as a vector (i.e. only use column V2).  NOTE contains some repeat names.
        features <- read.table("UCI HAR Dataset/features.txt")$V2 # 561
        
        # clean column names (to enable select function in step 2; it also completes most of step 4).
        features <- gsub(",","_",features)       
        features <- gsub("\\(","_",features)
        features <- gsub("\\)","_",features)
        features <- gsub("-","_",features)
        features <- gsub("__","_",features)
        features <- gsub("__","_",features)
        
        # TRAINING DATA
        subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt", col.names = c("subject"))    # 7,352 x 1
        X_train <- read.table("UCI HAR Dataset/train/X_train.txt", col.names = features)                    # 7,352 x 561 
        y_train <- read.table("UCI HAR Dataset/train/y_train.txt", col.names = c("activityNo"))             # 7,352 x 1 
    
        # TEST DATA
        subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt", col.names = c("subject"))   # 2,947 x 1
        X_test <- read.table("UCI HAR Dataset/test/X_test.txt", col.names = features)                   # 2,947 x 561
        y_test <- read.table("UCI HAR Dataset/test/y_test.txt", col.names = c("activityNo"))            # 2,947 x 1

    # column bind (includes rename of activity and subject to avoid duplicate column name 'V1').      
        data_train <- cbind(y_train, subject_train, X_train)  # 7,352 x 563 
        data_test <- cbind(y_test, subject_test, X_test)      # 2,947 x 563

    # row bind
        data1 <- rbind(data_train, data_test)   # 10,299 x 561 
                
# STEP 2
    # Extracts only the measurements on the mean and standard deviation for each measurement. 
    # APPROACH:
    #   create vector of column names to include; by strict name match with '_mean_' and '_std_' 
    #   NOTE this is based on a strict search for '-mean()' and '-std()', a looser search (say on 'mean' and 'std') would produce more variables.
    #   create extract using select_ function (which allows for selection based on vector of column names).
    #   OUTPUT: data2

    # create vector of variables to include.
        varsToInclude <- c(c("activityNo", "subject"),features[grepl('_mean_',features) | grepl('_std_',features)]) # 68 (= 2 + 66)
        
    # create extract using select_ of varsToInclude.
        data2 <- select_(data1, .dots = varsToInclude)  # 10,299 x 68

# STEP 3
    # Uses descriptive activity names to name the activities in the data set.    
    # APPROACH:
    #   Use activity_labels.txt for activity names.
    #   Read in activity names and merge with data set.
    #   OUTPUT: data3
            
    # Load activity names
        activityNames <- read.table("UCI HAR Dataset/activity_labels.txt", col.names = c("activityNo", "activityName"))  # 6 x 2 
    
    # Add activity names column using merge, and remove activityNo (in anticipation of keeping a tidy data set).
        data3 <- merge(activityNames, data2)[,-1]    # 10,299 x 68
        
# STEP 4
    # Appropriately labels the data set with descriptive variable names.
    # APPROACH:
    #   The 'illegal' characters such as '-', ',', '(', ')' were already replaced in step 1.
    #   Here, just remove last underscore '_' if it exists.
    #   The original names, after replacing 'illegal' characters, are interpreted to be sufficiently descriptive in combination with CodeBook.md 
    #   OUTPUT: data3 (renamed)      
        names(data3) <- gsub("_$","",names(data3))  # 68

# STEP 5
    # From the data set in step 4 (data3), create an independent tidy data set with the average of each variable for each activity and each subject.    
    # APPROACH:
    #   Use dplyr pipe commands to group by activity and subject variables and then summarise by mean.
    #   OUTPUT: data5
        data5 <- data3 %>% group_by(activityName, subject) %>% summarize_each(funs(mean))   # 180 x 68
        
