################################################################################

###  Getting and Cleaning Data
###  taught by Jeff Leek, PhD, Brian Caffo, PhD, Roger D. Peng, PhD
###  solution by gitmijn
###  submitted on 2014-07-27

# File description for run_analysis.R:


# 1. Merges the training and the test sets to create one data set.
# 2. Extracts only the measurements on the mean and standard deviation for
#    each measurement.
# 3. Uses descriptive activity names to name the activities in the data set
# 4. Appropriately labels the data set with descriptive variable names.
# 5. Creates a second, independent tidy data set with the average of each
#    variable for each activity and each subject.

# The dataset for this script is found here
# https://d396qusza40orc.cloudfront.net/
#        getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

################################################################################

# Libraries required for this script
library(plyr)
library(reshape2)

path_data  <- "./UCI HAR Dataset/"
path_train <- paste0( path_data, "train/" )
path_test  <- paste0( path_data, "test/" )

features   <- read.table( paste0( path_data, "features.txt" ))

# Read activity_labels and rename the columns
activity_labels           <- read.table( paste0( path_data, "activity_labels.txt"))
colnames(activity_labels) <- c("activityId", "activityLabel")

# Read the training data
subject_train <- read.table(paste0( path_train,"subject_train.txt" ))
y_train       <- read.table(paste0( path_train,"y_train.txt" ))
X_train       <- read.table(paste0( path_train,"X_train.txt" ))


# Read the test data
subject_test <- read.table(paste0( path_test,"subject_test.txt"))
y_test       <- read.table(paste0( path_test,"y_test.txt"))
X_test       <- read.table(paste0( path_test,"X_test.txt"))

# Rename the X_* dataframes with features labels
colnames(X_test)  <- features$V2
colnames(X_train) <- features$V2

# Name the column on the subject's (subject_t*) column for test and train
colnames(subject_test)  <- c("subjectId")
colnames(subject_train) <- c("subjectId")


# Name the column on the activity type
names(y_test)  <- "activityId"
names(y_train) <- "activityId"

# Bind processed subject_test, y_test and X_test
df_test  <- cbind( subject_test, y_test, X_test )

# Also for bind processed subject_train, y_trian and X_train
df_train <- cbind( subject_train, y_train, X_train )

### 1. Merges the training and the test sets to create one data set.
df_merge <- rbind(df_test, df_train)

# Find all the column names containing mean* or std
# *Note: I left out the angle() measurements including mean.
# Based on the notes, these appeared to be derived data. To
# include them, add a ", ignore.case = TRUE" to this grep
muzeandsigmas <- grep('mean|std', names(df_merge) )

### 2. Select only columns with means or standard deviations
dfmusigma <- df_merge[, c(1, 2, muzeandsigmas)]

### 3. Uses descriptive activity names to name the activities in the data set
dfactivitylabels <- arrange( join( dfmusigma, activity_labels ), activityId )

# Re-arrange the activity lable to be next to the id
dfactivitylabels <- dfactivitylabels[ c(1,2,82,3:81) ]

# TODO Sort by user id X[order(X$var1)]

### 4. Appropriately labels the data set with descriptive variable names.

# Rename all columns with leading t as Time, f as Freq
renamedcolumns <- gsub("^t","time", names(dfactivitylabels))
renamedcolumns <- gsub("^f", "freq", renamedcolumns)

# Rename all -mean() to .Mean and -std() to StDev
renamedcolumns <- gsub("-mean", "Mean", renamedcolumns)
renamedcolumns <- gsub("-std", "Stdev", renamedcolumns)

# Remove all non-standard characters
renamedcolumns <- gsub("\\(\\)", "", renamedcolumns)
renamedcolumns <- gsub("\\-", "", renamedcolumns)

# Replace BodyBody with Body
renamedcolumns <- gsub("BodyBody", "Body", renamedcolumns)

# Create a new data frame with the new tidy dataset
dffinal <- dfactivitylabels

# Appy the renamed columns to the final dataset
names(dffinal) <- renamedcolumns

# Write the data set to a text file, space separated
write.table(dffinal, './final_tidy.txt',row.names=TRUE,sep='\t');

### 5. Creates a second, independent tidy data set with
###    the average of each variable for each activity and each subject.

# Melt together ids and variables
meltactivity <- melt( dffinal, id=c("subjectId", "activityId", "activityLabel"), measure.vars=c(4:82))

# Recast the melted activity as a grouped summary of results
averages <- acast( meltactivity, activityLabel ~ subjectId ~ variable, mean )

# Create a pivot table of the results, fist grouped by activity then by subject

averagefinal <- ftable(averages)

# Write the final table to a space separated text file

write.ftable(averagefinal, './final_average.txt',row.names=TRUE,sep='\t');

