run_analysis <- function() {
  
  ### Reads features list
  
  features <- read.table("UCI HAR Dataset/features.txt")
  features[,2] <- as.character(features[,2])
  features[,2] <- gsub("\\(|\\)","",features[,2])
  features[,2] <- gsub("-|,","_", features[,2])
  features[,2] <- tolower(features[,2])
  
  ### Reads subject test and activity test
  original_subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt")
  colnames(original_subject_test) <- "subject"

  original_x_test <- read.table("UCI HAR Dataset/test/X_test.txt")
  colnames(original_x_test) <- features[,2]
  
  original_y_test <- read.table("UCI HAR Dataset/test/y_test.txt")
  colnames(original_y_test) <- "activity"
  
  ### Merges the three datasets
  
  merged_test <- cbind(original_subject_test,original_y_test,original_x_test)
  
  mean_std_names <- c(1,2,grep("_std_|_std$|_mean_|_mean$", names(merged_test)))
  
  ### Only mean and standard deviation measurements are needed
  data_test_reduced <- merged_test[,mean_std_names]
  
  
  ### Reads train subject and activity
  original_subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt")
  colnames(original_subject_train) <- "subject"
  
  original_x_train <- read.table("UCI HAR Dataset/train/X_train.txt")
  colnames(original_x_train) <- features[,2]
  
  original_y_train <- read.table("UCI HAR Dataset/train/y_train.txt")
  colnames(original_y_train) <- "activity"
  
  ### Merges all three data sets
  
  merged_train <- cbind(original_subject_train,original_y_train,original_x_train)
  
  ### Only mean and standard deviation measurements are needed

  mean_std_names_train <- c(1,2,grep("_mean_|_mean$|_std_|_std$", names(merged_train)))
  
  data_train_reduced <- merged_train[,mean_std_names_train]
  
  ### Test data + Train data
  comb_data <- rbind(data_test_reduced, data_train_reduced)
  
  ### Reads activity_labels.txt
  activity_labels <- read.table("UCI HAR Dataset/activity_labels.txt")
  activity_labels[ ,2] <- as.character(activity_labels[,2])
  
  colnames(activity_labels) <- c("activity", "activity_desc")
  
  ### Merge activity_labels and the combined data
  comb_data <- merge(activity_labels, comb_data)
  comb_data$activity_desc <- tolower(comb_data$activity_desc)
  
  ### Removes duplicated columns
  dupCol <- names(comb_data) %in% c("activity")
  comb_data <- comb_data[!dupCol]
  
  ### Aggregates the data to create the tidy data_set
  tidy_data <- aggregate(comb_data[,3:ncol(comb_data)], by=list(subject=comb_data$subject,activity_desc=comb_data$activity_desc), FUN=mean, na.rm=TRUE)
  
  tidy_data <- tidy_data[order(tidy_data$subject,tidy_data$activity_desc),]
  
  ### Output tidy data into TXT and CSV formats
  write.csv(tidy_data, "tidy_data.csv", row.names=FALSE)
  write.table(tidy_data, "tidy_data.txt", row.names=FALSE)
  
}