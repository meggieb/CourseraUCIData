#merge the training and test sets


##the training set

#gather the X training set data
UCIDataSetTrainX<-read.table("UCI HAR Dataset/train/X_train.txt", header=FALSE)

#subset the mean and std from the X set
toMatch <- c("mean", "std")
UCIDataSetFeatures<-read.table("UCI HAR Dataset/features.txt", header=FALSE)
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


#name the set with meaningful names
names(UCIDataSetTrainSubject)<-"Subjects"

#gather the Y training set data
UCIDataSetTrainY<-read.table("UCI HAR Dataset/train/y_train.txt", header=FALSE)


#gather the meaningful labels of the Y data
activityLabels<-read.table("UCI HAR Dataset/activity_labels.txt",header=FALSE)

#rename the Y training set data with the meaningful labels
matchValues<-match(UCIDataSetTrainY[,1],activityLabels[,1])
UCIDataSetTrainY$labels <- activityLabels[,2][matchValues]
UCIDataSetTrainYActions<-as.data.frame(UCIDataSetTrainY[,"labels"])
names(UCIDataSetTrainYActions)<-"ActionPerforming"


#merge the three training data sets
UCIMergedTrainSet<-cbind(UCIDataSetTrainXMeanSd,UCIDataSetTrainSubject,UCIDataSetTrainYActions)


##the test set

#gather the X test set data
UCIDataSetTestX<-read.table("UCI HAR Dataset/test/X_test.txt", header=FALSE)


#subset the mean and std from the X set - using some of the functions from training set
UCIDataSetTestXMeanSd<-UCIDataSetTestX[,matches]


#name the set with meaningful names
names(UCIDataSetTestXMeanSd)<-columnNames

#gather the subject test data set
UCIDataSetTestSubject<-read.table("UCI HAR Dataset/test/subject_test.txt", header=FALSE)


#name the set with meaningful names
names(UCIDataSetTestSubject)<-"Subjects"

#gather the Y test set data
UCIDataSetTestY<-read.table("UCI HAR Dataset/test/y_test.txt", header=FALSE)


#rename the Y training set data with the meaningful labels - with information from steps before
matchValues<-match(UCIDataSetTestY[,1],activityLabels[,1])
UCIDataSetTestY$labels <- activityLabels[,2][matchValues]
UCIDataSetTestYActions<-as.data.frame(UCIDataSetTestY[,"labels"])
names(UCIDataSetTestYActions)<-"ActionPerforming"


#merge the three training data sets
UCIMergedTestSet<-cbind(UCIDataSetTestXMeanSd,UCIDataSetTestSubject,UCIDataSetTestYActions)

#merge the sets -
UCIMergedSet<-rbind(UCIMergedTestSet,UCIMergedTrainSet)

#create the tidy data set 
#load the reshape2 library
library(reshape2)

#melt the data - ids are Subjects and ActionPerforming
meltedData<-melt(UCIMergedSet, id=c("Subjects", "ActionPerforming"))

#cast the data with two ids
tidyData<-dcast(meltedData, Subjects + ActionPerforming ~ variable, mean)

