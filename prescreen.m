%% Tree-Ring Chronology pre-screening function
% Created by Matt Dannenberg, 28 March 2012

% Function will select all chronologies that are correlated (at a 99.9% 
% significance level) with at least one climate grid point.

%% Requires two inputs:
% tree = Structure of Tree Ring chronologies 
% climate = Structure of Climate input


function [TR] = prescreen(tree,climate)

tic

climz=reshape(climate.zscore,length(climate.zscore(:,1,1)),[]);

x_year=[1275:2010];
ystart=climate.year(1);
yend=climate.year(length(climate.year));
xstart=find(x_year==ystart);
xend=find(x_year==yend);

TR_prscrn(1:length(x_year),1)=NaN;
lat(1)=0;
lon(1)=0;
index(1)=0;

for i = 1:length(tree)
    Xcorr=tree(i).WISE_RES(xstart:xend);
    for j = 1:length(climz(1,:))
        [~,p]=corrcoef(Xcorr,climz(:,j),'rows','pairwise');
        a(j)=p(1,2);
    end
    if min(a)<0.001 & (tree(i).Lon<0 | tree(i).Lon>=60)
        TR_prscrn(:,end+1)=tree(i).WISE_RES;
        lat(end+1)=tree(i).Lat;
        lon(end+1)=tree(i).Lon;
        index(end+1)=i;
    end    
end

TR.TR=TR_prscrn(:,2:end);
TR.TR_sub=TR_prscrn(xstart:xend,2:end);
TR.TR_lat=lat(2:end);
TR.TR_lon=lon(2:end);
TR.TR_index=index(2:end);
TR.TR_year=x_year';

toc

clear R a i j p X Y Xcorr;