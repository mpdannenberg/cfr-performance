% Main file for testing three Climate Field Reconstruction (CFR) methods
% with three climate fields from NOAA 20th Century Reanalysis (20CR) and
% tree-ring records from North America and Eurasia (from the International
% Tree Ring Databank).  For further details and discussion of methods and 
% limitations, see Dannenberg & Wise (2013), Performance of climate field 
% reconstruction methods over multiple seasons and climate variables,
% Journal of Geophysical Research: Atmospheres (In Review).

%% Load and transform climate variables
% Load 1871-1970 20CR data: geopotential height (GPH), precipitable water 
% (PPT), and surface temperature (TEMP) over April-September (AS) and 
% October-March (OM)

load('ASgph500.mat');
load('ASpptwater.mat');
load('ASs995temp.mat');
load('OMgph500.mat');
load('OMpptwater.mat');
load('OMs995temp.mat');

% Reduce array to years 1871 (1872 for OM) through 1970, 22N-72N latitude,
% and 162E-66W longitude

ASgph500 = ASgph500(1:100,10:35,82:148);
ASpptwater = ASpptwater(1:100,10:35,82:148);
ASs995temp = ASs995temp(1:100,10:35,82:148);
OMgph500 = OMgph500(2:100,10:35,82:148);
OMpptwater = OMpptwater(2:100,10:35,82:148);
OMs995temp = OMs995temp(2:100,10:35,82:148);

% Calculate z-scores for all climate-season pairs

AS_GPH = anomaly(ASgph500);
AS_PPT = anomaly(ASpptwater);
AS_TEMP = anomaly(ASs995temp);
OM_GPH = anomaly(OMgph500);
OM_PPT = anomaly(OMpptwater);
OM_TEMP = anomaly(OMs995temp);

clear ASgph500 ASpptwater ASs995temp OMgph500 OMpptwater OMs995temp;

AS_GPH.year=year(1:100); AS_GPH.lat=lat(10:35); AS_GPH.lon=lon(82:148);
AS_PPT.year=year(1:100); AS_PPT.lat=lat(10:35); AS_PPT.lon=lon(82:148);
AS_TEMP.year=year(1:100); AS_TEMP.lat=lat(10:35); AS_TEMP.lon=lon(82:148);
OM_GPH.year=year(2:100); OM_GPH.lat=lat(10:35); OM_GPH.lon=lon(82:148);
OM_PPT.year=year(2:100); OM_PPT.lat=lat(10:35); OM_PPT.lon=lon(82:148);
OM_TEMP.year=year(2:100); OM_TEMP.lat=lat(10:35); OM_TEMP.lon=lon(82:148);

clear year lat lon;

%% Pre-screen proxy series
% Pre-screen tree-ring chronologies for correlation (at 99.9% significance 
% level) with AT LEAST ONE grid cell in the climate field; only
% includes those chronologies between 60E-60W longitude and 7.5N-72N 
% latitude.
%
% WARNING: Each prescreen procedure requires ~10 minutes to run (60 minutes
% total).

load('world_1800.mat'); % Structure of 1303 N. American/Eurasian tree-ring chronologies

AS_GPH.TR999 = prescreen(world_1800, AS_GPH);
AS_PPT.TR999 = prescreen(world_1800, AS_PPT);
AS_TEMP.TR999 = prescreen(world_1800, AS_TEMP);
OM_GPH.TR999 = prescreen(world_1800, OM_GPH);
OM_PPT.TR999 = prescreen(world_1800, OM_PPT);
OM_TEMP.TR999 = prescreen(world_1800, OM_TEMP);

clear world_1800;

%% Calculate model parameters
% Provide dp and dt parameters for CCA and PPR. These were calculated 
% separately in R (for example, see "TREig.R" for calculation of dp) using 
% the Mann et al. (2007) method.  PCA is performed on both the proxy data
% and the 20CR data.  A noise continuum is estimated  by fitting a linear 
% model to the log of the non-zero eigenvalues, and dp and dt are set to 
% retain the first n PCs whose log(eigenvalue) lies above this estimated 
% noise continuum

