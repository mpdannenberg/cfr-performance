function [OUTPUT] = decadal_CCA(INPUT,dcca)
% This function will perform the decadal method on the CCA code.
% Written by M. Dannenberg, 6 May 2013

tic

    climate=INPUT.zscore;
    tree=INPUT.TR999.TR_sub;
    
    % Change the 3D climate array into 2D
    climate_vector = reshape(climate, length(climate(:,1)), []);
    
    % Find full length of cal/val interval
    [nt,ns] = size(climate_vector);
       
    %% Set dp, dt, and dcca parameters.  See Smerdon et al (2010) or truncation tests for values of these parameters
    dp=INPUT.pars.dp;
    dt=INPUT.pars.dt;
    %dcca=INPUT.pars.dcca;
    
    %% Create matrix for reconstructed values
    est_climate=NaN(nt,ns);
    
    % Calibrate the data on each decade separately
    for i = 1:10:nt
        if i==1 % Decade 1: Calibrate on years 16-99/100
            proxc=tree(16:nt,:);
            instc=climate_vector(16:nt,:);
        elseif i==91 % Decade 10: Calibrate on years 1-85
            proxc=tree(1:85,:);
            instc=climate_vector(1:85,:);
        else % Decades 2-9: Leave out decade +/- 5 years on either side, calibrate on others
            proxc=tree([1:i-6 i+15:nt],:);
            instc=climate_vector([1:i-6 i+15:nt],:);
        end
        
        [~,D,Tm,Pm,Ts,Ps]=predccabp(proxc',instc',dp,dt,dcca);
        
        drecon = (tree-ones(nt,1)*Pm')*diag(1.0./Ps)*D'*diag(Ts);
        recon = drecon + ones(nt,1)*Tm';
        
        if i==91&nt==99
            est_climate(i:i+8,:) = recon(i:i+8,:);
        else
            est_climate(i:i+9,:) = recon(i:i+9,:);
        end
        
%         str = sprintf('Complete: iteration %d of 10', (i-1)/10+1);
%         disp(str);
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
