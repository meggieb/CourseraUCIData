CourseraUCIData
===============

This is a repo based on the project for Coursera's Getting and Cleaning Data project. It uses data gathered at UCI.

The overall goal is to create a tidy data set with the average of each variable for each activity and each subject. Each variable should only be metrics of the mean and standard deviation.

Below shows the steps on how to recreate this tidy dataset
 1. Download the original data set through this link (https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)
 2. Move the entire downloaded file into the working directory
 3. Copy and paste the run_analysis.R script into an RScript file in RStudio
 4. Highlight the entire script and click Run
 5. Open the tidydata data frame. This is the tidy dataset. 
 6. THE END!

Now, here is how the run_analysis.R script works
 1. Gather the training dataset 
  1. Gather the X data from the training set using read.table
   2. Since our end goal only needs data for the mean and standard deviation, the next step is to subset the data. In order to subset the data, there is a grep function to pull back the columns in the dataset that contain "mean" or "std". This information is stored in a variable named matches.
   3. Subsets the mean and standard deviation from this X set using the variable named matches.
   4. This function also helps capture the column names for the data set. Using regular expressions, the parentheses and the dashes were extracted from the column names before the column were officially named.
  5. Now that the X data set is named for the training set, it needs to be merged with the subject information to see which subjects the information was captured for.
   6. The Subject training set is stored in UCIDataSetTrainSubject and named "Subjects"
  7. The last piece of information is the Y training data set. It shows what action each subject was performing when the data was captured
   7. The Y training dataset is stored in UCIDataSetTrainY
   8. In order for the Y training dataset to make sense, the numbers need to be renamed to the actual actions (i.e. WALKING, SITTING, etc.)
   9. It is matched using the match function. 
   10. Once the match is completed, the data set is named "ActionPerforming"
 11. All the training datasets are now combined using cbind
 2. Gather the test dataset
  3. Gather the X data from the test set using read.table
   4. Subset the dataset for the mean and standard deviation in the same way as the training set. Since all the functions were created, this step can just reuse the matches and columnNames from the training set
  5. The X test data set needs to be merged with the subject test data set in the same way as before. It is also renamed as "Subjects"
  6. The Y test data set needs to be combined as well and the same matching as above occurs so the data set includes the name of action instead of just a number
  7. All the test data is combined together using a cbind
 8. Now that the training and test data sets are created, they are merged into one data set named UCIMergedSet. This data set is created using rbind.
 9. The data set is now over 10K rows - the end goal calls for a tidy data set of averages per subject per activity. Therefore, the data set needs to be melted and cast appropriately. (almost done!)
  10. The IDs for the melted data set are "Subjects" and "ActionPerforming". There is no need to label the variables, because all of them will be used 
  11. Then it is cast using the dcast function. There will be two dimensions/ids (Subjects and ActionPerforming) and all the variables will be used. To use two ids, separate them by a + sign. Call the variables by writing variable. Also the aggregate function is mean - important part! 
  12. THIS IS IT!! You should have a tidy data set! 
