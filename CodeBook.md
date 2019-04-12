---
title: "CodeBook:: Getting & Cleaning Data Course Project"
author: "Rahul Sankar Brahmachari"
date: "April 12, 2019"
output: html_document
---
# **Getting and Cleaning Data Course Project**

### **_Overview_**
The purpose of this project is to demonstrate the ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis. 

### **_Source Data_**
[Download Link](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip "Human Activity Recognition Using Smartphones Dataset (Version 1.0)")

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data.

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.

### **_Expected Deliverables_**
 1. A tidy data set as described below:
    a. Unzip the data files from the above mentioned data source
    b. Merges the training and the test sets to create one data set.
    c. Extracts only the measurements on the mean and standard deviation for each measurement. 
    d. Uses descriptive activity names to name the activities in the data set
    e. Appropriately labels the data set with descriptive variable names. 
    f. From the data set in step e, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
    
2. A link to a Github repository with script for performing the analysis, 

3. A code book that describes the variables, the data, and any transformations or work that you performed to clean up the data called CodeBook.md; and

4. A README.md in the repo that explains how all of the scripts work and how they are connected.

## **_Data_**
The source .zip archive has total 28 files in 4 folders:

- Sub-folders and files within those folders

        -  test
                - A folder Called "Inertial Signals" that contains 9 files
                        body_acc_x_test.txt
                        body_acc_y_test.txt
                        body_acc_z_test.txt
                        body_gyro_x_test.txt
                        body_gyro_y_test.txt
                        body_gyro_z_test.txt
                        total_acc_x_test.txt
                        total_acc_y_test.txt
                        total_acc_z_test.txt
                - Three files
                        subject_test.txt
                        X_test.txt
                        y_test.txt
        -  train 
                - A folder Called "Inertial Signals" that contains 9 files
                        body_acc_x_train.txt
                        body_acc_y_train.txt
                        body_acc_z_train.txt
                        body_gyro_x_train.txt
                        body_gyro_y_train.txt
                        body_gyro_z_train.txt
                        total_acc_x_train.txt
                        total_acc_y_train.txt
                        total_acc_z_train.txt
                - Three files
                        subject_train.txt
                        X_train.txt
                        y_train.txt

- Four files under the main folder

        - activity_labels.txt,
        - features.txt,
        - features_info.txt, and
        - README.txt

For this project, six data files are mainly used - three each from test & train folders:

        -  subject_test.txt
        -  X_test.txt
        -  y_test.txt
        
        -  subject_train.txt
        -  X_train.txt
        -  y_train.txt

Two other files (activity_labels.txt [==> links for descriptive activity names to name the activities in the data set stored in the files y_test.txt & y_train.txt] and features.txt [==> Names of 561 column variables for data stored in the files X_test.txt & X_train.txt]) are used for data extraction, labeling and readability enhancement; whereas README.txt & features_info.txt provided the valuable insight about the source data.

***A Brief description of features selected for this database***

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

- tBodyAcc-XYZ
- tGravityAcc-XYZ
- tBodyAccJerk-XYZ
- tBodyGyro-XYZ
- tBodyGyroJerk-XYZ
- tBodyAccMag
- tGravityAccMag
- tBodyAccJerkMag
- tBodyGyroMag
- tBodyGyroJerkMag
- fBodyAcc-XYZ
- fBodyAccJerk-XYZ
- fBodyGyro-XYZ
- fBodyAccMag
- fBodyAccJerkMag
- fBodyGyroMag
- fBodyGyroJerkMag

The set of variables that were estimated from these signals are: 

- mean(): Mean value
- std(): Standard deviation
- mad(): Median absolute deviation 
- max(): Largest value in array
- min(): Smallest value in array
- sma(): Signal magnitude area
- energy(): Energy measure. Sum of the squares divided by the number of values.
- iqr(): Interquartile range 
- entropy(): Signal entropy
- arCoeff(): Autorregresion coefficients with Burg order equal to 4
- correlation(): correlation coefficient between two signals
- maxInds(): index of the frequency component with largest magnitude
- meanFreq(): Weighted average of the frequency components to obtain a mean frequency
- skewness(): skewness of the frequency domain signal 
- kurtosis(): kurtosis of the frequency domain signal 
- bandsEnergy(): Energy of a frequency interval within the 64 bins of the FFT of each window.
- angle(): Angle between to vectors.

Additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle() variable:

- gravityMean
- tBodyAccMean
- tBodyAccJerkMean
- tBodyGyroMean
- tBodyGyroJerkMean

