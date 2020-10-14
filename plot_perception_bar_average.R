#script to crate nested data set of all participants and plot performance 
#per Stimulus Set, pair and morph rate on average

#####################################################
#prepare analysis averaging over participants
#####################################################
library(tidyr)
library(dplyr)
library(purrr)
library(ggplot2)

#first, create tables for conditions and subjects with preprocessing

#rbind all participants tables
datalist<-ls(pattern="allStim_P[0-9]{2}_[A-Z]{2}")
list<-list()
for (i in 1:length(datalist)){
  thisdata<-get(datalist[[i]])
  thisdata<-thisdata[76:435,]
  thisdata$morphrate1<-as.numeric(as.character(thisdata$morphrate1))
  thisdata$morphrate2<-as.numeric(as.character(thisdata$morphrate2))
  thisdata$PR<-as.numeric(as.character(thisdata$ans_num))
  thisdata$Set<-as.factor(thisdata$Set)
  thisdata$morph_pair<-as.factor(thisdata$morph_pair)
  list[[i]]<-thisdata
}
allsubjects<-dplyr::bind_rows(list)
################################################
#nested data sets
################################################
allsubj_HI<-filter(allsubjects,allsubjects$morph_pair=="HI")
allsubj_HA<-filter(allsubjects,allsubjects$morph_pair=="HA")
allsubj_IA<-filter(allsubjects,allsubjects$morph_pair=="IA")

#group_by variable "subject" and create nested data 
nest_allsubj<-allsubjects %>% group_by(subject,Set, morph_pair,morphrate1) %>% nest()
nest_allsubj_HI<-allsubj_HI %>% group_by(subject,Set, morph_pair,morphrate1) %>% nest()
nest_allsubj_HA<-allsubj_HA %>% group_by(subject,Set, morph_pair,morphrate1) %>% nest()
nest_allsubj_IA<-allsubj_IA %>% group_by(subject,Set, morph_pair,morphrate1) %>% nest()

#calculate mean per subject
nest_allsubj <- nest_allsubj %>% mutate(PR = map(.x = data, .f = ~mean(.x$ans_num, na.rm = T)))
nest_allsubj_HI <- nest_allsubj_HI %>% mutate(PR = map(.x = data, .f = ~mean(.x$ans_num, na.rm = T)))
nest_allsubj_HA <- nest_allsubj_HA %>% mutate(PR = map(.x = data, .f = ~mean(.x$ans_num, na.rm = T)))
nest_allsubj_IA <- nest_allsubj_IA %>% mutate(PR = map(.x = data, .f = ~mean(.x$ans_num, na.rm = T)))


#########################################################
#plot by group
#########################################################

library(ggplot2)
library(viridis)
library(hrbrthemes)

#all trials
nest_allsubj$morphrate1<-as.numeric(as.character(nest_allsubj$morphrate1))
nest_allsubj$PR<-as.numeric(as.character(nest_allsubj$PR))
nest_allsubj$Set<-as.factor(nest_allsubj$Set)


ggplot(nest_allsubj, aes(y=PR, x=morphrate1)) + 
  stat_summary(fun.y = 'mean', geom = 'bar') +
  ggtitle("morphing (all comparisons)") +coord_cartesian(xlim = c(-0.2, 1.2),ylim = c(-0.2,1.2))+
  facet_wrap(~interaction(Set, morph_pair), scales='free') +
  theme_bw()+
  xlab("morphing step")+ylab("percent 'voice' response")

#HI

nest_allsubj_HI$morphrate1<-as.numeric(as.character(nest_allsubj_HI$morphrate1))
nest_allsubj_HI$PR<-as.numeric(as.character(nest_allsubj_HI$PR))
nest_allsubj_HI$Set<-as.factor(nest_allsubj_HI$Set)


ggplot(nest_allsubj_HI, aes(y=PR, x=morphrate1)) + 
  stat_summary(fun.y = 'mean', geom = 'bar') +
  scale_color_viridis(discrete = F, option = "E") +
  ggtitle("Human-instrument morphing") +
  facet_wrap(~Set) +
  theme_classic() +
  xlab("morphing step (%human)")+ylab("percent 'voice' response")

#HA

nest_allsubj_HA$morphrate1<-as.numeric(as.character(nest_allsubj_HA$morphrate1))
nest_allsubj_HA$PR<-as.numeric(as.character(nest_allsubj_HA$PR))
nest_allsubj_HA$Set<-as.factor(nest_allsubj_HA$Set)


ggplot(nest_allsubj_HA, aes(y=PR, x=morphrate1)) + 
  stat_summary(fun.y = 'mean', geom = 'bar') +
  scale_color_viridis(discrete = F, option = "E") +
  ggtitle("Human-animal morphing") +
  facet_wrap(~Set) +
  theme_ipsum() +
  theme(legend.position="none") +
  xlab("morphing step (%human)")+ylab("percent 'voice' response")

#IA

nest_allsubj_IA$morphrate1<-as.numeric(as.character(nest_allsubj_IA$morphrate1))
nest_allsubj_IA$PR<-as.numeric(as.character(nest_allsubj_IA$PR))
nest_allsubj_IA$Set<-as.factor(nest_allsubj_IA$Set)


ggplot(nest_allsubj_IA, aes(y=PR, x=morphrate1)) + 
  stat_summary(fun.y = 'mean', geom = 'bar') +
  scale_color_viridis(discrete = F, option = "E") +
  ggtitle("Instrument_animal morphing") +
  facet_wrap(~Set) +
  theme_ipsum() +
  theme(legend.position="none") +
  xlab("morphing step (%instrument)")+ylab("percent 'voice' response")
