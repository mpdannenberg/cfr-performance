% Boxplots for CFR comparison

%% Corr boxplots
R_AS_GPH(:,1)=reshape(AS_GPH.CCA.r,[],1);
R_AS_GPH(:,2)=reshape(AS_GPH.RegEM.r,[],1);
R_AS_GPH(:,3)=reshape(AS_GPH.PPR.r,[],1);
R_AS_PPT(:,1)=reshape(AS_PPT.CCA.r,[],1);
R_AS_PPT(:,2)=reshape(AS_PPT.RegEM.r,[],1);
R_AS_PPT(:,3)=reshape(AS_PPT.PPR.r,[],1);
R_AS_TEMP(:,1)=reshape(AS_TEMP.CCA.r,[],1);
R_AS_TEMP(:,2)=reshape(AS_TEMP.RegEM.r,[],1);
R_AS_TEMP(:,3)=reshape(AS_TEMP.PPR.r,[],1);
R_OM_GPH(:,1)=reshape(OM_GPH.CCA.r,[],1);
R_OM_GPH(:,2)=reshape(OM_GPH.RegEM.r,[],1);
R_OM_GPH(:,3)=reshape(OM_GPH.PPR.r,[],1);
R_OM_PPT(:,1)=reshape(OM_PPT.CCA.r,[],1);
R_OM_PPT(:,2)=reshape(OM_PPT.RegEM.r,[],1);
R_OM_PPT(:,3)=reshape(OM_PPT.PPR.r,[],1);
R_OM_TEMP(:,1)=reshape(OM_TEMP.CCA.r,[],1);
R_OM_TEMP(:,2)=reshape(OM_TEMP.RegEM.r,[],1);
R_OM_TEMP(:,3)=reshape(OM_TEMP.PPR.r,[],1);

figure
subplot(2,3,1)
boxplot(R_AS_GPH,'whisker',2,'outliersize',2,'notch','on','orientation','horizontal','datalim',[-1.0 1.0])
set(gca,'YTickLabel',{' '},'XLim',[-0.69 0.69])
htext = text(-0.64,3.25,'a', 'FontName','Times New Roman','Fontweight','bold','FontSize',16);
htext = text(-1.02,1,'CCA', 'FontName','Times New Roman','FontSize',14);
htext = text(-1.02,2,'RegEM', 'FontName','Times New Roman','FontSize',14);
htext = text(-1.02,3,'PPR', 'FontName','Times New Roman','FontSize',14);

subplot(2,3,2)
boxplot(R_AS_PPT,'whisker',2,'outliersize',2,'notch','on','orientation','horizontal','datalim',[-1.0 1.0])
set(gca,'YTickLabel',{' '},'XLim',[-0.69 0.69])
htext = text(-0.64,3.25,'b', 'FontName','Times New Roman','Fontweight','bold','FontSize',16);

subplot(2,3,3)
boxplot(R_AS_TEMP,'whisker',2,'outliersize',2,'notch','on','orientation','horizontal','datalim',[-1.0 1.0])
set(gca,'YTickLabel',{' '},'XLim',[-0.69 0.69])
htext = text(-0.64,3.25,'c', 'FontName','Times New Roman','Fontweight','bold','FontSize',16);

subplot(2,3,4)
boxplot(R_OM_GPH,'whisker',2,'outliersize',2,'notch','on','orientation','horizontal','datalim',[-1.0 1.0])
set(gca,'YTickLabel',{' '},'XLim',[-0.69 0.69])
htext = text(-0.64,3.25,'d', 'FontName','Times New Roman','Fontweight','bold','FontSize',16);
htext = text(-1.02,1,'CCA', 'FontName','Times New Roman','FontSize',14);
htext = text(-1.02,2,'RegEM', 'FontName','Times New Roman','FontSize',14);
htext = text(-1.02,3,'PPR', 'FontName','Times New Roman','FontSize',14);

subplot(2,3,5)
boxplot(R_OM_PPT,'whisker',2,'outliersize',2,'notch','on','orientation','horizontal','datalim',[-1.0 1.0])
set(gca,'YTickLabel',{' '},'XLim',[-0.69 0.69])
htext = text(-0.64,3.25,'e', 'FontName','Times New Roman','Fontweight','bold','FontSize',16);

