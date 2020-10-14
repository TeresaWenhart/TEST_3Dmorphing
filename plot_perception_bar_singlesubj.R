#plot preception courve
library(ggplot2)
#single subject, all morph-pairs
#RT
plot(allStim_P09_CT$morphrate1,allStim_P09_CT$RT)
plot(Set1c_P09_CT$morphrate1,Set1c_P09_CT$RT)
plot(Set2e_P09_CT$morphrate1,Set2e_P09_CT$RT)
plot(Set3b_P09_CT$morphrate1,Set3b_P09_CT$RT)
plot(Set4b_P09_CT$morphrate1,Set4b_P09_CT$RT)

ggplot(Set1c_P09_CT, aes(x = morphrate1, y = RT)) +  stat_summary(fun.y = 'mean', geom = 'bar')

#correct
plot(allStim_P09_CT$morphrate1,allStim_P09_CT$ans_num)
plot(Set1c_P09_CT$morphrate1,Set1c_P09_CT$ans_num)
plot(Set2e_P09_CT$morphrate1,Set2e_P09_CT$ans_num)
plot(Set3b_P09_CT$morphrate1,Set3b_P09_CT$ans_num)
plot(Set4b_P09_CT$morphrate1,Set4b_P09_CT$ans_num)

ggplot(Set1c_P09_CT, aes(x = morphrate1, y = ans_num)) +  stat_summary(fun.y = 'mean', geom = 'bar')

#morph-pairs
#H-I


allStim_HI<-filter(allStim_P09_CT,allStim_P09_CT$morph_pair=="HI")
ggplot(allStim_HI, aes(x = morphrate1, y = ans_num)) +  stat_summary(fun.y = 'mean', geom = 'bar')
Set1c_HI<-filter(Set1c_P09_CT,Set1c_P09_CT$morph_pair=="HI")
ggplot(Set1c_HI, aes(x = morphrate1, y = ans_num)) +  stat_summary(fun.y = 'mean', geom = 'bar')
Set2e_HI<-filter(Set2e_P09_CT,Set2e_P09_CT$morph_pair=="HI")
ggplot(Set2e_HI, aes(x = morphrate1, y = ans_num)) +  stat_summary(fun.y = 'mean', geom = 'bar')
Set4b_HI<-filter(Set4b_P09_CT,Set4b_P09_CT$morph_pair=="HI")
ggplot(Set4b_HI, aes(x = morphrate1, y = ans_num)) +  stat_summary(fun.y = 'mean', geom = 'bar')
Set3b_HI<-filter(Set3b_P09_CT,Set3b_P09_CT$morph_pair=="HI")
ggplot(Set3b_HI, aes(x = morphrate1, y = ans_num)) +  stat_summary(fun.y = 'mean', geom = 'bar')


#H-A


allStim_HA<-filter(allStim_P09_CT,allStim_P09_CT$morph_pair=="HA")
ggplot(allStim_HA, aes(x = morphrate1, y = ans_num)) +  stat_summary(fun.y = 'mean', geom = 'bar')
Set1c_HA<-filter(Set1c_P09_CT,Set1c_P09_CT$morph_pair=="HA")
ggplot(Set1c_HA, aes(x = morphrate1, y = ans_num)) +  stat_summary(fun.y = 'mean', geom = 'bar')
Set2e_HA<-filter(Set2e_P09_CT,Set2e_P09_CT$morph_pair=="HA")
ggplot(Set2e_HA, aes(x = morphrate1, y = ans_num)) +  stat_summary(fun.y = 'mean', geom = 'bar')
Set4b_HA<-filter(Set4b_P09_CT,Set4b_P09_CT$morph_pair=="HA")
ggplot(Set4b_HA, aes(x = morphrate1, y = ans_num)) +  stat_summary(fun.y = 'mean', geom = 'bar')
Set3b_HA<-filter(Set3b_P09_CT,Set3b_P09_CT$morph_pair=="HA")
ggplot(Set3b_HA, aes(x = morphrate1, y = ans_num)) +  stat_summary(fun.y = 'mean', geom = 'bar')


#I-A

allStim_IA<-filter(allStim_P09_CT,allStim_P09_CT$morph_pair=="IA")
ggplot(allStim_IA, aes(x = morphrate1, y = ans_num)) +  stat_summary(fun.y = 'mean', geom = 'bar')
Set1c_IA<-filter(Set1c_P09_CT,Set1c_P09_CT$morph_pair=="IA")
ggplot(Set1c_IA, aes(x = morphrate1, y = ans_num)) +  stat_summary(fun.y = 'mean', geom = 'bar')
Set2e_IA<-filter(Set2e_P09_CT,Set2e_P09_CT$morph_pair=="IA")
ggplot(Set2e_IA, aes(x = morphrate1, y = ans_num)) +  stat_summary(fun.y = 'mean', geom = 'bar')
Set4b_IA<-filter(Set4b_P09_CT,Set4b_P09_CT$morph_pair=="IA")
ggplot(Set4b_IA, aes(x = morphrate1, y = ans_num)) +  stat_summary(fun.y = 'mean', geom = 'bar')
Set3b_IA<-filter(Set3b_P09_CT,Set3b_P09_CT$morph_pair=="IA")
ggplot(Set3b_IA, aes(x = morphrate1, y = ans_num)) +  stat_summary(fun.y = 'mean', geom = 'bar')


#H
#I
#A


#H-N
#I-N
#A-N

