%% CE map

% CCA
subplot(6,3,1)
axis off
axesm('robinson','MapLatLimit',latlim,'MapLonLimit',lonlim,'grid','on','PLineLocation',10,'MLineLocation',20,'MeridianLabel','off','ParallelLabel','off','GLineWidth',0.5)
geoshow(states,'FaceColor',[.9 .9 .9],'LineWidth',0.4)
geoshow(worldland,'FaceColor',[.9 .9 .9],'LineWidth',0.6)
box off
surfm(AS_GPH.lat,AS_GPH.lon,AS_GPH.CCA.CE)
caxis([-0.05 .5])
colormap(gray(11))
subplotsqueeze(gca,1.6)
htext = text(-1,1.1,'a', 'FontName','Times New Roman','Fontweight','bold','FontSize',14);

subplot(6,3,4)
axis off
axesm('robinson','MapLatLimit',latlim,'MapLonLimit',lonlim,'grid','on','PLineLocation',10,'MLineLocation',20,'MeridianLabel','off','ParallelLabel','off','GLineWidth',0.5)
geoshow(states,'FaceColor',[.9 .9 .9],'LineWidth',0.4)
geoshow(worldland,'FaceColor',[.9 .9 .9],'LineWidth',0.6)
box off
surfm(AS_GPH.lat,AS_GPH.lon,AS_PPT.CCA.CE)
caxis([-0.05 .5])
colormap(gray(11))
subplotsqueeze(gca,1.6)
htext = text(-1,1.1,'d', 'FontName','Times New Roman','Fontweight','bold','FontSize',14);

subplot(6,3,7)
axis off
axesm('robinson','MapLatLimit',latlim,'MapLonLimit',lonlim,'grid','on','PLineLocation',10,'MLineLocation',20,'MeridianLabel','off','ParallelLabel','off','GLineWidth',0.5)
geoshow(states,'FaceColor',[.9 .9 .9],'LineWidth',0.4)
geoshow(worldland,'FaceColor',[.9 .9 .9],'LineWidth',0.6)
box off
surfm(AS_GPH.lat,AS_GPH.lon,AS_TEMP.CCA.CE)
caxis([-0.05 .5])
colormap(gray(11))
subplotsqueeze(gca,1.6)
htext = text(-1,1.1,'g', 'FontName','Times New Roman','Fontweight','bold','FontSize',14);

subplot(6,3,10)
axis off
axesm('robinson','MapLatLimit',latlim,'MapLonLimit',lonlim,'grid','on','PLineLocation',10,'MLineLocation',20,'MeridianLabel','off','ParallelLabel','off','GLineWidth',0.5)
geoshow(states,'FaceColor',[.9 .9 .9],'LineWidth',0.4)
geoshow(worldland,'FaceColor',[.9 .9 .9],'LineWidth',0.6)
box off
surfm(AS_GPH.lat,AS_GPH.lon,OM_GPH.CCA.CE)
caxis([-0.05 .5])
colormap(gray(11))
subplotsqueeze(gca,1.6)
htext = text(-1,1.1,'j', 'FontName','Times New Roman','Fontweight','bold','FontSize',14);

subplot(6,3,13)
axis off
axesm('robinson','MapLatLimit',latlim,'MapLonLimit',lonlim,'grid','on','PLineLocation',10,'MLineLocation',20,'MeridianLabel','off','ParallelLabel','off','GLineWidth',0.5)
geoshow(states,'FaceColor',[.9 .9 .9],'LineWidth',0.4)
geoshow(worldland,'FaceColor',[.9 .9 .9],'LineWidth',0.6)
box off
surfm(AS_GPH.lat,AS_GPH.lon,OM_PPT.CCA.CE)
caxis([-0.05 .5])
colormap(gray(11))
subplotsqueeze(gca,1.6)
htext = text(-1,1.1,'m', 'FontName','Times New Roman','Fontweight','bold','FontSize',14);

subplot(6,3,16)
axis off
axesm('robinson','MapLatLimit',latlim,'MapLonLimit',lonlim,'grid','on','PLineLocation',10,'MLineLocation',20,'MeridianLabel','off','ParallelLabel','off','GLineWidth',0.5)
geoshow(states,'FaceColor',[.9 .9 .9],'LineWidth',0.4)
geoshow(worldland,'FaceColor',[.9 .9 .9],'LineWidth',0.6)
box off
surfm(AS_GPH.lat,AS_GPH.lon,OM_TEMP.CCA.CE)
caxis([-0.05 .5])
colormap(gray(11))
subplotsqueeze(gca,1.6)
htext = text(-1,1.1,'p', 'FontName','Times New Roman','Fontweight','bold','FontSize',14);

