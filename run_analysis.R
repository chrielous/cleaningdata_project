run_analysis <- function() {
traindata<-read.table("UCI HAR Dataset/train/X_train.txt", header=F)
testdata<-read.table("UCI HAR Dataset/test/X_test.txt", header=F)
data<-rbind(traindata,testdata)

features<-read.table("UCI HAR Dataset//features.txt",header=F)
names(data)<-features$V2

meanstdcols <- sort(c(grep("-std\\()",features$V2),grep("-mean\\()",features$V2)))
tdata<-data[,meanstdcols]

trainlabel<-read.table("UCI HAR Dataset/train/Y_train.txt", header=F)
testlabel<-read.table("UCI HAR Dataset/test/Y_test.txt", header=F)
labelmap<-read.table("UCI HAR Dataset/activity_labels.txt", header=F)
names(labelmap) <- c("id","activity")

activitylabel<-rbind(trainlabel, testlabel)
names(activitylabel)<-c("activity_id")
tdata<-cbind(activity_id=activitylabel$activity_id,tdata)

trainSubjects<-read.table("UCI HAR Dataset/train/subject_train.txt", header=F)
testSubjects<-read.table("UCI HAR Dataset/test/subject_test.txt", header=F)
subjects<-rbind(trainSubjects,testSubjects)
tdata<-cbind(subject=subjects$V1,tdata)
tdata<-merge(x=tdata,y=labelmap,by.x="activity_id",by.y="id",all.x=TRUE, sort=FALSE)
tdata <- subset( tdata, select = -activity_id )

mdata<-melt(tdata,id=c("subject","activity"))
result<-dcast(mdata, subject+activity~variable,mean)
write.table(result, "tidydata.csv", sep=",", row.names=FALSE)
}