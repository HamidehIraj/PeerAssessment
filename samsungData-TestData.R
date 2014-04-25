
# Loading data into R
body_acc_x_test <- read.table ("file:///D:/coursera/Data Science Specialization/Getting and Cleaning Data/Peer Assessment/UCI HAR Dataset/UCI HAR Dataset/test/Inertial Signals/body_acc_x_test.txt")
body_acc_y_test <- read.table ("file:///D:/coursera/Data Science Specialization/Getting and Cleaning Data/Peer Assessment/UCI HAR Dataset/UCI HAR Dataset/test/Inertial Signals/body_acc_y_test.txt")
body_acc_z_test <- read.table ("file:///D:/coursera/Data Science Specialization/Getting and Cleaning Data/Peer Assessment/UCI HAR Dataset/UCI HAR Dataset/test/Inertial Signals/body_acc_z_test.txt")
#--------------------------------
body_gyro_x_test <- read.table ("file:///D:/coursera/Data Science Specialization/Getting and Cleaning Data/Peer Assessment/UCI HAR Dataset/UCI HAR Dataset/test/Inertial Signals/body_gyro_x_test.txt")
body_gyro_y_test <- read.table ("file:///D:/coursera/Data Science Specialization/Getting and Cleaning Data/Peer Assessment/UCI HAR Dataset/UCI HAR Dataset/test/Inertial Signals/body_gyro_y_test.txt")
body_gyro_z_test <- read.table ("file:///D:/coursera/Data Science Specialization/Getting and Cleaning Data/Peer Assessment/UCI HAR Dataset/UCI HAR Dataset/test/Inertial Signals/body_gyro_z_test.txt")
#--------------------------------
# total_acc_x_test <- read.table ("file:///D:/coursera/Data Science Specialization/Getting and Cleaning Data/Peer Assessment/UCI HAR Dataset/UCI HAR Dataset/test/Inertial Signals/total_acc_x_test.txt")
# total_acc_y_test <- read.table ("file:///D:/coursera/Data Science Specialization/Getting and Cleaning Data/Peer Assessment/UCI HAR Dataset/UCI HAR Dataset/test/Inertial Signals/total_acc_y_test.txt")
# total_acc_z_test <- read.table ("file:///D:/coursera/Data Science Specialization/Getting and Cleaning Data/Peer Assessment/UCI HAR Dataset/UCI HAR Dataset/test/Inertial Signals/total_acc_z_test.txt")


#Calculating rowMeans
body_acc_x_test_mean   <- as.data.frame(t(t(as.matrix(rowMeans(body_acc_x_test,dims=1)))))
body_acc_y_test_mean   <- as.data.frame(t(t(as.matrix(rowMeans(body_acc_y_test,dims=1)))))
body_acc_z_test_mean   <- as.data.frame(t(t(as.matrix(rowMeans(body_acc_z_test,dims=1)))))
#--------------------------------------------------------
body_gyro_x_test_mean  <- as.data.frame(t(t(as.matrix(rowMeans(body_gyro_x_test,dims=1)))))
body_gyro_y_test_mean  <- as.data.frame(t(t(as.matrix(rowMeans(body_gyro_y_test,dims=1)))))
body_gyro_z_test_mean  <- as.data.frame(t(t(as.matrix(rowMeans(body_gyro_z_test,dims=1)))))
#--------------------------------------------------------
# total_acc_x_test_mean  <- as.data.frame(t(t(as.matrix(rowMeans(total_acc_x_test,dims=1)))))
# total_acc_y_test_mean  <- as.data.frame(t(t(as.matrix(rowMeans(total_acc_y_test,dims=1)))))
# total_acc_z_test_mean  <- as.data.frame(t(t(as.matrix(rowMeans(total_acc_z_test,dims=1)))))

#dim(body_acc_x_test_mean )
#---------------------------------------------------------------
# Calculating Standard Deviation

require(matrixStats,quietly=TRUE)