%RegEM-ridge
subplot(6,3,2)
axis off
axesm('robinson','MapLatLimit',latlim,'MapLonLimit',lonlim,'grid','on','PLineLocation',10,'MLineLocation',20,'MeridianLabel','off','ParallelLabel','off','GLineWidth',0.5)
geoshow(states,'FaceColor',[.9 .9 .9],'LineWidth',0.4)
geoshow(worldland,'FaceColor',[.9 .9 .9],'LineWidth',0.6)
box off
surfm(AS_GPH.lat,AS_GPH.lon,AS_GPH.RegEM.CE)
caxis([-0.05 .5])
colormap(gray(11))
subplotsqueeze(gca,1.6)
htext = text(-1,1.1,'b', 'FontName','Times New Roman','Fontweight','bold','FontSize',14);

subplot(6,3,5)
axis off
axesm('robinson','MapLatLimit',latlim,'MapLonLimit',lonlim,'grid','on','PLineLocation',10,'MLineLocation',20,'MeridianLabel','off','ParallelLabel','off','GLineWidth',0.5)
geoshow(states,'FaceColor',[.9 .9 .9],'LineWidth',0.4)
geoshow(worldland,'FaceColor',[.9 .9 .9],'LineWidth',0.6)
box off
surfm(AS_GPH.lat,AS_GPH.lon,AS_PPT.RegEM.CE)
caxis([-0.05 .5])
colormap(gray(11))
subplotsqueeze(gca,1.6)
htext = text(-1,1.1,'e', 'FontName','Times New Roman','Fontweight','bold','FontSize',14);

subplot(6,3,8)
axis off
axesm('robinson','MapLatLimit',latlim,'MapLonLimit',lonlim,'grid','on','PLineLocation',10,'MLineLocation',20,'MeridianLabel','off','ParallelLabel','off','GLineWidth',0.5)
geoshow(states,'FaceColor',[.9 .9 .9],'LineWidth',0.4)
geoshow(worldland,'FaceColor',[.9 .9 .9],'LineWidth',0.6)
box off
surfm(AS_GPH.lat,AS_GPH.lon,AS_TEMP.RegEM.CE)
caxis([-0.05 .5])
colormap(gray(11))
subplotsqueeze(gca,1.6)
htext = text(-1,1.1,'h', 'FontName','Times New Roman','Fontweight','bold','FontSize',14);

subplot(6,3,11)
axis off
axesm('robinson','MapLatLimit',latlim,'MapLonLimit',lonlim,'grid','on','PLineLocation',10,'MLineLocation',20,'MeridianLabel','off','ParallelLabel','off','GLineWidth',0.5)
geoshow(states,'FaceColor',[.9 .9 .9],'LineWidth',0.4)
geoshow(worldland,'FaceColor',[.9 .9 .9],'LineWidth',0.6)
box off
surfm(AS_GPH.lat,AS_GPH.lon,OM_GPH.RegEM.CE)
caxis([-0.05 .5])
colormap(gray(11))
subplotsqueeze(gca,1.6)
htext = text(-1,1.1,'k', 'FontName','Times New Roman','Fontweight','bold','FontSize',14);

subplot(6,3,14)
axis off
axesm('robinson','MapLatLimit',latlim,'MapLonLimit',lonlim,'grid','on','PLineLocation',10,'MLineLocation',20,'MeridianLabel','off','ParallelLabel','off','GLineWidth',0.5)
geoshow(states,'FaceColor',[.9 .9 .9],'LineWidth',0.4)
geoshow(worldland,'FaceColor',[.9 .9 .9],'LineWidth',0.6)
box off
surfm(AS_GPH.lat,AS_GPH.lon,OM_PPT.RegEM.CE)
caxis([-0.05 .5])
colormap(gray(11))
subplotsqueeze(gca,1.6)
htext = text(-1,1.1,'n', 'FontName','Times New Roman','Fontweight','bold','FontSize',14);

subplot(6,3,17)
axis off
axesm('robinson','MapLatLimit',latlim,'MapLonLimit',lonlim,'grid','on','PLineLocation',10,'MLineLocation',20,'MeridianLabel','off','ParallelLabel','off','GLineWidth',0.5)
geoshow(states,'FaceColor',[.9 .9 .9],'LineWidth',0.4)
geoshow(worldland,'FaceColor',[.9 .9 .9],'LineWidth',0.6)
box off
surfm(AS_GPH.lat,AS_GPH.lon,OM_TEMP.RegEM.CE)
caxis([-0.05 .5])
colormap(gray(11))
subplotsqueeze(gca,1.6)
htext = text(-1,1.1,'q', 'FontName','Times New Roman','Fontweight','bold','FontSize',14);

