library(plyr)

# Downloading dataset

if(!file.exists("./data")){dir.create("./data")}

fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"

download.file(fileUrl,destfile="./data/Dataset.zip")


# Unzip dataSet to /data directory
 unzip(zipfile="./data/Dataset.zip",exdir="./data")
# Reading trainings tables:
 x_train <- read.table("./data/UCI HAR Dataset/train/X_train.txt")
 y_train <- read.table("./data/UCI HAR Dataset/train/y_train.txt")
 subject_train <- read.table("./data/UCI HAR Dataset/train/subject_train.txt")
 
# Reading testing tables:
 x_test <- read.table("./data/UCI HAR Dataset/test/X_test.txt")
 y_test <- read.table("./data/UCI HAR Dataset/test/y_test.txt")
 subject_test <- read.table("./data/UCI HAR Dataset/test/subject_test.txt")
 
# Reading feature vector:
 features <- read.table('./data/UCI HAR Dataset/features.txt')
 
# Reading activity labels:
  activityLabels = read.table('./data/UCI HAR Dataset/activity_labels.txt')
  
#  Assigning the column names:  
  
  colnames(x_train) <- features[,2] 
  colnames(y_train) <-"activityId"
  colnames(subject_train) <- "subjectId"
  colnames(x_test) <- features[,2] 
  colnames(y_test) <- "activityId"
  colnames(subject_test) <- "subjectId"
  colnames(activityLabels) <- c('activityId','activityType')
 
  #Combining the train and test data (Merge)
            cmb_train <- cbind(y_train, subject_train, x_train)
            cmb_test <- cbind(y_test, subject_test, x_test)
            MakeAllInOne <- rbind(cmb_train, cmb_test)
            
# Extracting only the measurements on the mean and standard deviation for each measurement          
# Reading Column Names and creating the vector for mean and stdDev for every measurement   
            colNames <- colnames(MakeAllInOne)
            mean_and_std <- (grepl("activityId" , colNames) | 
                                   grepl("subjectId" , colNames) | 
                                   grepl("mean.." , colNames) | 
                                   grepl("std.." , colNames) 
            )
  
#Making subsets            
          MakeForMeanAndStd <- MakeAllInOne[ , mean_and_std == TRUE]
#Name the activitys           
          setWithActivityNames <- merge(MakeForMeanAndStd, activityLabels,
                                            by='activityId', all.x=TRUE)
            
# Creating a second, independent tidy data set with the average of each variable for each activity and each subject:          
# Sec. Tidy data Set         
          TidyDataSet <- aggregate(. ~subjectId + activityId, setWithActivityNames, mean)
          TidyDataSet <- TidyDataSet[order(TidyDataSet$subjectId, TidyDataSet$activityId),]
#Writing second Tidy data set in file TidyDataSet.txt    
                    write.table(TidyDataSet, "TidyDataSet.txt", row.name=FALSE)