
To make train and test datasets, I used files in the Inertial Signals directory. I created a dataframe for each text file and then I combined them into train and test dataframes.
These are the initial dataframes for each text file:(the process for the train dataframe is the same)

body_acc_x_test 
body_acc_y_test 
body_acc_z_test 

body_gyro_x_test 
body_gyro_y_test 
body_gyro_z_test 

These are the datasets created by calculating Row means for every row of the initial dataset:
body_acc_x_test_mean   
body_acc_y_test_mean   
body_acc_z_test_mean   

body_gyro_x_test_mean  
body_gyro_y_test_mean  
body_gyro_z_test_mean  

body_acc_x_test_sd   
body_acc_y_test_sd   
body_acc_z_test_sd   

body_gyro_x_test_sd  
body_gyro_y_test_sd 
body_gyro_z_test_sd  

the test dataframe is the combination of these *mean and *sd dataframes plus subject_test and Y_test

I renamed the columns for train and test dataframes using activity labels file to give the columns a meaningful name.

A new variable (Activity) was created for Y_test to be filled up with the activity description. For emxaple for activityID== 1  , Activity="WALKING" according to activity_labels dataframe as a reference.