subplot(2,3,6)
boxplot(R_OM_TEMP,'whisker',2,'outliersize',2,'notch','on','orientation','horizontal','datalim',[-1.0 1.0])
set(gca,'YTickLabel',{' '},'XLim',[-0.69 0.69])
htext = text(-0.64,3.25,'f', 'FontName','Times New Roman','Fontweight','bold','FontSize',16);

%% CE boxplots
CE_AS_PPT(:,1)=reshape(AS_PPT.CCA.CE,[],1);
CE_AS_PPT(:,2)=reshape(AS_PPT.RegEM.CE,[],1);
CE_AS_PPT(:,3)=reshape(AS_PPT.PPR.CE,[],1);
CE_AS_GPH(:,1)=reshape(AS_GPH.CCA.CE,[],1);
CE_AS_GPH(:,2)=reshape(AS_GPH.RegEM.CE,[],1);
CE_AS_GPH(:,3)=reshape(AS_GPH.PPR.CE,[],1);
CE_AS_PPT(:,1)=reshape(AS_PPT.CCA.CE,[],1);
CE_AS_PPT(:,2)=reshape(AS_PPT.RegEM.CE,[],1);
CE_AS_PPT(:,3)=reshape(AS_PPT.PPR.CE,[],1);
CE_AS_TEMP(:,1)=reshape(AS_TEMP.CCA.CE,[],1);
CE_AS_TEMP(:,2)=reshape(AS_TEMP.RegEM.CE,[],1);
CE_AS_TEMP(:,3)=reshape(AS_TEMP.PPR.CE,[],1);
CE_OM_GPH(:,1)=reshape(OM_GPH.CCA.CE,[],1);
CE_OM_GPH(:,2)=reshape(OM_GPH.RegEM.CE,[],1);
CE_OM_GPH(:,3)=reshape(OM_GPH.PPR.CE,[],1);
CE_OM_PPT(:,1)=reshape(OM_PPT.CCA.CE,[],1);
CE_OM_PPT(:,2)=reshape(OM_PPT.RegEM.CE,[],1);
CE_OM_PPT(:,3)=reshape(OM_PPT.PPR.CE,[],1);
CE_OM_TEMP(:,1)=reshape(OM_TEMP.CCA.CE,[],1);
CE_OM_TEMP(:,2)=reshape(OM_TEMP.RegEM.CE,[],1);
CE_OM_TEMP(:,3)=reshape(OM_TEMP.PPR.CE,[],1);

figure
subplot(2,3,1)
boxplot(CE_AS_GPH,'whisker',2,'outliersize',2,'notch','on','orientation','horizontal')
set(gca,'YTickLabel',{' '},'XLim',[-0.65 0.45],'XTick',[-0.6 -0.4 -0.2 0 0.2 0.4])
htext = text(-0.6,3.25,'a', 'FontName','Times New Roman','Fontweight','bold','FontSize',16);
htext = text(-0.9,1,'CCA', 'FontName','Times New Roman','FontSize',14);
htext = text(-0.9,2,'RegEM', 'FontName','Times New Roman','FontSize',14);
htext = text(-0.9,3,'PPR', 'FontName','Times New Roman','FontSize',14);

subplot(2,3,2)
boxplot(CE_AS_PPT,'whisker',2,'outliersize',2,'notch','on','orientation','horizontal')
set(gca,'YTickLabel',{' '},'XLim',[-0.65 0.45],'XTick',[-0.6 -0.4 -0.2 0 0.2 0.4])
htext = text(-0.6,3.25,'b', 'FontName','Times New Roman','Fontweight','bold','FontSize',16);

subplot(2,3,3)
boxplot(CE_AS_TEMP,'whisker',2,'outliersize',2,'notch','on','orientation','horizontal')
set(gca,'YTickLabel',{' '},'XLim',[-0.65 0.45],'XTick',[-0.6 -0.4 -0.2 0 0.2 0.4])
htext = text(-0.6,3.25,'c', 'FontName','Times New Roman','Fontweight','bold','FontSize',16);

