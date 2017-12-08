% This function loops through all possible values of d(cca) and determines
% the one with the lowest area-weighted RMSE

% Written by M. Dannenberg, 6 May 2013


function [dcca_par,rmse] = best_dcca(INPUT,AreaWgts)

dcca_max=min(INPUT.pars.dp,INPUT.pars.dt);
rmse=NaN(dcca_max,2);

%Calculate_AreaWgts % Call script that calculates area weights

for i=1:dcca_max
    temp=decadal_CCA(INPUT,i);
    rmse(i,1)=i;
    rmse(i,2)=sum(sum(temp.RMSE.*AreaWgts));
end

dcca_par=rmse(rmse(:,2)==min(rmse(:,2)),1);