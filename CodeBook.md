# Code Book
#### Libraries
- dplyr

#### Factor variables
###### activityName 
    name of activity performed wearing a smartphone (Samsung Galaxy S II) on the waist (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING).
###### subject 
    identifies of the person who performend the activity
#### Observation variables
###### [t|f][Body|Gravity][Acc|Gyro]\<Jerk\>\<Mag\>_[mean|std]\<X|Y|X\> 
- The [t|f] means the first letter of the variable is a 't' *or* an 'f'.
- The <Jerk> means this part of the name is optional (i.e. it might not be included in the name).
- The values of these variables are based on measurements normalised and bounded within [-1,1].  
- In the prefix, 't' denotes time and 'f' denotes frequency.
- Acc - Accelerometer signal
- Gyro - Gyroscope signal
- Mag - Magnitude of signal
- mean - denotes the mean
- std - denotes standard deviation.
- Variable suffixes 'X', 'Y' and 'Z' denote the 3 possible axial signals in the X, Y and Z directions.



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