subplot(2,3,4)
boxplot(CE_OM_GPH,'whisker',2,'outliersize',2,'notch','on','orientation','horizontal')
set(gca,'YTickLabel',{' '},'XLim',[-0.65 0.45],'XTick',[-0.6 -0.4 -0.2 0 0.2 0.4])
htext = text(-0.6,3.25,'d', 'FontName','Times New Roman','Fontweight','bold','FontSize',16);
htext = text(-0.9,1,'CCA', 'FontName','Times New Roman','FontSize',14);
htext = text(-0.9,2,'RegEM', 'FontName','Times New Roman','FontSize',14);
htext = text(-0.9,3,'PPR', 'FontName','Times New Roman','FontSize',14);

subplot(2,3,5)
boxplot(CE_OM_PPT,'whisker',2,'outliersize',2,'notch','on','orientation','horizontal')
set(gca,'YTickLabel',{' '},'XLim',[-0.65 0.45],'XTick',[-0.6 -0.4 -0.2 0 0.2 0.4])
htext = text(-0.6,3.25,'e', 'FontName','Times New Roman','Fontweight','bold','FontSize',16);

subplot(2,3,6)
boxplot(CE_OM_TEMP,'whisker',2,'outliersize',2,'notch','on','orientation','horizontal')
set(gca,'YTickLabel',{' '},'XLim',[-0.65 0.45],'XTick',[-0.6 -0.4 -0.2 0 0.2 0.4])
htext = text(-0.6,3.25,'f', 'FontName','Times New Roman','Fontweight','bold','FontSize',16);

%% RMSE boxplots
RMSE_AS_GPH(:,1)=reshape(AS_GPH.CCA.RMSE,[],1);
RMSE_AS_GPH(:,2)=reshape(AS_GPH.RegEM.RMSE,[],1);
RMSE_AS_GPH(:,3)=reshape(AS_GPH.PPR.RMSE,[],1);
RMSE_AS_PPT(:,1)=reshape(AS_PPT.CCA.RMSE,[],1);
RMSE_AS_PPT(:,2)=reshape(AS_PPT.RegEM.RMSE,[],1);
RMSE_AS_PPT(:,3)=reshape(AS_PPT.PPR.RMSE,[],1);
RMSE_AS_TEMP(:,1)=reshape(AS_TEMP.CCA.RMSE,[],1);
RMSE_AS_TEMP(:,2)=reshape(AS_TEMP.RegEM.RMSE,[],1);
RMSE_AS_TEMP(:,3)=reshape(AS_TEMP.PPR.RMSE,[],1);
RMSE_OM_GPH(:,1)=reshape(OM_GPH.CCA.RMSE,[],1);
RMSE_OM_GPH(:,2)=reshape(OM_GPH.RegEM.RMSE,[],1);
RMSE_OM_GPH(:,3)=reshape(OM_GPH.PPR.RMSE,[],1);
RMSE_OM_PPT(:,1)=reshape(OM_PPT.CCA.RMSE,[],1);
RMSE_OM_PPT(:,2)=reshape(OM_PPT.RegEM.RMSE,[],1);
RMSE_OM_PPT(:,3)=reshape(OM_PPT.PPR.RMSE,[],1);
RMSE_OM_TEMP(:,1)=reshape(OM_TEMP.CCA.RMSE,[],1);
RMSE_OM_TEMP(:,2)=reshape(OM_TEMP.RegEM.RMSE,[],1);
RMSE_OM_TEMP(:,3)=reshape(OM_TEMP.PPR.RMSE,[],1);

figure
subplot(2,3,1)
boxplot(RMSE_AS_GPH,'whisker',2,'outliersize',2,'notch','on','orientation','horizontal')
set(gca,'YTickLabel',{' '},'XLim',[0.68 1.32],'XTick',[0.7 0.8 0.9 1.0 1.1 1.2 1.3])
htext = text(0.71,3.25,'a', 'FontName','Times New Roman','Fontweight','bold','FontSize',16);
htext = text(0.53,1,'CCA', 'FontName','Times New Roman','FontSize',14);
htext = text(0.53,2,'RegEM', 'FontName','Times New Roman','FontSize',14);
htext = text(0.53,3,'PPR', 'FontName','Times New Roman','FontSize',14);

