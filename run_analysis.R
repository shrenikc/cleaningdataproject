# Set working directory where data set is extracted. 
#setwd("c:/r/UCI HAR Dataset")



#Utility function to extract mean and standard deviation data
# this function merges observations with subject ids and activity labels

extractData<-function(xfile,yfile,subjectfile,activity_labels, features){
        data<-read.table(file=xfile)
        
        colnames(data) <- features$V2
        
        subjects<-read.table(file=subjectfile)
        colnames(subjects) <-c("subjectid")
        
        activities<-read.table(file = yfile)
        colnames(activities) <-c("activityid")
        
        
        data<-cbind(activities,data)
        data<-cbind(subjects,data)
        
        mergeddata<-merge(data, activity_labels,by.x = "activityid", by.y = "activityid")
        
        names<-names(mergeddata)
        mergeddata[,grepl("^subjectid$|^activity$|mean|std", names)]    
}

#Load activity labels
activity_labels<-read.table(file = "./activity_labels.txt")
colnames(activity_labels) <- c("activityid", "activity")

#Load features
features<- read.table(file="features.txt")

#Extract data for training data
trainingdata <- extractData("./train/x_train.txt","./train/y_train.txt",
            "./train/subject_train.txt",activity_labels, features)

#Extract data from test dataset
testdata <- extractData("./test/x_test.txt","./test/y_test.txt",
                            "./test/subject_test.txt",activity_labels, features)

#Merge traning data and test data
alldata <- rbind(trainingdata, testdata)

# Sort All merged data on subjectid variable
alldata<-alldata[order(alldata$subjectid),]

#Write tidy data to tidydata.csv
write.csv(alldata, file="tidydata.txt", row.names=F)


