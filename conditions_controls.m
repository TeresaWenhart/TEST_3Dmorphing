%create conditions file for auditory experiment

%folder of stimuli
cd C:\Users\teresa\Documents\UZH_Arbeit\Test_threedimensional_morphing\Morph_pretesting\control_trials\
filedir='C:\Users\teresa\Documents\UZH_Arbeit\Test_threedimensional_morphing\Morph_pretesting\control_trials\'
filelist=dir('*Specification*.wav')


trialnr=[1:1:32]'
morphrate1=cell(32,1)
morphrate2=cell(32,1)
Set=cell(32,1)
Stimulus1=cell(32,1)
Stimulus2=cell(32,1)
names=cell(32,1)
directory=cell(32,1)


for i=1:32
    filename=filelist(i,1).name
    names{i,:}=[filedir,filename]
    location1 = strfind(filename, 'Specification')
    Set{i,:}=filename(1:location1-2)
    Stimulus=filename(location1+13:location1+14)
    Stimulus1{i,:} = Stimulus(1)
    Stimulus2{i,:} = Stimulus(2)
    morphrate1{i,:}=filename(location1+16:location1+18)
    morphrate2{i,:}=filename(location1+20:location1+22)
end

mytable=table(trialnr, Set, Stimulus1, Stimulus2, morphrate1, morphrate2, names)

writetable(mytable,'conditions2.csv', 'Delimiter',',')  

%-----------------
%reorder trials based on condition of sequential trials
%%never have two succending trials that are both from the same
%%morphing-pair 
fine=0
while i~32 | fine==0
    randtrials= randperm(32)
    newtable=mytable(randtrials,:)
    for i=1:32
        C=char(table2cell(newtable(i,3)))
        D=char(table2cell(newtable(i+1,3)))
        E=char(table2cell(newtable(i,4)))
        F=char(table2cell(newtable(i+1,4)))
        if C==D & E==F
            fine=0
            i=32
            break
        else
            fine=1
            i=i+1
        end
    end
end

writetable(newtable,'conditions_control.csv', 'Delimiter',',')  

