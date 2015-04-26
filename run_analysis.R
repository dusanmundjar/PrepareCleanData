
#########################################
###Merges the training and the test sets to create one data set.
#########################################


X_test<-read.table("./UCI HAR Dataset/test/X_test.txt", quote="\"")
X_train<-read.table("./UCI HAR Dataset/train/X_train.txt", quote="\"");
X<-rbind(X_test,X_train)

Y_test<-read.table("./UCI HAR Dataset/test/Y_test.txt", quote="\"")
Y_train<-read.table("./UCI HAR Dataset/train/Y_train.txt", quote="\"");
Y<-rbind(Y_test,Y_train)

subject_test<-read.table("./UCI HAR Dataset/test/subject_test.txt", quote="\"")
subject_train<-read.table("./UCI HAR Dataset/train/subject_train.txt", quote="\"");
Subject<-rbind(subject_test,subject_train)

#########################################
###Extracts only the measurements on the mean and standard deviation for each measurement.
#########################################

features <- read.table("./UCI HAR Dataset/features.txt")
id <- grep("-mean\\(\\)|-std\\(\\)", features$V2) 

X <- X[,id] 

#########################################
###Uses descriptive activity names to name the activities in the data set
#########################################

names(X) <- gsub("\\(|\\)", "", (features[id, 2]))

#########################################
###Uses descriptive activity names to name the activities in the data set
#########################################
 
activity <- read.table("./UCI HAR Dataset/activity_labels.txt", quote="\"")
names(activity) <- c('act', 'name')
Y[, 1] = activity[Y[, 1], 2]

#########################################
## Appropriately labels the data set with descriptive variable names. 
#########################################

DS <- cbind(Subject, Y, X)
head(DS)

write.table(DS,file = "./DS.txt",row.name=FALSE)
