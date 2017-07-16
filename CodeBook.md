# Code Book

This code book summarizes the transformations performed on the original data and the resulting data fields in `tidy_data.txt`.

# Transformation done on original data using run_analysis()
The following has been done to achieve the tidied dataset:

1. Process names of the variables
    + Names of the variables are read from the file "features.txt"
    + Names are sanitized to replace the characters "(" ,")" and "-" (Refer to R reference documentation on make.names for definition on valid names)
    + Names are converted to lowercase
2. Process test Dataset
    + Read list of subject id from "subject_test.txt"
    + Read list of activity id from "y_test.txt"
    + Read list of data from "X_test.txt" and replace with headers from #1
    + Concatenate subject id, activity id and data together
    + Extract only the mean and standard deviation measurements for each subject id and activity id.
        + NOTE: Referring to "features_info.txt", **only** the following variables are considered as mean and standard deviation measurements
            + mean()
            + std()
3. Process train Dataset
    + Repeat the same steps for test Dataset on the train Dataset and corresponding files.
4. Processed datasets from #2 and #3 are combined.
5. The required data is then extracted
    + Read in activity names from "activity_labels.txt"
    + Merge activity names with the combined dataset from #4
    + "Activity ID" variable is then removed
5. Tidied data is derived from #5 by performing the following
    + Required data is aggregated and grouped by subject id and activity name. The aggreate function is the average i.e. arithmetic mean
    + duplicate subject id and activity name variables resulting from the aggregation is removed
    + activity names in the oberservations are converted to lowercase
    + data variable names are appened with "average_"
6. Tidied data is saved to TXT and CSV files
    

## Identifiers

* `subject` - The ID of the test subject
* `activity` - The type of activity performed when the corresponding measurements were taken

## Measurements

* 'tbodyacc_mean_x' 
* 'tbodyacc_mean_y' 
* 'tbodyacc_mean_z' 
* 'tbodyacc_std_x' 
* 'tbodyacc_std_y' 
* 'tbodyacc_std_z' 
* 'tgravityacc_mean_x' 
* 'tgravityacc_mean_y' 
* 'tgravityacc_mean_z' 
* 'tgravityacc_std_x' 
* 'tgravityacc_std_y' 
* 'tgravityacc_std_z' 
* 'tbodyaccjerk_mean_x' 
* 'tbodyaccjerk_mean_y' 
* 'tbodyaccjerk_mean_z' 
* 'tbodyaccjerk_std_x' 
* 'tbodyaccjerk_std_y' 
* 'tbodyaccjerk_std_z' 
* 'tbodygyro_mean_x' 
* 'tbodygyro_mean_y' 
* 'tbodygyro_mean_z' 
* 'tbodygyro_std_x' 
* 'tbodygyro_std_y' 
* 'tbodygyro_std_z' 
* 'tbodygyrojerk_mean_x' 
* 'tbodygyrojerk_mean_y' 
* 'tbodygyrojerk_mean_z' 
* 'tbodygyrojerk_std_x' 
* 'tbodygyrojerk_std_y' 
* 'tbodygyrojerk_std_z' 
* 'tbodyaccmag_mean' 
* 'tbodyaccmag_std' 
* 'tgravityaccmag_mean' 
* 'tgravityaccmag_std' 
* 'tbodyaccjerkmag_mean' 
* 'tbodyaccjerkmag_std' 
* 'tbodygyromag_mean' 
* 'tbodygyromag_std' 
* 'tbodygyrojerkmag_mean' 
* 'tbodygyrojerkmag_std' 
* 'fbodyacc_mean_x' 
* 'fbodyacc_mean_y' 
* 'fbodyacc_mean_z' 
* 'fbodyacc_std_x' 
* 'fbodyacc_std_y' 
* 'fbodyacc_std_z' 
* 'fbodyaccjerk_mean_x' 
* 'fbodyaccjerk_mean_y' 
* 'fbodyaccjerk_mean_z' 
* 'fbodyaccjerk_std_x' 
* 'fbodyaccjerk_std_y' 
* 'fbodyaccjerk_std_z' 
* 'fbodygyro_mean_x' 
* 'fbodygyro_mean_y' 
* 'fbodygyro_mean_z' 
* 'fbodygyro_std_x' 
* 'fbodygyro_std_y' 
* 'fbodygyro_std_z' 
* 'fbodyaccmag_mean' 
* 'fbodyaccmag_std' 
* 'fbodybodyaccjerkmag_mean' 
* 'fbodybodyaccjerkmag_std' 
* 'fbodybodygyromag_mean' 
* 'fbodybodygyromag_std' 
* 'fbodybodygyrojerkmag_mean' 
* 'fbodybodygyrojerkmag_std' 


## Activity Labels

* `walking` (value `1`): subject was walking during the test
* `walking_upstairs` (value `2`): subject was walking up a staircase during the test
* `walking_downstairs` (value `3`): subject was walking down a staircase during the test
* `sitting` (value `4`): subject was sitting during the test
* `standing` (value `5`): subject was standing during the test
* `laying' value `6`): subject was laying down during the test
