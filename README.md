---
title: "ReadMe"
author: "Heinrich Ziegler"
date: "10/22/2020"
output:
  word_document: default
  html_document: default
---

## Peer-graded Assignment: Getting and Cleaning Data Course Project

All the coding and documenting of this assignment has been performed by Heinrich Ziegler as per instructions

### Data Set
#### Human Activity Recognition Using Smartphones Data Set

URL: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

Description: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

## Files Delivered for Project

- run_analysis.R: This files performs all operations from loading the data, unzipping it ito the appropriate sub-folder, and then executing the requested 5-steps for completions of project:

  - Merges the training and the test sets to create one data set.

  - Extracts only the measurements on the mean and standard deviation for each measurement.

  - Uses descriptive activity names to name the activities in the data set

  - Appropriately labels the data set with descriptive variable names.

  - From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
 
- CodeBook.md: The associated code book, decribing the individual steps performed in the run_analysis.R file

- SummaryData.txt: The solution data file, containing the tidy, summarized data
