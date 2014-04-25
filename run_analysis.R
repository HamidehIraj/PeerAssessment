#by Hamideh Iraj
#http//www.linkedin.com/pub/hamideh-iraj/74/368/7b

# making train and test data frames
source("samsungData-TrainData.R")
source("samsungData-TestData.R")

# combining train and test datasets
FullData <- rbind(train,test)

#Creates a second, independent tidy data set with 
#the average of each variable for each activity and each subject.
source("NewDataSet.R")

#writing the data
write.table(FullData, file= "FullData.txt")



