function [OUTPUT] = decadal_regem_ridge(INPUT)
% Perform decadal calibration/validation method using RegEM-ridge code.
% Written by M. Dannenberg, 16 Apr 2013

tic
    
    climate=INPUT.zscore;
    tree=INPUT.TR999.TR_sub;
    
    % Change the 3D climate array into 2D
    climate_vector = reshape(climate, size(climate,1), []);
    
    [nt,~]=size(climate_vector);
  
    % Calibrate the data on each decade separately
    for i = 1:10:nt
        climate_cal = climate_vector;
        
        if i==1 % 1st decade -- remove following 5 years as well
            climate_cal(i:i+14,:) = NaN;
        elseif i==91 & nt==99 % 10th decade for OM: remove 9 years + preceding 5
            climate_cal(i-5:i+8,:) = NaN;
        elseif i==91 & nt~=99 % 10th decade for AS: remove 10 years + preceding 5
            climate_cal(i-5:i+9,:) = NaN;
        else % Decades 2-9 -- remove 10 years of data + 5 preceding and following years
            climate_cal(i-5:i+14,:) = NaN;
        end
        
        X=[climate_cal tree];
        
        [ridge_out,~,~,~] = regem(X);
        
        if i==91 & nt==99 % For 10th decade of OM -- collect only last 9 years of reconstructed values
            est_climate(i:i+8,:) = ridge_out(i:i+8,1:size(climate,2)*size(climate,3)); 
        else % For all other decades -- collect 10 years of reconstructed values
            est_climate(i:i+9,:) = ridge_out(i:i+9,1:size(climate,2)*size(climate,3)); 
        end
    end
    
    % Correlation Loop
    R_mat=NaN(1,size(climate,2)*size(climate,3));
    p_mat=NaN(1,size(climate,2)*size(climate,3));
    for i = 1:length(climate_vector(1,:))
        [R,p] = corrcoef(climate_vector(:,i),est_climate(:,i),'rows','pairwise');
        R_mat(i) = (R(1,2));
        p_mat(i) = (p(1,2));
    end

    OUTPUT.r = reshape(R_mat, size(climate,2), size(climate,3));
    OUTPUT.p = reshape(p_mat, size(climate,2), size(climate,3));
    OUTPUT.estimate = reshape(est_climate,[],size(climate,2),size(climate,3));
    
    % Calculate bias
    bias=NaN(1,size(climate,2)*size(climate,3));
    for i=1:size(climate,2)*size(climate,3)
        bias(i)=mean(est_climate(:,i)-climate_vector(:,i));
    end

    OUTPUT.bias=reshape(bias,size(climate,2),size(climate,3));
    
    % Calculate CE
    
    CE=NaN(1,size(climate,2)*size(climate,3));
    for i=1:size(climate,2)*size(climate,3)
        CE(i)=1-(sum((climate_vector(:,i)-est_climate(:,i)).^2)/...
            sum((climate_vector(:,i)-mean(climate_vector(:,i))).^2));
    end
    
    OUTPUT.CE=reshape(CE,size(climate,2),size(climate,3));
    
    % Calculate RMSE
    
    RMSE=NaN(1,size(climate,2)*size(climate,3));
    for i=1:size(climate,2)*size(climate,3)
        RMSE(i)=sqrt(mean((climate_vector(:,i)-est_climate(:,i)).^2));
    end
    
    OUTPUT.RMSE = reshape(RMSE,size(climate,2),size(climate,3));
    
    %Calculate Std Ratio
    OUTPUT.SDR=squeeze(std(reshape(est_climate,[],size(climate,2),size(climate,3)),1)./std(INPUT.zscore,1));
    
    toc
    
end
