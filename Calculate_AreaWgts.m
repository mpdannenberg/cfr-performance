% Calculate area weights for each grid cell
% Written by M. Dannenberg, 6 May 2013

x=length(AS_GPH.lon);
y=length(AS_GPH.lat);

lon=AS_GPH.lon;
lat=AS_GPH.lat;

AreaWgts=NaN(y,x);

ellips=referenceSphere('earth','km');

for i=1:y
    for j=1:x
        AreaWgts(i,j)=areaquad(lat(i)-1,lon(j)-1,lat(i)+1,lon(j)+1,ellips);
    end
end

TotalArea = areaquad(min(lat)-1,min(lon)-1,max(lat)+1,max(lon)+1,ellips);

AreaWgts=AreaWgts/TotalArea;

clear i j lon lat x y TotalArea