AS_GPH.pars.dp = 7; AS_GPH.pars.dt = 18;
AS_PPT.pars.dp = 7; AS_PPT.pars.dt = 12;
AS_TEMP.pars.dp = 8; AS_TEMP.pars.dt = 14;
OM_GPH.pars.dp = 7; OM_GPH.pars.dt = 16;
OM_PPT.pars.dp = 7; OM_PPT.pars.dt = 12;
OM_TEMP.pars.dp = 7; OM_TEMP.pars.dt = 12;

% Calculate dcca as the value between 1 and min{dp, dt} that minimizes the
% area-weighted RMSE

Calculate_AreaWgts
clear ellips;

AS_GPH.pars.dcca = best_dcca(AS_GPH,AreaWgts);
AS_PPT.pars.dcca = best_dcca(AS_PPT,AreaWgts);
AS_TEMP.pars.dcca = best_dcca(AS_TEMP,AreaWgts);
OM_GPH.pars.dcca = best_dcca(OM_GPH,AreaWgts);
OM_PPT.pars.dcca = best_dcca(OM_PPT,AreaWgts);
OM_TEMP.pars.dcca = best_dcca(OM_TEMP,AreaWgts);
clear AreaWgts;

%% Test CFR methods CCA, RegEM, and PPR
% All methods are tested using a "leave-one-decade-out" cross-validation
% procedure, where each of ten decades (as well as the five years preceding
% and following each decade) are successively withheld from the calibration
% of the model.  This calibrated model is then use to reconstruct the
% withheld decade, and all individually reconstructed decades are then
% recombined and compared to the initial 20CR data using several metrics 
% calculated for each grid cell: Pearson correlation coefficient (R),
% coefficient of effiency (CE), root mean squared error (RMSE), mean bias,
% and standard deviation ratio (SDR).

% Canonical Correlation Analysis
% Time: ~1 min
AS_GPH.CCA = decadal_CCA(AS_GPH, AS_GPH.pars.dcca);
AS_PPT.CCA = decadal_CCA(AS_PPT, AS_PPT.pars.dcca);
AS_TEMP.CCA = decadal_CCA(AS_TEMP, AS_TEMP.pars.dcca);
OM_GPH.CCA = decadal_CCA(OM_GPH, OM_GPH.pars.dcca);
OM_PPT.CCA = decadal_CCA(OM_PPT, OM_PPT.pars.dcca);
OM_TEMP.CCA = decadal_CCA(OM_TEMP, OM_TEMP.pars.dcca);

% Regularized Expectation Maximization (regularized with ridge regression)
% Time: ~60 min
AS_GPH.RegEM = decadal_regem_ridge(AS_GPH);
AS_PPT.RegEM = decadal_regem_ridge(AS_PPT);
AS_TEMP.RegEM = decadal_regem_ridge(AS_TEMP);
OM_GPH.RegEM = decadal_regem_ridge(OM_GPH);
OM_PPT.RegEM = decadal_regem_ridge(OM_PPT);
OM_TEMP.RegEM = decadal_regem_ridge(OM_TEMP);

% Point-by-Point Regression
% Time: ~5 min
AS_GPH.PPR = decadal_PPR(AS_GPH);
AS_PPT.PPR = decadal_PPR(AS_PPT);
AS_TEMP.PPR = decadal_PPR(AS_TEMP);
OM_GPH.PPR = decadal_PPR(OM_GPH);
OM_PPT.PPR = decadal_PPR(OM_PPT);
OM_TEMP.PPR = decadal_PPR(OM_TEMP);

%% Generate figures (slow!)

% Map variables
states = shaperead('usastatehi','UseGeoCoords', true);
worldland= shaperead('landareas', 'UseGeoCoords', true);
latlim=[21 72];
lonlim=[161 294];

load('world_1800.mat')
figure(1)
create_chronology_map
clear world_1800;

figure(2)
r_map

figure(3)
ce_map

figure(4)
rmse_map

figure(5)
bias_map

figure(6)
sdr_map

% figures 7-11
allBoxplots

