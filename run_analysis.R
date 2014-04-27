library(data.table)
library(reshape2)
library(plyr)

# Helper Task: Get all column names and filter to only those showing "mean" and "std"
col_names <- read.table("UCI HAR Dataset/features.txt", header=F)
col_names_input <- col_names$V2
col_names_result <-  grep("(mean|std)\\(\\)", col_names_input, perl=T, value=T)

# 2. Extracts only the measurements on the mean and standard deviation for each measurement.
# 4. Appropriately labels the data set with descriptive activity names. 
readMeasureData <- function(path, measure_file, activity_file, cols, reduce_cols){
  measure_data <- read.table(paste0(path, measure_file), header=F, col.names=cols, check.names = F)
  measure_data_sub <- subset(measure_data, select=reduce_cols)
  
  activity_data <- read.table(paste0(path, activity_file), header=F, col.names=c("Activity"))
  cbind(activity_data, measure_data_sub)
}
test_data <- readMeasureData("UCI HAR Dataset/test/", "X_test.txt", "y_test.txt", col_names_input, col_names_result)
train_data <- readMeasureData("UCI HAR Dataset/train/", "X_train.txt", "y_train.txt", col_names_input, col_names_result)

# 1. Merges the training and the test sets to create one data set.
# Note: this has been set below 2. as reducing data on unmerged data means less data needs to be merged. 
# Note: this is writing a test file with all data as it was not entirely clear which outputs should be produced. 
all_data <- rbind(test_data, train_data)

# It is not entirely clear to me that item 5 is correctly understood. If not, then this alternative dataset 
# should be the correct soluton. 
write.table(all_data, file="alternative_data_set.txt", append=F, quote=F, sep=" ", eol="\n", row.names=F, col.names=T)

# 5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 
#by_activity <- dcast(all_data, Activity, mean)
by_activity <- split(all_data, all_data$Activity)
mean_by_activity = sapply(by_activity, function(x) colMeans(x[, colnames(all_data[,2:67])]))
write.table(mean_by_activity, file="data_set.txt", append=F, quote=F, sep=" ", eol="\n", row.names=T, col.names=T)