The complete list of variables of each feature vector is available in 'features.txt'

The units given are g’s for the accelerometer and rad/sec for the gyro and g/sec and rad/sec/sec for the corresponding jerks.

## **_Processing_**
The task of this project has been completed in nine steps:

1. **_Downloading the source data_**

    download.file() function has been used to download the source data file from     the Internet using the specified url in [Download Link](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)
    
2. **_Unzipping the downloaded file_**

    unzip() function has been used to extract files from the zip archive downloaded in step #1.
    
3. **_Load data from files to memory_**

    read.table() function has been used to read the eight files in table format that created eight data frames - one per file, with cases corresponding to lines and variables to fields in the file.
    
4. **_Data consolidation_**

    rbind() & cbind() functions are used to join the train (7352 observations) & test (2947 observations) data sets into a single consolidated data frame with 10299 observations of 563 variables.
    
5. **_Data extraction_**

    Only the measurements on the mean [column name with mean()] and standard deviation [column name with std()] for each measurement are extracted (i.e. 66 variables):
    
    1. fBodyAccJerk-mean()-X
    2. fBodyAccJerk-mean()-Y
    3. fBodyAccJerk-mean()-Z
    4. fBodyAccJerk-std()-X
    5. fBodyAccJerk-std()-Y
    6. fBodyAccJerk-std()-Z
    7. fBodyAccMag-mean()
    8. fBodyAccMag-std()
    9. fBodyAcc-mean()-X
    10. fBodyAcc-mean()-Y
    11. fBodyAcc-mean()-Z
    12. fBodyAcc-std()-X
    13. fBodyAcc-std()-Y
    14. fBodyAcc-std()-Z
    15. fBodyBodyAccJerkMag-mean()
    16. fBodyBodyAccJerkMag-std()
    17. fBodyBodyGyroJerkMag-mean()
    18. fBodyBodyGyroJerkMag-std()
    19. fBodyBodyGyroMag-mean()
    20. fBodyBodyGyroMag-std()
    21. fBodyGyro-mean()-X
    22. fBodyGyro-mean()-Y
    23. fBodyGyro-mean()-Z
    24. fBodyGyro-std()-X
    25. fBodyGyro-std()-Y
    26. fBodyGyro-std()-Z
    27. tBodyAccJerkMag-mean()
    28. tBodyAccJerkMag-std()
    29. tBodyAccJerk-mean()-X
    30. tBodyAccJerk-mean()-Y
    31. tBodyAccJerk-mean()-Z
    32. tBodyAccJerk-std()-X
    33. tBodyAccJerk-std()-Y
    34. tBodyAccJerk-std()-Z
    35. tBodyAccMag-mean()
    36. tBodyAccMag-std()
    37. tBodyAcc-mean()-X
    38. tBodyAcc-mean()-Y
    39. tBodyAcc-mean()-Z
    40. tBodyAcc-std()-X
    41. tBodyAcc-std()-Y
    42. tBodyAcc-std()-Z
    43. tBodyGyroJerkMag-mean()
    44. tBodyGyroJerkMag-std()
    45. tBodyGyroJerk-mean()-X
    46. tBodyGyroJerk-mean()-Y
    47. tBodyGyroJerk-mean()-Z
    48. tBodyGyroJerk-std()-X
    49. tBodyGyroJerk-std()-Y
    50. tBodyGyroJerk-std()-Z
    51. tBodyGyroMag-mean()
    52. tBodyGyroMag-std()
    53. tBodyGyro-mean()-X
    54. tBodyGyro-mean()-Y
    55. tBodyGyro-mean()-Z
    56. tBodyGyro-std()-X
    57. tBodyGyro-std()-Y
    58. tBodyGyro-std()-Z
    59. tGravityAccMag-mean()
    60. tGravityAccMag-std()
    61. tGravityAcc-mean()-X
    62. tGravityAcc-mean()-Y
    63. tGravityAcc-mean()-Z
    64. tGravityAcc-std()-X
    65. tGravityAcc-std()-Y
    66. tGravityAcc-std()-Z

    The angle() variables and weighted average of the frequency components are not considered. The extracted set has 10299 observations of 68 variables (subject, activity and the above listed 66 columns for measurements with mean & standard deviation).
    
6. **_Data reformatting_**

    Data from activity_labels.txt has been used to provide the descriptive activity names to name the activities in the data set.
    
