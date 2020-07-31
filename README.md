# **Getting and Cleaning Data : Assignment W-4**
This Project Assignment is a part of the John Hopkin's Data Science Specialization Course: **"Getting and Cleaning Data"**

### **Task:**

To create a independent tidy dataset, which contains all the measurement variables based on **mean:mean** and **standard deviation:std** and return the mean of these measurement variables for each combination of **activity** and **subject**.
  
### **Dataset:**

Data consists of 30 subjects over 6 activities.

**Link** : [Dataset .zip file](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)

### **Files Description:**
**run_analysis.R**:  

R script to perform the tasks based on the following instructions:

  + Merges the training and the test sets to create one data set.
  + Extracts only the measurements on the mean and standard deviation for each       measurement.
  + Uses descriptive activity names to name the activities in the data set.
  + Appropriately labels the data set with descriptive variable names.
  + From the data set in step 4, creates a second, independent tidy data set with   the average of each variable for each activity and each subject.

**NOTE** : To integrate the download part of the dataset within the script, uncomment those lines from the script.

**CodeBook.md**:

Descriptive information of the variables of the dataset.

**tidydata.txt**:

Contains the final tidy dataset based on the given task.