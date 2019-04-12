###############################################################################
## $Header:: "run_analysis.R"; version v 1.0.0 2019-04-12
## Author:: Rahul S. Brahmachari
##
## This R script will collect, merge, extract, transform and tidy up the data as 
## required for the "Getting and Cleaning Data Course Project".  

## This script use the plyr, data.table and dplyr libraries
## If 'plyr' package is not available, then install it
if (!require(plyr)) 
        {install.packages('plyr')}

## Load package plyr
library(plyr)

## install “data.table” if it doesn’t exist
if (!require(data.table)) 
        {install.packages('data.table')}

## Load package data.table 
library(data.table)

## If 'dplyr' package is not available, then install it
if (!require(dplyr)) 
        {install.packages('dplyr')}

## Load package dplyr
library(dplyr)

## First it will download the source data file from the Internet using the 
## specified url 
##"https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
##

fileURL <- "http://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
dataFile <- "sourcedata.zip"
## Download the source data file from the Internet
download.file(fileURL, dataFile)

## Unzip the downloaded File 
unzip(dataFile)

## Read the 8 Files

## Read 3 files for test data
testSubject <- read.table("./UCI HAR Dataset/test/subject_test.txt")
testX <- read.table("./UCI HAR Dataset/test/X_test.txt")
testY <- read.table("./UCI HAR Dataset/test/Y_test.txt")

## Read 3 files for training data
trainSubject <- read.table("./UCI HAR Dataset/train/subject_train.txt")
trainX <- read.table("./UCI HAR Dataset/train/X_train.txt")
trainY <- read.table("./UCI HAR Dataset/train/Y_train.txt")

## Read 561 features variables 
features <- read.table("./UCI HAR Dataset/features.txt")

## Read the descriptive activity names
activityLabels <- read.table("./UCI HAR Dataset/activity_labels.txt")

## Merge test (2947 observations) & train (7352 observations) data sets into a 
## single consolidated data frame with 10299 observations of 563 variables
oneset <- rbind(cbind(testSubject,testY,testX),cbind(trainSubject,trainY,trainX))

## set the variables name 
colnames(oneset) <- c("subject", "activity", as.character(features[[2]]))

##Extract Dataset: Only the measurements on the mean [column name with mean()] 
## and standard deviation [column name with std()] for each measurement are 
## extracted (i.e. 66 variables). The angle() variables and weighted average of 
## the frequency components are not considered. The extracted set has 10299 
## observations of 68 variables.
dataMeanStd <- oneset[,c(1,2,grep("mean\\(\\)|std\\(\\)", colnames(oneset)))]

## Reformatting data using descriptive activity names to name the activities 
## in the data set
dataMeanStd$activity <-  as.character(activityLabels
                        [match(dataMeanStd$activity, activityLabels$V1), 'V2'])

## Relabeling Data: Using the guidance from README.txt & features_info.txt the
## data labels have been modified. Variable names are created in lowercase 
## without any '.' or '-' or '_' as suggested in the lecture for easy 
## manipulation albeit sacrificing the easy human readability.
names(dataMeanStd) <- gsub("\\(|\\)|-", "", names(dataMeanStd),perl  = TRUE) %>% 
        gsub(pattern="Acc", replacement="Accelerometer") %>% 
        gsub(pattern="Gyro", replacement="Gyroscope") %>%
        gsub(pattern="BodyBody", replacement="Body") %>%
        gsub(pattern="Mag", replacement="Magnitude" ) %>%
        gsub(pattern="^t", replacement="Time" ) %>%
        gsub(pattern="^f", replacement="Frequency") %>%
        gsub(pattern="X",replacement="Xaxis") %>%
        gsub(pattern="Y",replacement="Yaxis") %>%
        gsub(pattern="Z",replacement="Zaxis") %>%
        tolower()

## creating the required tidy data set from the extracted dataset in previous 
## step with average of each variable for each activity and each subject. Final 
## tidy dataset contains 180 observations (30 subjects with 6 activities)
tidydata<- ddply(dataMeanStd, c("subject","activity"),
                      numcolwise(mean, na.rm = TRUE))

## Save the tidy data set created in previous step for future use. The file
## "Tidy.txt" contains 180 observations of 68 variables. Same format has been 
## maintained as in the source files. 
write.table(tidydata, file = "Tidy.txt", 
            row.names = FALSE, col.names =FALSE, quote=FALSE)

## The complete list of 68 variables of each column featured in the tidy dataset 
## saved as "Tidy.txt"  has been placed in the file "Tidy_col.txt".
write.table(names(tidydata), file = "Tidy_col.txt", 
            row.names = TRUE,col.names =FALSE, quote=FALSE)

## Remove the .zip archive file of source data set; however, keeping the 
## unzipped source data files for easy and faster verifications 
unlink(dataFile)

################ End of the script "run_analysis.R" ############################
################################################################################


