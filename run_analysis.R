library(dplyr)

# Data Download from URL and gets stored on a relativepath="./data/" 
# dataURL<-"https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
# download.file(dataURL,"./data.zip")
# date_downloaded<-date()
# unzip("data.zip",exdir = "./data/")

# Read train data
raw_train<-read.table("data/UCI HAR Dataset/train/X_train.txt")
act_train<-read.table("data/UCI HAR Dataset/train/y_train.txt")
subj_train<-read.table("data/UCI HAR Dataset/train/subject_train.txt")

#Read test data
raw_test<-read.table("data/UCI HAR Dataset/test/X_test.txt")
act_test<-read.table("data/UCI HAR Dataset/test/y_test.txt")
subj_test<-read.table("data/UCI HAR Dataset/test/subject_test.txt")

#Read Variables of Data
feature<-read.table("data/UCI HAR Dataset/features.txt")

#Read activity labels of Data
act_labels<-read.table("data/UCI HAR Dataset/activity_labels.txt")

#1. Merges the training and the test sets.
raw_final<-rbind(raw_train,raw_test)
act<-rbind(act_train,act_test)
subj<-rbind(subj_train,subj_test)

#2. Extracts only the measurements on the mean and standard deviation for each measurement.
reqdvar<-grep("mean\\(\\)|std\\(\\)",feature[,2])
reqdvarnames<-feature[reqdvar,2]

#3.Uses descriptive activity names to name the activities in the data set
act[,1]<-factor(act[,1],level=act_labels[,1],labels=act_labels[,2])

#4. Appropriately labels the data set with descriptive variable names.
raw_final<-raw_final[,reqdvar]
data_set<-cbind(subj,act,raw_final) 
names(data_set)<-c("subject","activity",reqdvarnames)

#final data set
data_set$subject<-as.factor(data_set$subject) 

#5. From the data set in step 4, creates a second, independent tidy data set with the 
##  average of each variable for each activity and each subject
tidy_data_mean<-data_set %>% 
  group_by(activity,subject) %>%
    summarise_all(funs(mean))

# write the tidy data set created above
write.table(tidy_data_mean, file = "tidydata.txt", row.names = FALSE, col.names = TRUE) 
