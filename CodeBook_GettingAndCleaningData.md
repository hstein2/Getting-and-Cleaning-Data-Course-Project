The source data  Human Activity Recognition Using Smartphones Data Set was taken from the url
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones Here are the data for the project: 
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

Descriptive variable names and appropriately labeling the data set with descriptive variable names
where used in the following steps


Following steps 

->The training and test sets were merged in a new created dataset.
->File reading from the url and unzipping
->Reading training and testing tables
->Reading feature vector and activity labels
->Assigning the column names
->Combining and Merging all data together in anew DataSet
->Extracting only the measurements mean and stDev for every meaure
->Reading column names
->Building a vector for mean and stDev
->Creating the subsetted data
->Creating a secondindependent tidy dataset with the average of each variable for each activity and each subject
->Making and writing of the dataset to a text file

Variables: 
Downloading Data in :x_train, y_train, x_test, y_test, subject_train, subject_test 
Combining and working parameter: x_data, y_data, subject_data
Features from the x dataset: features


