# load required libraries
library(dplyr)

# download data

destfile <- "Coursera_DS3_Final.zip"

# Check if archive exists.
if (!file.exists(destfile)){
  fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
  download.file(fileURL, destfile, method="curl")
}  

# Checking if folder exists
if (!file.exists("UCI HAR Dataset")) { 
  unzip(destfile) 
}


# load all data to data frames
activities <- read.table("UCI HAR Dataset/activity_labels.txt", 
                        col.names = c("id", "activity"))
features <- read.table("UCI HAR Dataset/features.txt", 
                        col.names = c("n","functions"))
subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt", 
                        col.names = "subject")
x_train <- read.table("UCI HAR Dataset/train/X_train.txt", 
                        col.names = features$functions)
y_train <- read.table("UCI HAR Dataset/train/y_train.txt", 
                        col.names = "id")
subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt", 
                        col.names = "subject")
x_test <- read.table("UCI HAR Dataset/test/X_test.txt", 
                        col.names = features$functions)
y_test <- read.table("UCI HAR Dataset/test/y_test.txt", 
                        col.names = "id")


## merge the data
xAll <- rbind(x_train, x_test)
yAll <- rbind(y_train, y_test)

subjectAll <- rbind(subject_train, subject_test)

compositeData <- cbind(subjectAll, yAll, xAll)

# Extracts only the measurements on the mean and standard deviation for each measurement.
extractedData <- select(compositeData, subject, id, contains("mean"), contains("std"))

# Uses descriptive activity names to name the activities in the data set.
extractedData$id <- activities[extractedData$id,2]

# Appropriately labels the data set with descriptive variable names.
# removing dots(.) and Transform everything into camel case as used
# as standards in many programming languages

colnames(extractedData)<-gsub("Acc", "Accelerometer", colnames(extractedData))
colnames(extractedData)<-gsub("^t", "Time", colnames(extractedData))
colnames(extractedData)<-gsub("\\.mean", "Mean", colnames(extractedData))
colnames(extractedData)<-gsub("Freq", "Frequency", colnames(extractedData))
colnames(extractedData)<-gsub("^f", "Frequency", colnames(extractedData))
colnames(extractedData)<-gsub("Gyro", "Gyroscope", colnames(extractedData))
colnames(extractedData)<-gsub("BodyBody", "Body", colnames(extractedData))
colnames(extractedData)<-gsub("Mag", "Magnitude", colnames(extractedData))
colnames(extractedData)<-gsub("\\.gravity", "Gravity", colnames(extractedData))
colnames(extractedData)<-gsub("Acc", "Accelerometer", colnames(extractedData))
colnames(extractedData)<-gsub("^t", "Time", colnames(extractedData))
colnames(extractedData)<-gsub("\\.mean", "Mean", colnames(extractedData))
colnames(extractedData)<-gsub("Freq", "Frequency", colnames(extractedData))
colnames(extractedData)<-gsub("^f", "Frequency", colnames(extractedData))
colnames(extractedData)<-gsub("Gyro", "Gyroscope", colnames(extractedData))
colnames(extractedData)<-gsub("BodyBody", "Body", colnames(extractedData))
colnames(extractedData)<-gsub("Mag", "Magnitude", colnames(extractedData))
colnames(extractedData)<-gsub("^anglet", "AngleTime", colnames(extractedData))
colnames(extractedData)<-gsub("^angle", "Angle", colnames(extractedData))
colnames(extractedData)<-gsub("std", "StandardDeviation", colnames(extractedData))

# now remove the remaining dots
colnames(extractedData)<-gsub("\\.", "", colnames(extractedData))

# adapt the first two columns to match
colnames(extractedData)[1] = "Subject"
colnames(extractedData)[2] = "Activity"
# now remove the remaining dots
colnames(extractedData)<-gsub("\\.", "", colnames(extractedData))

# From the data set in step 4, creates a second, independent tidy data set with the average 
 # of each variable for each activity and each subject.
write.table(extractedData, "TidyExtractedData.txt", row.name=FALSE)
SummaryData <- extractedData %>% group_by(Subject, Activity) %>% summarise_all(list(mean))
write.table(SummaryData, "SummaryData.txt", row.name=FALSE)