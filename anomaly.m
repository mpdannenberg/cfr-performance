% calculate anomalies and save mean and std for later back-transformation
% Uses reshaped (2-D) matrix (year x lat*lon)

function [OUTPUT]=anomaly(input)

input_resh=reshape(input, length(input(:,1)), []);

% Subset to 1871-1970 (calibration/validation period)
%input_sub=input_resh(1:100,:); 

% Calculate 1871-1970 mean for each grid cell
input_mean=nanmean(input_resh); % 1 x lat*lon vector, i.e. one mean per grid cell

% Calculate 1871-1970 std for each grid cell
input_std=nanstd(input_resh); % 1 x lat*lon vecto, i.e. one std per grid cell

% Calculate z-score
for i=1:length(input_resh(1,:)) % per grid cell
    for j=1:length(input_resh(:,1)) % per year
        anomaly(j,i)=(input_resh(j,i)-input_mean(i))/input_std(i);
    end
end

anomaly=reshape(anomaly,[],size(input,2),size(input,3));

% Output z-score, 1871-1970 mean, and 1871-1970 std to structure
OUTPUT.raw = input;
OUTPUT.zscore = anomaly;
OUTPUT.mean = reshape(input_mean, size(input,2),[]);
OUTPUT.std = reshape(input_std, size(input,2),[]);