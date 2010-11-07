% Problem: assume f(x) has some spike in a very small interval while its
% variance is small over all other field.
% To accurate approximate f(x) using f(x+dx)=f(x)+f'(x)dx, we should choose
% small enough dx such that f'(x) give sufficient accurate approximation of
% f(\xi) in [x,x+dx].
% jacob : the |f'| ;
% ds    : the threshold |f'|dx < ds, so ds is restriction on f, rather
% than f'. Some we will have to estimate Hessian for f.
% We assume f,f' are defined and continuous on [0,1].
function [samples,Kframe] = mkDiscreteF(jacob,ds)
% the resolution on jacob and Hessian
jacobRes = 5;
resampleRes = 50;

% initial conditions
samples = 0;
Kframe = 1;
x = 0;
meanJacob = jacob(0);

    function x1 = nextCurveStep(x0,res)
        % Next x only using average estimation by divide the predicted next
        % dx into res-1 sub-intervals
        x1 = x0 + ds/jacob(x0);
        if x1 > 1
            x1 = 1;
        end
        localJ = jacob(linspace(x0,x1,res+1));
        Df = (sum(localJ) - 1/2*(localJ(1)+localJ(end))) / res;
        x1 = x1 + ds/Df;
        if x1>1
            x1 = 1;
        end
    end
    
    function samp = resample(x0,x1,res)
        DX = (x1-x0)/(res+1);
        
        localX = linspace(x0+DX,x1-DX,res-1);
        localJ = jacob(localX);
        %hessian = abs(diff([localJ,jacob(x1)]));
        
        %averageH = (max(localJ) - min(localJ))/(res+1);
        psi = localJ - meanJacob;
        psi = (psi - mean(psi))/std(psi);
        % assume psi ~ N(0,1)
        % hence 0.06 false positive
        samp =localX( psi > 1.6 ); %| ...
            %abs(hessian - averageH)/averageH > 2 );
        
    end
%Main Iteration
while x<1
    nextX = nextCurveStep(x,jacobRes);
    sampX = resample(x,nextX,resampleRes);
    meanJacob = (meanJacob * x + (jacob(x)+jacob(nextX))/2 * (nextX-x) )/nextX;
    samples = [samples,sampX,nextX];
    Kframe = [Kframe,length(samples)];
    x = nextX;
end

samples(end)=1;

end