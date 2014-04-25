
# Loading data into R
body_acc_x_train <- read.table ("file:///D:/coursera/Data Science Specialization/Getting and Cleaning Data/Peer Assessment/UCI HAR Dataset/UCI HAR Dataset/train/Inertial Signals/body_acc_x_train.txt")
body_acc_y_train <- read.table ("file:///D:/coursera/Data Science Specialization/Getting and Cleaning Data/Peer Assessment/UCI HAR Dataset/UCI HAR Dataset/train/Inertial Signals/body_acc_y_train.txt")
body_acc_z_train <- read.table ("file:///D:/coursera/Data Science Specialization/Getting and Cleaning Data/Peer Assessment/UCI HAR Dataset/UCI HAR Dataset/train/Inertial Signals/body_acc_z_train.txt")
#--------------------------------
body_gyro_x_train <- read.table ("file:///D:/coursera/Data Science Specialization/Getting and Cleaning Data/Peer Assessment/UCI HAR Dataset/UCI HAR Dataset/train/Inertial Signals/body_gyro_x_train.txt")
body_gyro_y_train <- read.table ("file:///D:/coursera/Data Science Specialization/Getting and Cleaning Data/Peer Assessment/UCI HAR Dataset/UCI HAR Dataset/train/Inertial Signals/body_gyro_y_train.txt")
body_gyro_z_train <- read.table ("file:///D:/coursera/Data Science Specialization/Getting and Cleaning Data/Peer Assessment/UCI HAR Dataset/UCI HAR Dataset/train/Inertial Signals/body_gyro_z_train.txt")
#--------------------------------
# total_acc_x_train <- read.table ("file:///D:/coursera/Data Science Specialization/Getting and Cleaning Data/Peer Assessment/UCI HAR Dataset/UCI HAR Dataset/train/Inertial Signals/total_acc_x_train.txt")
# total_acc_y_train <- read.table ("file:///D:/coursera/Data Science Specialization/Getting and Cleaning Data/Peer Assessment/UCI HAR Dataset/UCI HAR Dataset/train/Inertial Signals/total_acc_y_train.txt")
# total_acc_z_train <- read.table ("file:///D:/coursera/Data Science Specialization/Getting and Cleaning Data/Peer Assessment/UCI HAR Dataset/UCI HAR Dataset/train/Inertial Signals/total_acc_z_train.txt")


#Calculating rowMeans
body_acc_x_train_mean   <- as.data.frame(t(t(as.matrix(rowMeans(body_acc_x_train,dims=1)))))
body_acc_y_train_mean   <- as.data.frame(t(t(as.matrix(rowMeans(body_acc_y_train,dims=1)))))
body_acc_z_train_mean   <- as.data.frame(t(t(as.matrix(rowMeans(body_acc_z_train,dims=1)))))
#--------------------------------------------------------
body_gyro_x_train_mean  <- as.data.frame(t(t(as.matrix(rowMeans(body_gyro_x_train,dims=1)))))
body_gyro_y_train_mean  <- as.data.frame(t(t(as.matrix(rowMeans(body_gyro_y_train,dims=1)))))
body_gyro_z_train_mean  <- as.data.frame(t(t(as.matrix(rowMeans(body_gyro_z_train,dims=1)))))
#--------------------------------------------------------
# total_acc_x_train_mean  <- as.data.frame(t(t(as.matrix(rowMeans(total_acc_x_train,dims=1)))))
# total_acc_y_train_mean  <- as.data.frame(t(t(as.matrix(rowMeans(total_acc_y_train,dims=1)))))
# total_acc_z_train_mean  <- as.data.frame(t(t(as.matrix(rowMeans(total_acc_z_train,dims=1)))))

#dim(body_acc_x_train_mean )
#---------------------------------------------------------------
# Calculating Standard Deviation

require(matrixStats,quietly=TRUE)


