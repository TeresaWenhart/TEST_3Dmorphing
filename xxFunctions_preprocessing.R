#preprocessing Functions

library(dplyr)
z=0
count=0
trial=0
Voice_table <-Set1c_P02_TW ###Example

morph_H_I<-function(Voice_table){
  z=0
  count1=0
  count2=0
  trial=0
  Stimulus1<-as.character(Voice_table$Stimulus1)
  Stimulus2<-as.character(Voice_table$Stimulus2)
  morphrate1<-as.numeric(as.character(Voice_table$morphrate1))
  morphrate2<-as.numeric(as.character(Voice_table$morphrate2))
  answer<-as.character(Voice_table$answer)
  RT<-as.numeric(as.character(Voice_table$RT))
  for (i in 1:90) {
      if (Stimulus1[i]=="H" & Stimulus2[i]=="I"){ 
        trial=trial+1
      }
      if (Stimulus1[i]=="H" & Stimulus2[i]=="I" & answer[i]=="y"){ 
        z=z+RT[i]
        count1=count1+1
      }
      else{
        z=z+0
        count1=count1+0
      }
      if (Stimulus1[i]=="H" & Stimulus2[i]=="I" & answer[i]=="n"){
        z=z+RT[i]
        count2=count2+1
      }
      else{
        z=z+0
        count2=count2+0
      }
    assign("morph_H_I_RT", z, envir=globalenv())
    assign("trial", trial, envir=globalenv())
    assign("morph_H_I_PR", count1/trial, envir=globalenv())
    assign("morph_H_I_PR2", count2/trial, envir=globalenv())
    assign("morph_H_I_meanRT", morph_H_I_RT/trial, envir=globalenv())
  }
  return (c(morph_H_I_PR,morph_H_I_PR2,morph_H_I_meanRT, trial))
}