% PPR
subplot(6,3,3)
axis off
axesm('robinson','MapLatLimit',latlim,'MapLonLimit',lonlim,'grid','on','PLineLocation',10,'MLineLocation',20,'MeridianLabel','off','ParallelLabel','off','GLineWidth',0.5)
geoshow(states,'FaceColor',[.9 .9 .9],'LineWidth',0.4)
geoshow(worldland,'FaceColor',[.9 .9 .9],'LineWidth',0.6)
box off
surfm(AS_GPH.lat,AS_GPH.lon,AS_GPH.PPR.CE)
caxis([-0.05 .5])
colormap(gray(11))
subplotsqueeze(gca,1.6)
htext = text(-1,1.1,'c', 'FontName','Times New Roman','Fontweight','bold','FontSize',14);

subplot(6,3,6)
axis off
axesm('robinson','MapLatLimit',latlim,'MapLonLimit',lonlim,'grid','on','PLineLocation',10,'MLineLocation',20,'MeridianLabel','off','ParallelLabel','off','GLineWidth',0.5)
geoshow(states,'FaceColor',[.9 .9 .9],'LineWidth',0.4)
geoshow(worldland,'FaceColor',[.9 .9 .9],'LineWidth',0.6)
box off
surfm(AS_GPH.lat,AS_GPH.lon,AS_PPT.PPR.CE)
caxis([-0.05 .5])
colormap(gray(11))
subplotsqueeze(gca,1.6)
htext = text(-1,1.1,'f', 'FontName','Times New Roman','Fontweight','bold','FontSize',14);

subplot(6,3,9)
axis off
axesm('robinson','MapLatLimit',latlim,'MapLonLimit',lonlim,'grid','on','PLineLocation',10,'MLineLocation',20,'MeridianLabel','off','ParallelLabel','off','GLineWidth',0.5)
geoshow(states,'FaceColor',[.9 .9 .9],'LineWidth',0.4)
geoshow(worldland,'FaceColor',[.9 .9 .9],'LineWidth',0.6)
box off
surfm(AS_GPH.lat,AS_GPH.lon,AS_TEMP.PPR.CE)
caxis([-0.05 .5])
colormap(gray(11))
subplotsqueeze(gca,1.6)
htext = text(-1,1.1,'i', 'FontName','Times New Roman','Fontweight','bold','FontSize',14);

subplot(6,3,12)
axis off
axesm('robinson','MapLatLimit',latlim,'MapLonLimit',lonlim,'grid','on','PLineLocation',10,'MLineLocation',20,'MeridianLabel','off','ParallelLabel','off','GLineWidth',0.5)
geoshow(states,'FaceColor',[.9 .9 .9],'LineWidth',0.4)
geoshow(worldland,'FaceColor',[.9 .9 .9],'LineWidth',0.6)
box off
surfm(AS_GPH.lat,AS_GPH.lon,OM_GPH.PPR.CE)
caxis([-0.05 .5])
colormap(gray(11))
subplotsqueeze(gca,1.6)
htext = text(-1,1.1,'l', 'FontName','Times New Roman','Fontweight','bold','FontSize',14);

subplot(6,3,15)
axis off
axesm('robinson','MapLatLimit',latlim,'MapLonLimit',lonlim,'grid','on','PLineLocation',10,'MLineLocation',20,'MeridianLabel','off','ParallelLabel','off','GLineWidth',0.5)
geoshow(states,'FaceColor',[.9 .9 .9],'LineWidth',0.4)
geoshow(worldland,'FaceColor',[.9 .9 .9],'LineWidth',0.6)
box off
surfm(AS_GPH.lat,AS_GPH.lon,OM_PPT.PPR.CE)
caxis([-0.05 .5])
colormap(gray(11))
subplotsqueeze(gca,1.6)
htext = text(-1,1.1,'o', 'FontName','Times New Roman','Fontweight','bold','FontSize',14);

subplot(6,3,18)
axis off
axesm('robinson','MapLatLimit',latlim,'MapLonLimit',lonlim,'grid','on','PLineLocation',10,'MLineLocation',20,'MeridianLabel','off','ParallelLabel','off','GLineWidth',0.5)
geoshow(states,'FaceColor',[.9 .9 .9],'LineWidth',0.4)
geoshow(worldland,'FaceColor',[.9 .9 .9],'LineWidth',0.6)
box off
surfm(AS_GPH.lat,AS_GPH.lon,OM_TEMP.PPR.CE)
caxis([-.05 .5])
colormap(gray(11))
subplotsqueeze(gca,1.6)
htext = text(-1,1.1,'r', 'FontName','Times New Roman','Fontweight','bold','FontSize',14);

% Flip color scheme
colormap(flipud(gray))