body_acc_x_train_sd   <- as.data.frame(t(t(rowSds(body_acc_x_train))))
body_acc_y_train_sd   <- as.data.frame(t(t(rowSds(body_acc_y_train))))
body_acc_z_train_sd   <- as.data.frame(t(t(rowSds(body_acc_z_train))))
#------------------------------------------------------------------
body_gyro_x_train_sd  <- as.data.frame(t(t(rowSds(body_gyro_x_train))))
body_gyro_y_train_sd  <- as.data.frame(t(t(rowSds(body_gyro_y_train))))
body_gyro_z_train_sd  <- as.data.frame(t(t(rowSds(body_gyro_z_train))))
#------------------------------------------------------------------
# total_acc_x_train_sd  <- as.data.frame(t(t(rowSds(total_acc_x_train))))
# total_acc_y_train_sd  <- as.data.frame(t(t(rowSds(total_acc_y_train))))
# total_acc_z_train_sd  <- as.data.frame(t(t(rowSds(total_acc_z_train))))

#dim(body_acc_x_train_sd)
#------------------------------------------------------------------------
subject_train <- read.table ("file:///D:/coursera/Data Science Specialization/Getting and Cleaning Data/Peer Assessment/UCI HAR Dataset/UCI HAR Dataset/train/subject_train.txt")

#X_train      <- read.table ("file:///D:/coursera/Data Science Specialization/Getting and Cleaning Data/Peer Assessment/UCI HAR Dataset/UCI HAR Dataset/train/X_train.txt")
Y_train      <- read.table ("file:///D:/coursera/Data Science Specialization/Getting and Cleaning Data/Peer Assessment/UCI HAR Dataset/UCI HAR Dataset/train/Y_train.txt",stringsAsFactors=FALSE)
#-----------------------------------------------------------------------

# Replacing column names
Y_train$V2 <- Y_train$V1
names(Y_train) <- c("ActivityID","Activity")
str(Y_train)

activity_labels <- read.table ("file:///D:/coursera/Data Science Specialization/Getting and Cleaning Data/Peer Assessment/UCI HAR Dataset/UCI HAR Dataset/activity_labels.txt",stringsAsFactors=FALSE)
names(activity_labels) <- c("ActivityID","Activity")
#str(activity_labels)


for (i in (1:nrow(activity_labels)))
{
  Y_train[which(Y_train$ActivityID == activity_labels[i,1]),2 ] <- activity_labels[i,2]
}

# Y_train$Activity[Y_train$Activity == 1] <- "walking"
# Y_train$Activity[Y_train$Activity == 2] <- "walking_upstairs"
# Y_train$Activity[Y_train$Activity == 3] <- "walking_downstairs"
# Y_train$Activity[Y_train$Activity == 4] <- "sitting"
# Y_train$Activity[Y_train$Activity == 5] <- "standing"
# Y_train$Activity[Y_train$Activity == 6] <- "laying"
#--------------------------------------------------------------------------
#combining dataframes
train             <- cbind(subject_train, Y_train,
                          body_acc_x_train_mean,  body_acc_y_train_mean , body_acc_z_train_mean , 
                          body_acc_x_train_sd,    body_acc_y_train_sd,    body_acc_z_train_sd,
                          
                          body_gyro_x_train_mean, body_gyro_y_train_mean, body_gyro_z_train_mean,
                          body_gyro_x_train_sd ,  body_gyro_y_train_sd ,  body_gyro_z_train_sd )

#                            total_acc_x_train_mean, total_acc_y_train_mean, total_acc_z_train_mean,            
#                            total_acc_x_train_sd ,  total_acc_y_train_sd ,  total_acc_z_train_sd )

features <- read.table ("file:///D:/coursera/Data Science Specialization/Getting and Cleaning Data/Peer Assessment/UCI HAR Dataset/UCI HAR Dataset/features.txt")

names(train) <- c("subjectID","ActivityID","Activity",
                 as.character(features[1:6,2]),
                 as.character(features[121:126,2])
)


