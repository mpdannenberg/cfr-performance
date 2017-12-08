% worldmap('World')

axesm ('eqdcylin','MapLatLimit', [-20 90], 'MapLonLimit', [-19 -20],...
       'MeridianLabel', 'on', 'MLabelLocation', 30, 'ParallelLabe', 'on', ...
           'PLabelLocation', 20, 'MLineLocation',30, 'PLineLocation',20)
framem on; gridm on;

showaxes; grid off;
set(gca, 'XTick', [])
set(gca, 'YTick', [])

% load coast
% plotm(lat,long)
land = shaperead('landareas','UseGeoCoords',true);
geoshow(land,'FaceColor',[.7 .7 .7])

for i = 1:1303
    if world_1800(i).Lon<0 | world_1800(i).Lon>60
        plotm(world_1800(i).Lat, world_1800(i).Lon, 'k^','MarkerSize',4);
    end
end

linem([22 72],[162 162],'k','LineWidth',2)
linem([22 22],[162 294],'k','LineWidth',2)
linem([72 72],[162 294],'k','LineWidth',2)
linem([22 72],[294 294],'k','LineWidth',2)

get(gca,'TightInset');


axes('Visible','off')