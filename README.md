## Instructions to generate tidy data

### Execute run_analysis.R in directory where raw data set is extracted. 
### This is parent folder of test data and training data i.e. "UCI HAR Dataset"

### Following are files used for analysis

* run_analysis.R - This file contains the main logic to extract and merge test and training data.
It contains utility function extractdata() which accepts subject file, activity list file, observations file, features data.frame and activity labels data.frame.
Script first creates activity_labels and features data.frames by reading activity_labels.txt and features.txt text files.
It then generates training data and test data using extractdata() function.
Training data and Test data is merged and sorted on subjectid.
Sorted data is written to tidydata.csv

* CodeBook.md - This file contains list of all variables

* tidydata.csv - This file contains merged training and test data. It contains subjectid, activity labels, mean data and standard deviations

