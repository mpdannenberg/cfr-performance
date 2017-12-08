%% Requested code for new bootstrap RegEM-Ridge code

% This function will perform the leave-one-out calibration method using 
% RegEM-ridge code.

% At command line, call the function as:
% > NameOfYourOutput = ReqBootstrap(NameOfClimateArray,NameOfTRArray);

function [OUTPUT] = ReqBootstrap(Climate,TRcrn)
tic

[nt,nx,ny]=size(Climate); % Get dimensions of Climate array

Climate_vector = reshape(Climate, nt, []); % Change Climate from 2d to 3d

est_Climate=NaN(nt,nx*ny); % Pre-allocate est_climate array

for i = 1:nt % Calibrate the data on each year separately
    Climate_cal = Climate_vector;
    Climate_cal(i,:) = NaN; % Insert row of NaNs to be reconstructed by RegEM using remaining data as calibration

    FullDataMatrix=[Climate_cal TRcrn]; % Combine Climate and TRcrn into one full data matrix for RegEM

    [ridge_out,~,~,~] = regem(FullDataMatrix); % Call RegEM

    est_Climate(i,:) = ridge_out(i,1:nx*ny); % Extract reconstructed values, add to array of estimated values
end

% Correlation Loop
R_mat=NaN(1,nx*ny);
p_mat=NaN(1,nx*ny);
for i = 1:nx*ny % Loop through each grid cell
    [R,p] = corrcoef(Climate_vector(:,i),est_Climate(:,i),'rows','pairwise');
    R_mat(i) = (R(1,2));
    p_mat(i) = (p(1,2));
end

OUTPUT.r = reshape(R_mat, nx, ny);
OUTPUT.p = reshape(p_mat, nx, ny);
OUTPUT.estimate = reshape(est_Climate,[],nx,ny);

% Calculate bias
bias=NaN(1,nx*ny);
for i=1:nx*ny
    bias(i)=mean(est_Climate(:,i)-Climate_vector(:,i));
end

OUTPUT.bias=reshape(bias,nx,ny);

% Calculate RE

RE=NaN(1,nx*ny);
for i=1:nx*ny
    RE(i)=1-(sum((Climate_vector(:,i)-est_Climate(:,i)).^2)/...
        sum((Climate_vector(:,i)-mean(Climate_vector(:,i))).^2));
end

OUTPUT.RE=reshape(RE,nx,ny);

% Calculate RMSE

RMSE=NaN(1,nx*ny);
for i=1:nx*ny
    RMSE(i)=sqrt(mean((Climate_vector(:,i)-est_Climate(:,i)).^2));
end

OUTPUT.RMSE = reshape(RMSE,nx,ny);

% Calculate Standard Deviation Ratio

std_ratio = squeeze(std(est_Climate,1)./std(Climate_vector,1));
OUTPUT.std_ratio=reshape(std_ratio,nx,ny);

toc

end