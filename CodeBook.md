#This is the code book 

##Variables and Data Description
### The Tidy Data Set
This data set shows the mean and standard deviation measures for different motion metrics (79 metrics to be exact) for different combinations of subjects and tasks these subjects performed. There are 6 possible actions each subject (person) could perform: LAYING, SITTING, STANDING, WALKING, WALKINGDOWNSTAIRS, WALKINGUPSTAIRS. There were 30 total subjects. Therefore, there are 180 rows (6 activities X 30 subjects). The tidy data set is a 180 X 81 matrix. Each row has the subject identifier, the action being performed, and the 79 motion metrics measured. Each motion metric is an average of the measurements in the raw data. There were 10,299 rows in the first data set before all the metrics were averaged to get 180 rows.  


##More About the Variables
This data was gathered from research that was performed at UCI. Most of the variable descriptions come from this site (http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones) 
and the READ.ME and features_info.txt file in the following link (https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip). 

This Code Book will give descriptions about the transformations on the original data as the links above do a great job explaining the details of how the data was collected. 

After the data was collected 
It collects data from 30 
volunteers


##Data Description

##Transformation/Work to Clean Data from Raw Form
This data set is a pared down version of the original found in the zip file included in the first section.

The original data set (found in the zip file) contained 10 separate files that were used (there were more files but not all were not used). For each record in the files, the following data was captured
* 561-feature vector of metrics 
* ID of the activity being performed 
* ID of the subject performing the activity


In order to gather this data, transformation was involved. Following are the steps for the transformation. 
Out of the 10 files mentioned, four were used for explanation. These were 
* features_info.txt - Explanation of the 561 metrics captured on each subject
* features.txt - Labels of the 561 metrics captured on each subject
* activity_labels.txt - A lookup table for each action the subject performed. (i.e. 1=WALKING, 2=SITTING, etc.)
* README.txt - Explaination of the data set and how the data was captured

Six of these files were the raw data files: 2 X files, 2 Y files, and 2 subject files. These files are not duplicates - the reason for the 2 of each were that 1 was a training set and the other was a test set. They needed to be combined into 1 set. 

In order to combine them into 1 set, first the training data was combined together with cbind. The X_test data to the y_test data to the subject_test data.
* X_test.txt - 
* y_test.txt 
* subject_test.txt -
* X_train.txt - 
* y_train.txt 
* subject_train.txt -


It only gathers the mean and standard deviation values in the data set. 
