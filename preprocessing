#preprocessing morphing experiment (prestudy)

#library
library(dplyr)
library(tidyr)
#directory
setwd("~/Psychopy/data")

path<-paste(getwd())


#read version A files
filenames = list.files(path=path,pattern="P[0-9]{2}_[A-Z]{2}_Pilot_voices_[0-9]{4}_[A-Za-z]{3}_[0-9]{2}_[0-9]{4}.csv")
for (i in filenames) {
  name<-substr(i,1,19)
  assign(name,read.csv(paste(path,"/",i,sep=""),sep=",")) #read in the table and name as "name"
}
#read version B files
filenames = list.files(path=path,pattern="P[0-9]{2}_[A-Z]{2}_Pilot_voicesB_[0-9]{4}_[A-Za-z]{3}_[0-9]{2}_[0-9]{4}.csv")
for (i in filenames) {
    name<-substr(i,1,20)
    assign(name,read.csv(paste(path,"/",i,sep=""),sep=",")) #read in the table and name as "name"
}

#swap participants answers for Version B

#....
file_list<-ls(pattern="P[0-9]{2}_[A-Z]{2}_Pilot_voicesB")
for (i in 1:length(file_list)) {
  name=file_list[i]
  thistable<-get(file_list[i])
  level_key <- c("n" = "y", "y" = "n", "none" = "none")
  thistable$key_resp_4.keys<-dplyr::recode_factor(thistable$key_resp_4.keys, !!!level_key)
  thistable$key_resp_4.keys<-as.character(thistable$key_resp_4.keys)
  assign(name,thistable)
  i=i+1
  }


#create separate and sparse tables for each Set of Stimuli per Subject
file_list<-ls(pattern="P[0-9]{2}_[A-Z]{2}_Pilot")
for (i in 1:length(file_list)) {
  name=file_list[i]
  name<-substr(name,1,6)
  thistable<-get(file_list[i])
  answer<-thistable$key_resp_4.keys
  ans_num<-dplyr::recode(answer, "n" = 0, "y" = 1)
  RT<-thistable$key_resp_4.rt
  morphrate1<-thistable$morphrate1
  morphrate2<-thistable$morphrate2
  Stimulus1<-thistable$Stimulus1
  Stimulus2<-thistable$Stimulus2
  subject<-rep(1,length(Stimulus1))
  subject<-dplyr::recode(subject, "1"=name)
  Set<-thistable$Set
  allStim<-data.frame(subject,Set,Stimulus1, Stimulus2, morphrate1, morphrate2,answer,ans_num, RT)
  allStim<-unite(allStim, morph_pair, 3:4, sep = "", remove = TRUE, na.rm = FALSE)
  #####################
  #next section: duplicate 100% conditions for missing cases (every raw Stimulus was only presented as often es every morphing step 
  #per comparison, but is needed for every comparison -->2 times in total)
  #####################
  temp1<-filter(allStim,allStim$morph_pair=="HA" & allStim$morphrate1=="0.0")
  temp1$morph_pair<-"IA"
  allStim2<-rbind(allStim,temp1)
  temp2<-filter(allStim,allStim$morph_pair=="HI" & allStim$morphrate1=="1.0")
  temp2$morph_pair<-"HA"
  allStim2<-rbind(allStim2,temp2)
  temp3<-filter(allStim,allStim$morph_pair=="IA" & allStim$morphrate1=="1.0")
  temp3$morph_pair<-"HI"
  temp3$morphrate1<-"0.0"
  ####################
  allStim2<-rbind(allStim2,temp3)
  control<-allStim2[2:76,]
  testtrials<-allStim2[c(78:439,414:512),]
  Set1c<-dplyr::filter(testtrials,testtrials$Set=="S1c")
  Set2e<-dplyr::filter(testtrials,testtrials$Set=="S2e")
  Set3b<-dplyr::filter(testtrials,testtrials$Set=="S3b")
  Set4b<-dplyr::filter(testtrials,testtrials$Set=="S4b")
  name3<-paste("control_",name, sep="")
  assign(name3,control)
  name4<-paste("Set1c_",name, sep="")
  assign(name4,Set1c)
  name5<-paste("Set2e_",name, sep="")
  assign(name5,Set2e)
  name6<-paste("Set3b_",name, sep="")
  assign(name6,Set3b)
  name7<-paste("Set4b_",name, sep="")
  assign(name7,Set4b)
  name2<-paste("allStim_",name, sep="")
  assign(name2,rbind(control,Set1c,Set2e,Set3b,Set4b))
  i=i+1
}

