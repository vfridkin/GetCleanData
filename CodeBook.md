# Code Book
#### Libraries
- dplyr

#### Factor variables
###### activityName 
    name of one of six activities performed wearing a smartphone (Samsung Galaxy S II) on the waist (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING).
###### subject 
    number between 1 and 30 identifying the person who performed the activity
#### Observation variables
###### [t|f][Body|Gravity][Acc|Gyro]\<Jerk\>\<Mag\>\_[mean|std]\<\_\>\<X|Y|X\> 
- Unit Of Measure: The values of these variables are based on measurements normalised and bounded within [-1,1].  
- The square brackets, e.g. [t|f], means the first letter of the variable is a 't' or an 'f'.  (The pipe '|' stands for logical 'or').
- The angled brackets, e.g. \<Jerk\>, means this part of the name is optional (i.e. it might not be included in the name).
- t - denotes time 
- f - denotes frequency.
- Body - signal associated with the subject's body
- Gravity - signal associated with gravity
- Acc - Accelerometer source
- Gyro - Gyroscope source
- Jerk - the time rate of change of acceleration
- Mag - Magnitude of signal
- mean - denotes the mean
- std - denotes the standard deviation.
- X, Y and Z - denote the 3 possible axial signals in the X, Y and Z directions.

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
