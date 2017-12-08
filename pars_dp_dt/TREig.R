setwd('C:/Users/Matthew/Documents/C-TRES/TR')

aseig<-read.table('AS_eigs.csv',header=F,sep=',')
omeig<-read.table('OM_eigs.csv',header=F,sep=',')


asgph.noise<-lm(log(V1[1:dim(aseig)[1]])~c(1:dim(aseig)[1]),data=aseig)
asppt.noise<-lm(log(V2[1:dim(aseig)[1]])~c(1:dim(aseig)[1]),data=aseig)
astemp.noise<-lm(log(V3[1:dim(aseig)[1]])~c(1:dim(aseig)[1]),data=aseig)
omgph.noise<-lm(log(V1[1:dim(omeig)[1]])~c(1:dim(omeig)[1]),data=omeig)
omppt.noise<-lm(log(V2[1:dim(omeig)[1]])~c(1:dim(omeig)[1]),data=omeig)
omtemp.noise<-lm(log(V3[1:dim(omeig)[1]])~c(1:dim(omeig)[1]),data=omeig)

noise.spectrum.as<-data.frame(asgph=(log(aseig$V1)>predict(asgph.noise)),
asppt=(log(aseig$V2)>predict(asppt.noise)),
astemp=(log(aseig$V3)>predict(astemp.noise)))

noise.spectrum.om<-data.frame(omgph=(log(omeig$V1)>predict(omgph.noise)),
omppt=(log(omeig$V2)>predict(omppt.noise)),
omtemp=(log(omeig$V3)>predict(omtemp.noise)))



plot(log(V3)~c(1:dim(astemp)[1]),data=astemp, ylab='Log of eigenvalue', 
xlab='Factor number', main='Estimated noise spectrum for GPH chronologies')
abline(astemp.noise999)
