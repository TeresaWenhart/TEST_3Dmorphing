#prepare analysis averaging over participants

library(tidyr)
library(dplyr)
library(purrr)
library(ggplot2)

#first, create tables for conditions and subjects with preprocessing

#rbind all participants tables
datalist<-ls(pattern="Pilot_experiment_P[0-9]{2}_[A-Z]{2}")
mylist<-list()
for (i in 1:length(datalist)){
  thisdata<-get(datalist[[i]])
  thisdata$morphrate1<-as.numeric(as.character(thisdata$morphrate1))
  thisdata$morphrate2<-as.numeric(as.character(thisdata$morphrate2))
  thisdata$PR<-as.numeric(as.character(thisdata$ans_num))
  thisdata$Block<-as.factor(thisdata$B)
  thisdata$morph_pair<-as.factor(thisdata$morph_pair)
  mylist[[i]]<-thisdata
}
allsubjects<-dplyr::bind_rows(mylist)
allsubjects$morphrate1<-as.numeric(as.character(allsubjects$morphrate1))
allsubjects$morphrate2<-as.numeric(as.character(allsubjects$morphrate2))
allsubjects$PR<-as.numeric(as.character(allsubjects$ans_num))
allsubjects$Set<-as.factor(allsubjects$Set)
allsubjects$morph_pair<-as.factor(allsubjects$morph_pair)


############################
#fit and plot psychometric function
############################
library(quickpsy)
library(DEoptim)
library(parallel)


allsubjects <- na.omit(allsubjects) 
fit <- quickpsy(d=allsubjects, x=morphrate1, k=PR, grouping = .(morph_pair, Set), B = 10)
pcurve<-plotcurves(fit)
pcurve+scale_x_continuous(limits=c(0.0,1))+ggtitle("all subjects")
parplot<-plotpar(fit)
parplot+scale_y_continuous(limits=c(0.0,1))+ggtitle("all subjects")
thresplot<-plotthresholds(fit, geom = 'point')
thresplot+scale_y_continuous(limits=c(0.0,1))+ggtitle("all subjects")


###########################
#fit and plot psychometric function per subject
###########################
for (i in 1:length(mylist)){
  thisdata<-mylist[i]
  thisdata<-as.data.frame(thisdata)
  name<-datalist[[i]]
  name<-substr(name,9,14)
  thisdata <- na.omit(thisdata) 
  fit <- quickpsy(d=thisdata, x=morphrate1, k=PR, grouping = .(morph_pair, Set), B = 10)
  pcurve<-plotcurves(fit)
  pcurve<-pcurve+scale_x_continuous(limits=c(0.0,1))+ggtitle(name)+ggtitle(name)
  print(pcurve)
  parplot<-plotpar(fit)
  parplot<-parplot+scale_y_continuous(limits=c(0.0,1))+ggtitle(name)
  print(parplot)
  thresplot<-plotthresholds(fit, geom = 'point')
  thresplot<-thresplot+scale_y_continuous(limits=c(0.0,1))+ggtitle(name)
  print(thresplot)
}
