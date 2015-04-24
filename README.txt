To run the run_analysis.R script:
1. Download data zip file from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
2. Place zip file in your R working directory and unzip the file. You can also use setwd() to set the working directory to where you place the data files.
3. Put run_analysis.R into your R working directory
4. Run run_analysis.R in your R working directory

This is what the run_analysis.R script does:

Part 1: Read and merges the training and the test sets to create one data set.

1.1. Read X_train.txt and X_test.txt and merge them into 1 dataset called “X”
1.2. Read subject_train.txt and subject_test.txt and merge them into 1 dataset called “subject”
1.3. Read Y_train.txt and Y_test.txt and merge them into 1 dataset called Y

Part 2: Extracts only the measurements on the mean and standard deviation for each measurement.

2.1. Read features.txt and put it into dataset called “features”
2.2. Look into “features” and return the indices of any feature with “-mean” and “-std”, put these indices into a dataset called “features_location”
2.3. Remove all rows in “X” whose indices are not in “features_location” 
2.4. Name X columns with their respective features
2.5. Remove “()” in X column names to make the names more readable

Part 3: Uses descriptive activity names to name the activities in the data set.

3.1. Read activity_labels.txt into a dataset called “activities”
3.2. Put the activities in lower cases to make them more readable
3.3. Replace the activities into column 1 in Y
3.4. Name column 1 in Y “activity”

Part 4: Appropriately labels the data set with descriptive activity names.

4.1. Name the column in “subject” dataset
4.2. Column-bind subject, Y and X, the resulted dataset is called “tidy_data”
4.3. Write “tidy_data” into file “tidy_data.txt”

Part 5: Creates a 2nd, independent tidy data set with the average of each variable for each activity and each subject.

5.1. Find the unique subjects
5.2. Count number of subjects
5.3. Count number of activities
5.4. Prepare a blank data frame with number of subjects * number of actives as rows, called “tidy2”
5.5. For every subject and every activity, calculate the mean and put it into “tidy2”
5.6. Write “tidy2” into file “tidy2.txt”

