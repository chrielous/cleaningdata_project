###README###
function: run_analysis.R

###INTRODUCTION###
The function reads train and test datasets from UCI HAR Dataset, combine and process experimental data and produce tidy dataset.

###USAGE###
Downloaded raw dataset folder "HCI HAR Dataset" needs to be placed under the same directory with run_analysis.R, and produced tidy dataset will be named tidydata.csv.
Run run_analysis() without parameter

###WHAT IT DOES###
Step1: the scripts reads train data(X_train.txt) and test data(X_test), and merge them together.
Step2: the scripts extracts all mean and std variables from the merged data to form a new dataset.
Step3: the scripts appends subject id and activity id to the dataset from previous step. Subject ids come from files subject_train.txt and subject_test.txt, and activity ids come from Y_train.txt and Y_test.txt.
Step4: the scripts merges the dataset from previous step with activity map mapping coming from activity_labels.txt, to give each activity a proper human-readable name.
Step5: the scripts melt and dcast the dataset from previous step, to calculate the mean of each variable for each subject and each activity.
Step6: the scripts exports the processed data to tidydata.csv.