body_acc_x_test_sd   <- as.data.frame(t(t(rowSds(body_acc_x_test))))
body_acc_y_test_sd   <- as.data.frame(t(t(rowSds(body_acc_y_test))))
body_acc_z_test_sd   <- as.data.frame(t(t(rowSds(body_acc_z_test))))
#------------------------------------------------------------------
body_gyro_x_test_sd  <- as.data.frame(t(t(rowSds(body_gyro_x_test))))
body_gyro_y_test_sd  <- as.data.frame(t(t(rowSds(body_gyro_y_test))))
body_gyro_z_test_sd  <- as.data.frame(t(t(rowSds(body_gyro_z_test))))
#------------------------------------------------------------------
# total_acc_x_test_sd  <- as.data.frame(t(t(rowSds(total_acc_x_test))))
# total_acc_y_test_sd  <- as.data.frame(t(t(rowSds(total_acc_y_test))))
# total_acc_z_test_sd  <- as.data.frame(t(t(rowSds(total_acc_z_test))))

#dim(body_acc_x_test_sd)
#------------------------------------------------------------------------
subject_test <- read.table ("file:///D:/coursera/Data Science Specialization/Getting and Cleaning Data/Peer Assessment/UCI HAR Dataset/UCI HAR Dataset/test/subject_test.txt")

#X_test      <- read.table ("file:///D:/coursera/Data Science Specialization/Getting and Cleaning Data/Peer Assessment/UCI HAR Dataset/UCI HAR Dataset/test/X_test.txt")
Y_test      <- read.table ("file:///D:/coursera/Data Science Specialization/Getting and Cleaning Data/Peer Assessment/UCI HAR Dataset/UCI HAR Dataset/test/Y_test.txt",stringsAsFactors=FALSE)
#-----------------------------------------------------------------------

# Replacing column names
Y_test$V2 <- Y_test$V1
names(Y_test) <- c("ActivityID","Activity")
str(Y_test)

activity_labels <- read.table ("file:///D:/coursera/Data Science Specialization/Getting and Cleaning Data/Peer Assessment/UCI HAR Dataset/UCI HAR Dataset/activity_labels.txt",stringsAsFactors=FALSE)
names(activity_labels) <- c("ActivityID","Activity")
#str(activity_labels)


for (i in (1:nrow(activity_labels)))
    {
    Y_test[which(Y_test$ActivityID == activity_labels[i,1]),2 ] <- activity_labels[i,2]
    }
 
# Y_test$Activity[Y_test$Activity == 1] <- "walking"
# Y_test$Activity[Y_test$Activity == 2] <- "walking_upstairs"
# Y_test$Activity[Y_test$Activity == 3] <- "walking_downstairs"
# Y_test$Activity[Y_test$Activity == 4] <- "sitting"
# Y_test$Activity[Y_test$Activity == 5] <- "standing"
# Y_test$Activity[Y_test$Activity == 6] <- "laying"
#--------------------------------------------------------------------------
#combining dataframes
test             <- cbind(subject_test, Y_test,
                           body_acc_x_test_mean,  body_acc_y_test_mean , body_acc_z_test_mean , 
                           body_acc_x_test_sd,    body_acc_y_test_sd,    body_acc_z_test_sd,
                          
                           body_gyro_x_test_mean, body_gyro_y_test_mean, body_gyro_z_test_mean,
                           body_gyro_x_test_sd ,  body_gyro_y_test_sd ,  body_gyro_z_test_sd )
                           
#                            total_acc_x_test_mean, total_acc_y_test_mean, total_acc_z_test_mean,            
#                            total_acc_x_test_sd ,  total_acc_y_test_sd ,  total_acc_z_test_sd )

features <- read.table ("file:///D:/coursera/Data Science Specialization/Getting and Cleaning Data/Peer Assessment/UCI HAR Dataset/UCI HAR Dataset/features.txt")

names(test) <- c("subjectID","ActivityID","Activity",
                 as.character(features[1:6,2]),
                 as.character(features[121:126,2])
                 )


                           