7. **_Relabeling the data set with descriptive variable name_**
    
    Using the guidance from README.txt & features_info.txt the data labels have been modified. Variable names are created in lowercase without any '.' or '-' or '_' as suggested in the lecture for easy handling albeit sacrificing the easy human readability.
    
8. **_New tidy data set_**

    ddply() function has been used to create the required tidy data set from the extracted dataset in previous step (step #7) with average of each variable for each activity and each subject. Final tidy dataset contains 180 observations of 68 variables.
    
9. **_Save tidy data_**

    write.table() function has been used to save the tidy data set created in step #8 for future use. Tidy data has been saved into two files - 
    
    - Tidy.txt : 180 observations of 68 variables without any header
    - Tidy_col.txt: The complete list of 68 variables of each column featured in the tidy dataset saved as "Tidy.txt"
    
***

## **_Tidy Dataset_**
The final independent tidy data set is a set that grouped the extracted data set of 10,299 observations into 180 observations (30 subjects and 6 activities) where 66 mean and standard deviation features are averaged for each group. It contains the following 68 columns:

01. subject
02. activity
03. timebodyaccelerometermeanxaxis
04. timebodyaccelerometermeanyaxis
05. timebodyaccelerometermeanzaxis
06. timebodyaccelerometerstdxaxis
07. timebodyaccelerometerstdyaxis
08. timebodyaccelerometerstdzaxis
09. timegravityaccelerometermeanxaxis
10. timegravityaccelerometermeanyaxis
11. timegravityaccelerometermeanzaxis
12. timegravityaccelerometerstdxaxis
13. timegravityaccelerometerstdyaxis
14. timegravityaccelerometerstdzaxis
15. timebodyaccelerometerjerkmeanxaxis
16. timebodyaccelerometerjerkmeanyaxis
17. timebodyaccelerometerjerkmeanzaxis
18. timebodyaccelerometerjerkstdxaxis
19. timebodyaccelerometerjerkstdyaxis
20. timebodyaccelerometerjerkstdzaxis
21. timebodygyroscopemeanxaxis
22. timebodygyroscopemeanyaxis
23. timebodygyroscopemeanzaxis
24. timebodygyroscopestdxaxis
25. timebodygyroscopestdyaxis
26. timebodygyroscopestdzaxis
27. timebodygyroscopejerkmeanxaxis
28. timebodygyroscopejerkmeanyaxis
29. timebodygyroscopejerkmeanzaxis
30. timebodygyroscopejerkstdxaxis
31. timebodygyroscopejerkstdyaxis
32. timebodygyroscopejerkstdzaxis
33. timebodyaccelerometermagnitudemean
34. timebodyaccelerometermagnitudestd
35. timegravityaccelerometermagnitudemean
36. timegravityaccelerometermagnitudestd
37. timebodyaccelerometerjerkmagnitudemean
38. timebodyaccelerometerjerkmagnitudestd
39. timebodygyroscopemagnitudemean
40. timebodygyroscopemagnitudestd
41. timebodygyroscopejerkmagnitudemean
42. timebodygyroscopejerkmagnitudestd
43. frequencybodyaccelerometermeanxaxis
44. frequencybodyaccelerometermeanyaxis
45. frequencybodyaccelerometermeanzaxis
46. frequencybodyaccelerometerstdxaxis
47. frequencybodyaccelerometerstdyaxis
48. frequencybodyaccelerometerstdzaxis
49. frequencybodyaccelerometerjerkmeanxaxis
50. frequencybodyaccelerometerjerkmeanyaxis
51. frequencybodyaccelerometerjerkmeanzaxis
52. frequencybodyaccelerometerjerkstdxaxis
53. frequencybodyaccelerometerjerkstdyaxis
54. frequencybodyaccelerometerjerkstdzaxis
55. frequencybodygyroscopemeanxaxis
56. frequencybodygyroscopemeanyaxis
57. frequencybodygyroscopemeanzaxis
58. frequencybodygyroscopestdxaxis
59. frequencybodygyroscopestdyaxis
60. frequencybodygyroscopestdzaxis
61. frequencybodyaccelerometermagnitudemean
62. frequencybodyaccelerometermagnitudestd
63. frequencybodyaccelerometerjerkmagnitudemean
64. frequencybodyaccelerometerjerkmagnitudestd
65. frequencybodygyroscopemagnitudemean
66. frequencybodygyroscopemagnitudestd
67. frequencybodygyroscopejerkmagnitudemean
68. frequencybodygyroscopejerkmagnitudestd

***
