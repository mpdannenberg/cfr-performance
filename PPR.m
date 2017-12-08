function [PPR_out] = PPR(climate_cal, tree_cal, tree_val)
% This function is for the Point-by-Point Regression method of climate
% field reconstruction.
% The inputs into the function are the climate data and tree ring data.
% NOTE:  The climate time series MUST have the same years as the tree ring
% time series.  Do NOT include any headers or a column of years.
% The climate input should be a 3D array  that is (time x lat x long)
% The tree input is a 2D (time x site) tree-ring chronology that is
% pre-factored (PCA/EOF)
    
    % Regression Loop
    parfor i = 1:length(climate_cal(1,:))
        [CR_coef,~,~,~,stats,~,~] =stepwisefit(tree_cal,climate_cal(:,i),'display','off');
        PPR_out(:,i) = tree_val*CR_coef+stats.intercept;
    end
 
    


end