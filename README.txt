==================================================================
Human Activity Recognition Using Smartphones Dataset
Version 1.0
==================================================================
Allwyn Joseph 
==================================================================

The run_analysis.R script  
======================================

- The R script is divided into 5 main parts.
- The first and the second parts deal with the formation of the testing and training datasets named ‘test’ and ‘train’. 
	* The testing and training data sets, each, were wholly created with by renaming the columns with appropriate features and adding column for Subject number and the activity name
- The third part merges the testing and training data sets into a variable ‘Merged’
- The fourth part makes use of the regular expression in R rid the merged data set of columns that do not correspond to mean and standard deviation.
- The final part creates a tidy data set named ‘Tidy_set’with the average of each variable for each activity and each subject.

The dataset includes the following files:
=========================================
- README.txt 
- run_analysis.R script  
- Code_book_tidy - Articulates the codes/abbreviations used for variables of column names
- Tidy_set.txt : The tidy data set

Notes: 
======
In creating of the tidy dataset a personalized sequence was followed rather than one suggested in the instructions section of the assignment.

Read the tidy set : 
===================
data <- read.table(file_path, header = TRUE)


References: 
======
[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012