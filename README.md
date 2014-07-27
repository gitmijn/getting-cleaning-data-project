getting-cleaning-data-project
=============================

Repo for the submission of the course project for the Johns Hopkins Getting and Cleaning Data course.

### Overview

This project analyzes a [data set captured by motions sensors](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip) by performing physical activities. The goal was to demonstrate getting and cleaning data to make it a [tidy data set](http://vita.had.co.nz/papers/tidy-data.pdf).

__Note__: The explantion of this data source can be found on the [UC Irvine Machine Learning Repository page](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)

### Running This Script

To run this script, you will need a current version of R, the dataset and a couple additional R libraries. To run the script, do the following:
1. Clone this repository to a directory.
2. Download and unzip the data into that directory.
3. Source *run_analysis.R*
4. Two space delimited files will be created. They can be imported into Excel or other spreadsheet programs by using spaces as a delimiter.

### Key Decisions Made While Tidying the Data
- In this case, camelCase made more sense given the information contained within the long variable names.
- I kept all the variable with angular data. Despite being derived data (e.g., fast fourier transform), since I did not know how to calculate this myself, I kept it in the data set.
- I replaced all the variable names with *BodyBody* to *Body*.
- The column of activityIds is still in the final data set. Although this is redundent when the activity names are joined with the data frame, I thought it would be good to leave these IDs in the file. I have found IDs are much more useful when doing SQL joins.

### Libraries
This script automatically loads the following libraries:
- plyr
- reshape2


