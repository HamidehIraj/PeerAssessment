# SampleRows.index <- sample(0:nrow(FullData),100,replace=T)
# SampleData <- FullData[SampleRows.index,]
# 
# require(reshape2,quietly=TRUE)
# 
# melted <- melt (SampleData,(id.vars=c("Activity","subjectID")))
# tidied <- dcast(melted, subjectID + Activity ~ variable, mean)

#----------------------------------------------
require(reshape2,quietly=TRUE)

Fullmelted <- melt (FullData,(id.vars=c("Activity","subjectID")))
Fulltidied <- dcast(Fullmelted, subjectID + Activity ~ variable, mean)