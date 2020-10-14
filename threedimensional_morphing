%auditory morphing with old straight, without using reference/target GUI


%directory and paths
cd('C:\Users\Teresa\Documents\UZH Arbeit\Test threedimensional morphing')
addpath('C:/Users/Teresa/Documents/UZH Arbeit/straight_new/4Sascha_newest/nwayMorphingProgs20151008/nwayMorphingProgs20151008')
addpath('C:/Users/Teresa/Documents/UZH Arbeit/straight_new/4Sascha/temporallyMorphing')
addpath('C:/Users/Teresa/Documents/UZH Arbeit/straight_new/4Sascha/VoiceMorphing/n-way/nwayMorphingProgs20141111bu')
addpath('C:/Users/Teresa/Documents/UZH Arbeit/straight_new/4Sascha/VoiceMorphing/n-way/TandemSTRAIGHTmonolithicPackage007')
addpath('C:/Users/Teresa/Documents/UZH Arbeit/straight_new/4Sascha/VoiceMorphing/n-way/TVNmorphingGUI')
addpath('C:/Users/Teresa/Documents/UZH Arbeit/Straight/legacy_STRAIGHT-master/morphing_src')
addpath('C:/Users/Teresa/Documents/UZH Arbeit/straight_new/4Sascha_newest/nwayMorphingGUIs20131015v1/nwayMorphingGUIs20131015v1')
addpath('C:/Users/Teresa/Documents/UZH Arbeit/Straight/legacy_STRAIGHT-master/src')


%reading audios from a file 

monkey=createMobject;
human=createMobject;
instrument=createMobject;

[x,fs]=audioread('C:\Users\Teresa\Documents\UZH Arbeit\Test threedimensional morphing\Audio1Furuyama_TW.wav');
monkey=updateFieldOfMobject(monkey, 'waveform',x);

[x,fs]=audioread('C:\Users\Teresa\Documents\UZH Arbeit\Test threedimensional morphing\C6_NEUTRAL(IMP)_TW.wav');
human=updateFieldOfMobject(human, 'waveform',x);

[x,fs]=audioread('C:\Users\Teresa\Documents\UZH Arbeit\Test threedimensional morphing\m05_nov_neu_xxx_v02_TW.wav');
instrument=updateFieldOfMobject(instrument, 'waveform',x);

%speech parameter extraction

monkey=executeSTRAIGHTanalysisM(monkey); 
human=executeSTRAIGHTanalysisM(human);
instrument=executeSTRAIGHTanalysisM(instrument);


save monkey monkey
save human human
save instrument instrument

%display
displayMobject(monkey, 'spectrogram','monkey') 
displayMobject(human, 'spectrogram','human')
displayMobject(instrument, 'spectrogram','instrument')

save monkey monkey
save human human
save instrument instrument

%set anchor without GUI (two dimensional)
displayMobject(monkey, 'spectrogram','monkey') 
[x,y,] = ginput () %terminate with "return"
rawanch= [x,y]
[dm1, indsrt] = sort(rawanch(:,1));
rawanch(indsrt,:)
monkey = setAnchorFromRawAnchor(monkey,rawanch)

displayMobject(human, 'spectrogram','human')
[x,y,] = ginput () %terminate with "return"
rawanch= [x,y]
[dm1, indsrt] = sort(rawanch(:,1));
rawanch(indsrt,:)
human = setAnchorFromRawAnchor(human,rawanch)


displayMobject(instrument, 'spectrogram','instrument')
[x,y,] = ginput () %terminate with "return"
rawanch= [x,y]
[dm1, indsrt] = sort(rawanch(:,1));
rawanch(indsrt,:)
instrument = setAnchorFromRawAnchor(instrument,rawanch)

%anchor information
monkey.anchorTimeLocation
monkey.anchorFrequency
displayMobject(monkey, 'anchorTimeLocation','monkey')

human.anchorTimeLocation
human.anchorFrequency
displayMobject(human, 'anchorTimeLocation','human')

instrument.anchorTimeLocation
instrument.anchorFrequency
displayMobject(instrument, 'anchorTimeLocation','instrument')




%morphing (without time alignment)

mObject3= directSTRAIGHTmorphing(monkey,instrument,0.5,'linear');
displayMobject(mObject3, 'anchorTimeLocation', 'mObject3')
prminSyn.levelNormalizationIndicator = 0;
syneu=executeSTRAIGHTsynthesisM(mObject3,prminSyn);

audiowrite('monkey_instrument.wav',syneu,fs,'BitsPerSample',16);
%%%
mObject2= directSTRAIGHTmorphing(human,instrument,0.5,'linear');
displayMobject(mObject2, 'anchorTimeLocation', 'mObject2')
prminSyn.levelNormalizationIndicator = 0;
syneu=executeSTRAIGHTsynthesisM(mObject2,prminSyn);

audiowrite('human_instrument.wav',syneu,fs,'BitsPerSample',16);
%%%
mObject1= directSTRAIGHTmorphing(monkey,human,0.5,'linear');
displayMobject(mObject1, 'anchorTimeLocation', 'mObject1')
prminSyn.levelNormalizationIndicator = 0;
syneu=executeSTRAIGHTsynthesisM(mObject1,prminSyn);

audiowrite('monkey_human.wav',syneu,fs,'BitsPerSample',16);
