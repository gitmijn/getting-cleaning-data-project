### CodeBook - Course Project
#### Getting and Cleanind Data Course Project

### Overview
This is the codebook for the Getting and Cleaning Data course on Coursera
by Jeff Leek, PhD, Brian Caffo, PhD, Roger D. Peng, PhD

### Background
The raw signals were created by 30 volunteers wearing smartphones with intnertial sensors. The full background can be found in the README.txt of the [source data zip file](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip). The format of the codebook is based on the [ codebook from Quiz 1 ](https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FPUMSDataDict06.pdf) of the course.

The source data is manipulated to produce two outputs. The variables are renamed to be the following:

##### subjectId
  - This is the id of the subject
    - 1..30

##### activityId
  - The id of the activity, (*e.g., WALKING*).
    - 1..6

##### activityLabel
  - The corresponding label for the activity ID. Taken from activity_labels.txt
    - 1 WALKING
    - 2 WALKING_UPSTAIRS
    - 3 WALKING_DOWNSTAIRS
    - 4 SITTING
    - 5 STANDING
    - 6 LAYING
     

The rest of the variables are the means (i.e., Mean) or standard deviation (i.e., Stdev) from the file. Measurements are either time (prefix of time) or frequency. (prefix of frequency)

| Variable Name               |
|-----------------------------|
| timeBodyAccMeanXYZ          |
| timeBodyAccStdevXYZ         |
| timeGravityAccMeanXYZ       |
| timeGravityAccStdevXYZ      |
| timeBodyAccJerkMeanXYZ      |
| timeBodyAccJerkStdevXYZ     |
| timeBodyGyroMeanXYZ         |
| timeBodyGyroStdevXYZ        |
| timeBodyGyroJerkMeanXYZ     |
| timeBodyGyroJerkStdevXYZ    |
| timeBodyAccMagMean          |
| timeBodyAccMagStdev         |
| timeGravityAccMagMean       |
| timeGravityAccMagStdev      |
| timeBodyAccJerkMagMean      |
| timeBodyAccJerkMagStdev     |
| timeBodyGyroMagMean         |
| timeBodyGyroMagStdev        |
| timeBodyGyroJerkMagMean     |
| timeBodyGyroJerkMagStdev    |
| freqBodyAccMeanX            |
| freqBodyAccMeanY            |
| freqBodyAccMeanZ            |
| freqBodyAccStdevX           |
| freqBodyAccStdevY           |
| freqBodyAccStdevZ           |
| freqBodyAccMeanFreqXYZ      |
| freqBodyAccJerkMeanXYZ      |
| freqBodyAccJerkStdevXYZ     |
| freqBodyAccJerkMeanFreqXYZ  |
| freqBodyGyroMeanXYZ         |
| freqBodyGyroStdevXYZ        |
| freqBodyGyroMeanFreqXYZ     |
| freqBodyAccMagMean          |
| freqBodyAccMagStdev         |
| freqBodyAccMagMeanFreq      |
| freqBodyAccJerkMagMean      |
| freqBodyAccJerkMagStdev     |
| freqBodyAccJerkMagMeanFreq  |
| freqBodyGyroMagMean         |
| freqBodyGyroMagStdev        |
| freqBodyGyroMagMeanFreq     |
| freqBodyGyroJerkMagMean     |
| freqBodyGyroJerkMagStdev    |
| freqBodyGyroJerkMagMeanFreq |
