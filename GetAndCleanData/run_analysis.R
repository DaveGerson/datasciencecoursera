##Merges the training and the test sets to create one data set.
testdir  <- ("C:/Users/gerson64/Desktop/Dropbox Sync/Dropbox/Coursera/Cleaning Data/getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset/test/")
traindir <- ("C:/Users/gerson64/Desktop/Dropbox Sync/Dropbox/Coursera/Cleaning Data/getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset/train/")
testDat<-c("subject_test.txt","X_test.txt","y_test.txt")
trainDat<-c("subject_train.txt","X_train.txt","y_train.txt")
NameDat<-c("subject_list","x","y")

for (i in 1:3){
assign(NameDat[i],c(testDat[i] , trainDat[i]))
assign(NameDat[i],
	rbind(
	read.table(paste( testdir,  get(NameDat[i])[1] , sep = "")) ,
	read.table(paste( traindir,  get(NameDat[i])[2] , sep = ""))
	))


}
names(subject_list) <- "Subject_id"
##Appropriately labels the data set with descriptive variable names. 

names(x) <- featureList_x[,2]
names(y) <- "Activity_ID"
##Extracts only the measurements on the mean and standard deviation for each measurement. 
featureList_x <- read.table("C:/Users/gerson64/Desktop/Dropbox Sync/Dropbox/Coursera/Cleaning Data/getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset/features.txt")
x <- x[ , grepl("mean*",names(x)) |  grepl("std",names(x))  ]

##Uses descriptive activity names to name the activities in the data set
library(plyr)
featureList_y <- read.table("C:/Users/gerson64/Desktop/Dropbox Sync/Dropbox/Coursera/Cleaning Data/getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset/activity_labels.txt" ,
				stringsAsFactors =  FALSE)
names(featureList_y) <- c("Activity_ID" , "Activity_Name")
y <- join(y , featureList_y, by="Activity_ID")[,2]
#COMPLETE
combined <- data.frame(subject_list,x,y)
names(combined)[length(combined)]<-"Activity_Name"
##From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
cols <- c("Subject_id","Activity_Name")
meanset<-aggregate(combined[,2 : ( length(combined) - 1)], by=combined[cols], mean)
write.csv( meanset ,file= "C:/Users/gerson64/Desktop/Dropbox Sync/Dropbox/Coursera/Cleaning Data/getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset/out.csv" ,
 row.names =  FALSE, col.names = TRUE)