subplot(2,3,2)
boxplot(RMSE_AS_PPT,'whisker',2,'outliersize',2,'notch','on','orientation','horizontal')
set(gca,'YTickLabel',{' '},'XLim',[0.68 1.32],'XTick',[0.7 0.8 0.9 1.0 1.1 1.2 1.3])
htext = text(0.71,3.25,'b', 'FontName','Times New Roman','Fontweight','bold','FontSize',16);

subplot(2,3,3)
boxplot(RMSE_AS_TEMP,'whisker',2,'outliersize',2,'notch','on','orientation','horizontal')
set(gca,'YTickLabel',{' '},'XLim',[0.68 1.32],'XTick',[0.7 0.8 0.9 1.0 1.1 1.2 1.3])
htext = text(0.71,3.25,'c', 'FontName','Times New Roman','Fontweight','bold','FontSize',16);

subplot(2,3,4)
boxplot(RMSE_OM_GPH,'whisker',2,'outliersize',2,'notch','on','orientation','horizontal')
set(gca,'YTickLabel',{' '},'XLim',[0.68 1.32],'XTick',[0.7 0.8 0.9 1.0 1.1 1.2 1.3])
htext = text(0.71,3.25,'d', 'FontName','Times New Roman','Fontweight','bold','FontSize',16);
htext = text(0.53,1,'CCA', 'FontName','Times New Roman','FontSize',14);
htext = text(0.53,2,'RegEM', 'FontName','Times New Roman','FontSize',14);
htext = text(0.53,3,'PPR', 'FontName','Times New Roman','FontSize',14);

subplot(2,3,5)
boxplot(RMSE_OM_PPT,'whisker',2,'outliersize',2,'notch','on','orientation','horizontal')
set(gca,'YTickLabel',{' '},'XLim',[0.68 1.32],'XTick',[0.7 0.8 0.9 1.0 1.1 1.2 1.3])
htext = text(0.71,3.25,'e', 'FontName','Times New Roman','Fontweight','bold','FontSize',16);

subplot(2,3,6)
boxplot(RMSE_OM_TEMP,'whisker',2,'outliersize',2,'notch','on','orientation','horizontal')
set(gca,'YTickLabel',{' '},'XLim',[0.68 1.32],'XTick',[0.7 0.8 0.9 1.0 1.1 1.2 1.3])
htext = text(0.71,3.25,'f', 'FontName','Times New Roman','Fontweight','bold','FontSize',16);


%% Bias boxplots
bias_AS_GPH(:,1)=reshape(AS_GPH.CCA.bias,[],1);
bias_AS_GPH(:,2)=reshape(AS_GPH.RegEM.bias,[],1);
bias_AS_GPH(:,3)=reshape(AS_GPH.PPR.bias,[],1);
bias_AS_PPT(:,1)=reshape(AS_PPT.CCA.bias,[],1);
bias_AS_PPT(:,2)=reshape(AS_PPT.RegEM.bias,[],1);
bias_AS_PPT(:,3)=reshape(AS_PPT.PPR.bias,[],1);
bias_AS_TEMP(:,1)=reshape(AS_TEMP.CCA.bias,[],1);
bias_AS_TEMP(:,2)=reshape(AS_TEMP.RegEM.bias,[],1);
bias_AS_TEMP(:,3)=reshape(AS_TEMP.PPR.bias,[],1);
bias_OM_GPH(:,1)=reshape(OM_GPH.CCA.bias,[],1);
bias_OM_GPH(:,2)=reshape(OM_GPH.RegEM.bias,[],1);
bias_OM_GPH(:,3)=reshape(OM_GPH.PPR.bias,[],1);
bias_OM_PPT(:,1)=reshape(OM_PPT.CCA.bias,[],1);
bias_OM_PPT(:,2)=reshape(OM_PPT.RegEM.bias,[],1);
bias_OM_PPT(:,3)=reshape(OM_PPT.PPR.bias,[],1);
bias_OM_TEMP(:,1)=reshape(OM_TEMP.CCA.bias,[],1);
bias_OM_TEMP(:,2)=reshape(OM_TEMP.RegEM.bias,[],1);
bias_OM_TEMP(:,3)=reshape(OM_TEMP.PPR.bias,[],1);

