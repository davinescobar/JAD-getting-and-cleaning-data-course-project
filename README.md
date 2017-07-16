Readme
===============================================================================

This document provides exact instructions on how prepare the environment to run
the R code to create the tidy dataset. 

A summary of the repository content is also given.

__References:__

1.Getting and Cleaning Data Course Project [Assignment Page](https://www.coursera.org/learn/data-cleaning/peer/FIZtT/getting-and-cleaning-data-course-project/submit).
   
# Contents
This section describes the contents of this repository.

Filename          | Description
----------------  | -------------
run_analysis.R    | Function to transform the data
README.md         | REadme file
CodeBook.md       | Variable description

## Environment setup
In order to succesfully run the script, the following steps have to be taken:

0. R environment has been installed in your computer

1. The raw dataset has been downloaded from: (https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip).

2. The previous file has been extracted into your R Directory.(folder name: "UCI HAR Dataset")

## Running the script
In order to run the code:

1. Source the run analysis function into R and run the function.

```r
source('run_analysis.R'))
run_analysis()
```
2\. The output files of the script are - "tidy_data.csv" and "tidy_data.txt".

3\. In order to read the created files please use the following:

```r
# Read "tidy_data.txt"
read.table("tidy_data.txt", header=TRUE)
# Read "tidy_data.csv"
read.csv("tidy_data.csv", sep = ",", header = TRUE)
```