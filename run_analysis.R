# 1. Read and merges the training and the test sets to create one data set.

X <- rbind(read.table("train/X_train.txt"), read.table("test/X_test.txt"))
subject <- rbind(read.table("train/subject_train.txt"), read.table("test/subject_test.txt"))
Y <- rbind(read.table("train/y_train.txt"), read.table("test/y_test.txt"))

# 2. Extracts only the measurements on the mean and standard deviation for each measurement.

features <- read.table("features.txt")
features_location <- grep("-mean\\(\\)|-std\\(\\)", features[, 2])
X <- X[, features_location]
names(X) <- features[features_location, 2]
names(X) <- gsub("\\(|\\)", "", names(X))

# 3. Uses descriptive activity names to name the activities in the data set.

activities <- read.table("activity_labels.txt")
activities[, 2] = tolower(as.character(activities[, 2]))
Y[,1] = activities[Y[,1], 2]
names(Y) <- "activity"

# 4. Appropriately labels the data set with descriptive activity names.

names(subject) <- "subject"
tidy_data <- cbind(subject, Y, X)
write.table(tidy_data, "tidy_data.txt")

# 5. Creates a 2nd, independent tidy data set with the average of each variable for each activity and each subject.

uniqueSubjects = unique(subject)[,1]
numSubjects = length(unique(subject)[,1])
numActivities = length(activities[,1])
numCols = dim(tidy_data)[2]
tidy2 = tidy_data[1:(numSubjects*numActivities), ]

row = 1
for (s in 1:numSubjects) {
  for (a in 1:numActivities) {
    tidy2[row, 1] = uniqueSubjects[s]
    tidy2[row, 2] = activities[a, 2]
    tmp <- tidy_data[tidy_data$subject==s & tidy_data$activity==activities[a, 2], ]
    tidy2[row, 3:numCols] <- colMeans(tmp[, 3:numCols])
    row = row+1
  }
}
write.table(tidy2, "tidy2.txt", row.name=F)