#This is the code book 
This data was gathered from research that was performed at UCI. Most of the variable descriptions come from this site (http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones) 
and the READ.ME and features_info.txt file in the following link (https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip). 

This Code Book will give descriptions about the transformations on the original data as the links above do a great job explaining the details of how the data was collected. 

##Variables and Data Description
### The Tidy Data Set
This data set shows the mean and standard deviation measures for different motion metrics (79 metrics to be exact) for different combinations of subjects and activities these subjects performed. There are 6 possible activities each subject (person) could perform: LAYING, SITTING, STANDING, WALKING, WALKINGDOWNSTAIRS, or WALKINGUPSTAIRS. There were 30 total subjects. Therefore, there are 180 rows (6 activities X 30 subjects). The tidy data set is a 180 X 81 matrix. Each row has the subject identifier, the activity being performed, and the 79 motion metrics measured. Each motion metric is an average of the measurements from the original raw data. There were 10,299 distinct rows in the first data set before all the metrics were averaged to get 180 rows.  


###More About the Variables
Here is the long list of variables included in the tidy dataset. There are more technical details of how the motion metrics were captured in the links above. The explanation here will only discuss how they were changed from the original raw format to the tidy data set.

#####The following variables (Subjects and Action Performing) are the dimensions by which the metrics are grouped. 
1 Subjects - The individuals participating in the study. It is a unique identifier for the individual.
2	ActionPerforming - The action the person is performing in the study. The options are: 
* LAYING 
* WALKING 
* WALKING_UPSTAIRS
* WALKING_DOWNSTAIRS
* SITTING
* STANDING

#####The following metrics are grouped by subject and ActionPerforming. These metrics are averages of the original data set. 
Therefore, #3 tBodyAccmeanX for Subject 1 and WALKING is the average tBodyAccmeanX for all the Subjects 1's who were WALKING. The original data set had 561 metrics and this dataset only has 79. This tidy dataset only includes the measurements for the mean and the standard deviation and there are 79 of those metrics. There are metrics measuring the mean frequency as well. This is another way of naming the mean, therefore, it is included in the dataset as well. The first few are in list format, but in order to save space, the rest are in a paragraph format. 
* 3	tBodyAccmeanX
* 4	tBodyAccmeanY
* 5	tBodyAccmeanZ
* 6	tBodyAccstdX
* 7	tBodyAccstdY
* 8	tBodyAccstdZ
* 9	tGravityAccmeanX
* 10	tGravityAccmeanY
* 11	tGravityAccmeanZ
* 12	tGravityAccstdX
* 13	tGravityAccstdY
* 14	tGravityAccstdZ
* 15	tBodyAccJerkmeanX
* 16	tBodyAccJerkmeanY
* 17	tBodyAccJerkmeanZ
* 18	tBodyAccJerkstdX
* 19	tBodyAccJerkstdY
* 20	tBodyAccJerkstdZ
* 21	tBodyGyromeanX
* 22	tBodyGyromeanY
* 23	tBodyGyromeanZ
* 24	tBodyGyrostdX
* 25	tBodyGyrostdY
26	tBodyGyrostdZ
27	tBodyGyroJerkmeanX
28	tBodyGyroJerkmeanY
29	tBodyGyroJerkmeanZ
30	tBodyGyroJerkstdX
31	tBodyGyroJerkstdY
32	tBodyGyroJerkstdZ
33	tBodyAccMagmean
34	tBodyAccMagstd
35	tGravityAccMagmean
36	tGravityAccMagstd
37	tBodyAccJerkMagmean
38	tBodyAccJerkMagstd
39	tBodyGyroMagmean
40	tBodyGyroMagstd
41	tBodyGyroJerkMagmean
42	tBodyGyroJerkMagstd
43	fBodyAccmeanX
44	fBodyAccmeanY
45	fBodyAccmeanZ
46	fBodyAccstdX
47	fBodyAccstdY
48	fBodyAccstdZ
49	fBodyAccmeanFreqX
50	fBodyAccmeanFreqY
51	fBodyAccmeanFreqZ
52	fBodyAccJerkmeanX
53	fBodyAccJerkmeanY
54	fBodyAccJerkmeanZ
55	fBodyAccJerkstdX
56	fBodyAccJerkstdY
57	fBodyAccJerkstdZ
58	fBodyAccJerkmeanFreqX
59	fBodyAccJerkmeanFreqY
60	fBodyAccJerkmeanFreqZ
61	fBodyGyromeanX
62	fBodyGyromeanY
63	fBodyGyromeanZ
64	fBodyGyrostdX
65	fBodyGyrostdY
66	fBodyGyrostdZ
67	fBodyGyromeanFreqX
68	fBodyGyromeanFreqY
69	fBodyGyromeanFreqZ
70	fBodyAccMagmean
71	fBodyAccMagstd
72	fBodyAccMagmeanFreq
73	fBodyBodyAccJerkMagmean
74	fBodyBodyAccJerkMagstd
75	fBodyBodyAccJerkMagmeanFreq
76	fBodyBodyGyroMagmean
77	fBodyBodyGyroMagstd
78	fBodyBodyGyroMagmeanFreq
79	fBodyBodyGyroJerkMagmean
80	fBodyBodyGyroJerkMagstd
81	fBodyBodyGyroJerkMagmeanFreq


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

In order to combine them into 1 set, first the training data set (X_train.txt,y_train.txt, subject_train.txt) was combined together. The X_test data to the y_test data to the subject_test data.
* X_test.txt - 
* y_test.txt 
* subject_test.txt -
* X_train.txt - 
* y_train.txt 
* subject_train.txt -


It only gathers the mean and standard deviation values in the data set. 
