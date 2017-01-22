## Forming the testing data set
feat<- read.table("/Users/allwynjoseph/Desktop/Online course/Data Science/Data cleaning/UCI HAR Dataset/features.txt")                # reads and stores the features.txt file into the 'feat' vraible 
test<- read.table("/Users/allwynjoseph/Desktop/Online course/Data Science/Data cleaning/UCI HAR Dataset/test/X_test.txt")             # reads and stores the X_test.txt file into the 'test' variable
colnames(test)<- feat$V2                                                                                                              # assigns and the column names of the dataset 'test' with values from the variable 'feat'
act_test<- read.table("/Users/allwynjoseph/Desktop/Online course/Data Science/Data cleaning/UCI HAR Dataset/test/y_test.txt")         # reads and stores the y_test.txt file into the 'act_test' variable                         
names<- c(Walking = 1, Walking_Upstairs = 2, Walking_Downstairs = 3, Sitting = 4, Standing = 5, Laying = 6)                           # creates a vector 'names' wih activity labels
act_test$Activity<- names(names)[match(act_test$V1,names)]                                                                            # creates a new column called Activity within the act_test data and assigns activity names to corresponding rows with activity numbers                                                              
act_test$V1<- NULL                                                                                                                    # Deletes the column with activity numbers of the data set act_test
sub_test<- read.table("/Users/allwynjoseph/Desktop/Online course/Data Science/Data cleaning/UCI HAR Dataset/test/subject_test.txt")   # reads and stores the subject_text.file into the sub_test variable
colnames(sub_test)<- "Subj_no"                                                                                                        # renames column name of sub_test to 'Subj_no'
test<- cbind(sub_test,act_test,test)                                                                                                  # column binds the columms of sub_test, test_act and test and reassings the test dataset

## Forming the training data set
train<- read.table("/Users/allwynjoseph/Desktop/Online course/Data Science/Data cleaning/UCI HAR Dataset/train/X_train.txt")           # Similar steps
colnames(train)<- feat$V2                                                                                                              # were followed 
act_train<- read.table("/Users/allwynjoseph/Desktop/Online course/Data Science/Data cleaning/UCI HAR Dataset/train/y_train.txt")       # to from 
act_train$Activity<- names(names)[match(act_train$V1,names)]                                                                           # a complete 
act_train$V1<- NULL                                                                                                                    # data set 
sub_train<- read.table("/Users/allwynjoseph/Desktop/Online course/Data Science/Data cleaning/UCI HAR Dataset/train/subject_train.txt") # of the 
colnames(sub_train)<- "Subj_no"                                                                                                        # training 
train<- cbind(sub_train,act_train,train)                                                                                               # data

## Merges the Training and Testign data set
Merged<- rbind(train,test)                                                                                                             # The training and testing data sets were merged and stored in variable 'Merged'
Merged<- Merged[with(Merged,order(Subj_no)),]                                                                                          # The Merged data set is orderd by the Subj_no in an ascending order

## Deletes unwanted data
Merged<- Merged[,grep("mean|std|Sub|Activity",colnames(Merged))]                                                                       # removes all column from the data set 'Merged' except columns having the stirng 'Sub' or 'Activity' or 'mean' or 'std'
Merged<- Merged[,-grep("Freq",colnames(Merged))]                                                                                       # removes colums with 'Freq' string in the column names of Merged

## Creates a Tidy data set with required data
Tidy_set<- group_by(Merged, Subj_no,Activity) %>% summarize_each(funs(mean))                                                           # A tidy data set with the average of each variable for each activity and each subject was created and stored in the variable 'Tidy_set'
colnames(Tidy_set)[3:ncol(Tidy_set)] <- paste("Avg", colnames(Tidy_set[,3:ncol(Tidy_set)]), sep = "_")                                # Suitably renames the columns of the data set 'Tidy_set'