figure
subplot(2,3,1)
boxplot(bias_AS_GPH,'whisker',2,'outliersize',2,'notch','on','orientation','horizontal')
set(gca,'YTickLabel',{' '},'XLim',[-0.105 0.105])
htext = text(-0.1,3.22,'a', 'FontName','Times New Roman','Fontweight','bold','FontSize',16);
htext = text(-0.152,1,'CCA', 'FontName','Times New Roman','FontSize',14);
htext = text(-0.152,2,'RegEM', 'FontName','Times New Roman','FontSize',14);
htext = text(-0.152,3,'PPR', 'FontName','Times New Roman','FontSize',14);

subplot(2,3,2)
boxplot(bias_AS_PPT,'whisker',2,'outliersize',2,'notch','on','orientation','horizontal')
set(gca,'YTickLabel',{' '},'XLim',[-0.105 0.105])
htext = text(-0.1,3.22,'b', 'FontName','Times New Roman','Fontweight','bold','FontSize',16);

subplot(2,3,3)
boxplot(bias_AS_TEMP,'whisker',2,'outliersize',2,'notch','on','orientation','horizontal')
set(gca,'YTickLabel',{' '},'XLim',[-0.105 0.105])
htext = text(-0.1,3.22,'c', 'FontName','Times New Roman','Fontweight','bold','FontSize',16);

subplot(2,3,4)
boxplot(bias_OM_GPH,'whisker',2,'outliersize',2,'notch','on','orientation','horizontal')
set(gca,'YTickLabel',{' '},'XLim',[-0.105 0.105])
htext = text(-0.1,3.22,'d', 'FontName','Times New Roman','Fontweight','bold','FontSize',16);
htext = text(-0.152,1,'CCA', 'FontName','Times New Roman','FontSize',14);
htext = text(-0.152,2,'RegEM', 'FontName','Times New Roman','FontSize',14);
htext = text(-0.152,3,'PPR', 'FontName','Times New Roman','FontSize',14);

subplot(2,3,5)
boxplot(bias_OM_PPT,'whisker',2,'outliersize',2,'notch','on','orientation','horizontal')
set(gca,'YTickLabel',{' '},'XLim',[-0.105 0.105])
htext = text(-0.1,3.22,'e', 'FontName','Times New Roman','Fontweight','bold','FontSize',16);

subplot(2,3,6)
boxplot(bias_OM_TEMP,'whisker',2,'outliersize',2,'notch','on','orientation','horizontal')
set(gca,'YTickLabel',{' '},'XLim',[-0.105 0.105])
htext = text(-0.1,3.22,'f', 'FontName','Times New Roman','Fontweight','bold','FontSize',16);


%% Std Ratio boxplots
stdr_AS_GPH(:,1)=reshape(AS_GPH.CCA.SDR,[],1);
stdr_AS_GPH(:,2)=reshape(AS_GPH.RegEM.SDR,[],1);
stdr_AS_GPH(:,3)=reshape(AS_GPH.PPR.SDR,[],1);
stdr_AS_PPT(:,1)=reshape(AS_PPT.CCA.SDR,[],1);
stdr_AS_PPT(:,2)=reshape(AS_PPT.RegEM.SDR,[],1);
stdr_AS_PPT(:,3)=reshape(AS_PPT.PPR.SDR,[],1);
stdr_AS_TEMP(:,1)=reshape(AS_TEMP.CCA.SDR,[],1);
stdr_AS_TEMP(:,2)=reshape(AS_TEMP.RegEM.SDR,[],1);
stdr_AS_TEMP(:,3)=reshape(AS_TEMP.PPR.SDR,[],1);
stdr_OM_GPH(:,1)=reshape(OM_GPH.CCA.SDR,[],1);
stdr_OM_GPH(:,2)=reshape(OM_GPH.RegEM.SDR,[],1);
stdr_OM_GPH(:,3)=reshape(OM_GPH.PPR.SDR,[],1);
stdr_OM_PPT(:,1)=reshape(OM_PPT.CCA.SDR,[],1);
stdr_OM_PPT(:,2)=reshape(OM_PPT.RegEM.SDR,[],1);
stdr_OM_PPT(:,3)=reshape(OM_PPT.PPR.SDR,[],1);
stdr_OM_TEMP(:,1)=reshape(OM_TEMP.CCA.SDR,[],1);
stdr_OM_TEMP(:,2)=reshape(OM_TEMP.RegEM.SDR,[],1);
stdr_OM_TEMP(:,3)=reshape(OM_TEMP.PPR.SDR,[],1);

