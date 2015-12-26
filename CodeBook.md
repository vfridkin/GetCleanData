# Code Book
#### Libraries
- dplyr

#### Variables
###### activityName 
name of activity performed wearing a smartphone (Samsung Galaxy S II) on the waist (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING).
###### subject 
represents the person who performend the activity
###### subject 
    represents the person who performend the activity



#### Data
- features.txt - variable names for X_train and X_test.
- activity_labels.txt - activity names
- subject_train.txt/subject_test.txt - subject data (represents people)
- X_train.txt/X_test.txt - oberservation data from phones
- y_train.txt/y_test.txt - numbers representing activities

#### Cleansing transformations
- features were cleansed to removed characters that produced illegal column names (or field headings) for tables.  These included '-', ',', '(', and ')'.
- illegal characters were replaced with underscores '_'
- multiple underscores were replaced with a single underscore
- underscores at the end of a name were removed in the final data set
- features included duplicate names, however these were not an issue as they were removed from the final data sets.
