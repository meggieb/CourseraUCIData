CourseraUCIData
===============

This is a repo based on the project for Coursera's Getting and Cleaning Data project. It uses data gathered at UCI.

The overall goal is to create a tidy data set with the average of each variable for each activity and each subject. Each variable should only be metrics of the mean and standard deviation.

Below shows the steps on how to recreate this tidy dataset
1. Download the original data set through this link (https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)
2. Move the entire downloaded file into the working directory
2. Copy and paste the run_analysis.R script into an RScript file in RStudio
3. Highlight the entire script and click Run
4. Open the tidydata data frame. This is the tidy dataset. 
5. THE END! 

Now, here is how the run_analysis.R script works
1. Gathers the X data from the training set using read.table
2. Since our end goal only needs data for the mean and standard deviation, the next step is to subset the data. 
In order to subset the data, there is a grep function to pull back the columns in the dataset that contain "mean" or "std". 
This function also helps capture the column names for the data set. 
3. Subsets the mean and standard deviation from this X set. 


##the training set 

#gather the X training set data

#subset the mean and std from the X set
toMatch <- c("mean", "std")
matches <- unique (grep(paste(toMatch,collapse="|"), UCIDataSetFeatures[,2],))

#clean up the columnNames 
columnNames <- unique (grep(paste(toMatch,collapse="|"), UCIDataSetFeatures[,2], value=TRUE))
r<-regexpr("\\(\\)",columnNames)
m<-regmatches(columnNames,r)
columnNames<-gsub("\\(\\)|-","", columnNames)
UCIDataSetTrainXMeanSd<-UCIDataSetTrainX[,matches]


#name the set with meaningful names
names(UCIDataSetTrainXMeanSd)<-columnNames

#gather the subject train data set
UCIDataSetTrainSubject<-read.table("UCI HAR Dataset/train/subject_train.txt", header=FALSE)
dim(UCIDataSetTrainSubject) - 7352

#name the set with meaningful names
names(UCIDataSetTrainSubject)<-"Subjects"

#gather the Y training set data
UCIDataSetTrainY<-read.table("UCI HAR Dataset/train/y_train.txt", header=FALSE)
dim(UCIDataSetTrainY) - 7352

#gather the meaningful labels of the Y data
activityLabels<-read.table("UCI HAR Dataset/activity_labels.txt",header=FALSE)

#rename the Y training set data with the meaningful labels
matchValues<-match(UCIDataSetTrainY[,1],activityLabels[,1])
UCIDataSetTrainY$labels <- activityLabels[,2][matchValues]
UCIDataSetTrainYActions<-as.data.frame(UCIDataSetTrainY[,"labels"])
names(UCIDataSetTrainYActions)<-"ActionPerforming"
dim(UCIDataSetTrainYActions) - 7352

#merge the three training data sets
UCIMergedTrainSet<-cbind(UCIDataSetTrainXMeanSd,UCIDataSetTrainSubject,UCIDataSetTrainYActions)
dim(UCIDataSetTrainXMeanSd)

##the test set 

#gather the X test set data
UCIDataSetTestX<-read.table("UCI HAR Dataset/test/X_test.txt", header=FALSE)
dim(UCIDataSetTestX) - 2947

#subset the mean and std from the X set - using some of the functions from training set
UCIDataSetTestXMeanSd<-UCIDataSetTestX[,matches]
dim(UCIDataSetTestXMeanSd) - 7352

#name the set with meaningful names
names(UCIDataSetTestXMeanSd)<-columnNames

#gather the subject test data set
UCIDataSetTestSubject<-read.table("UCI HAR Dataset/test/subject_test.txt", header=FALSE)
dim(UCIDataSetTestSubject) - 7352

#name the set with meaningful names
names(UCIDataSetTestSubject)<-"Subjects"

#gather the Y test set data
UCIDataSetTestY<-read.table("UCI HAR Dataset/test/y_test.txt", header=FALSE)
dim(UCIDataSetTestY) - 7352

#rename the Y training set data with the meaningful labels - with information from steps before
matchValues<-match(UCIDataSetTestY[,1],activityLabels[,1])
UCIDataSetTestY$labels <- activityLabels[,2][matchValues]
UCIDataSetTestYActions<-as.data.frame(UCIDataSetTestY[,"labels"])
names(UCIDataSetTestYActions)<-"ActionPerforming"
dim(UCIDataSetTestYActions) - 7352

#merge the three training data sets
UCIMergedTestSet<-cbind(UCIDataSetTestXMeanSd,UCIDataSetTestSubject,UCIDataSetTestYActions)


2/4 - bob was here
#merge the sets - 
UCIMergedSet<-rbind(UCIMergedTestSet,UCIMergedTrainSet)


library(reshape2)
meltedData<-melt(UCIMergedSet, id=c("Subjects", "ActionPerforming"))
tidyData<-dcast(meltedData, Subjects + ActionPerforming ~ variable, mean)