figure
subplot(2,3,1)
boxplot(stdr_AS_GPH,'whisker',2,'outliersize',2,'notch','on','orientation','horizontal','extrememode','compress')
set(gca,'YTickLabel',{' '},'XLim',[-0.02 0.72],'XTick',[0 0.1 0.2 0.3 0.4 0.5 0.6 0.7])
htext = text(0.01,3.25,'a', 'FontName','Times New Roman','Fontweight','bold','FontSize',16);
htext = text(-0.22,1,'CCA', 'FontName','Times New Roman','FontSize',14);
htext = text(-0.22,2,'RegEM', 'FontName','Times New Roman','FontSize',14);
htext = text(-0.22,3,'PPR', 'FontName','Times New Roman','FontSize',14);

subplot(2,3,2)
boxplot(stdr_AS_PPT,'whisker',2,'outliersize',2,'notch','on','orientation','horizontal','extrememode','compress')
set(gca,'YTickLabel',{' '},'XLim',[-0.02 0.72],'XTick',[0 0.1 0.2 0.3 0.4 0.5 0.6 0.7])
htext = text(0.01,3.25,'b', 'FontName','Times New Roman','Fontweight','bold','FontSize',16);

subplot(2,3,3)
boxplot(stdr_AS_TEMP,'whisker',2,'outliersize',2,'notch','on','orientation','horizontal','extrememode','compress')
set(gca,'YTickLabel',{' '},'XLim',[-0.02 0.72],'XTick',[0 0.1 0.2 0.3 0.4 0.5 0.6 0.7])
htext = text(0.01,3.25,'c', 'FontName','Times New Roman','Fontweight','bold','FontSize',16);

subplot(2,3,4)
boxplot(stdr_OM_GPH,'whisker',2,'outliersize',2,'notch','on','orientation','horizontal','extrememode','compress')
set(gca,'YTickLabel',{' '},'XLim',[-0.02 0.72],'XTick',[0 0.1 0.2 0.3 0.4 0.5 0.6 0.7])
htext = text(0.01,3.25,'d', 'FontName','Times New Roman','Fontweight','bold','FontSize',16);
htext = text(-0.22,1,'CCA', 'FontName','Times New Roman','FontSize',14);
htext = text(-0.22,2,'RegEM', 'FontName','Times New Roman','FontSize',14);
htext = text(-0.22,3,'PPR', 'FontName','Times New Roman','FontSize',14);

subplot(2,3,5)
boxplot(stdr_OM_PPT,'whisker',2,'outliersize',2,'notch','on','orientation','horizontal','extrememode','compress')
set(gca,'YTickLabel',{' '},'XLim',[-0.02 0.72],'XTick',[0 0.1 0.2 0.3 0.4 0.5 0.6 0.7])
htext = text(0.01,3.25,'e', 'FontName','Times New Roman','Fontweight','bold','FontSize',16);

subplot(2,3,6)
boxplot(stdr_OM_TEMP,'whisker',2,'outliersize',2,'notch','on','orientation','horizontal','extrememode','compress')
set(gca,'YTickLabel',{' '},'XLim',[-0.02 0.72],'XTick',[0 0.1 0.2 0.3 0.4 0.5 0.6 0.7])
htext = text(0.01,3.25,'f', 'FontName','Times New Roman','Fontweight','bold','FontSize',16);

