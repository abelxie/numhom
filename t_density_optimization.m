% test density
clear;
p = complex(0,1);
q = complex(1,0);
r = 0.1;
mypp = mklassopath(p,q,r);
tt = linspace(0,1,100);
pdf =@(x) abs([1 1i]*paracvJ(mypp,x));
figure(1);
yy = pdf(tt);
plot(tt,yy,'.');
figure(2);
samples = mkDiscreteF(pdf,0.05);
plot(samples,pdf(samples),'.');

%[u,v,w]=fminsearch(pdf,0,optimset('MaxFunEvals',2))

% after trying the optimtool,
% the conclusion is: fminubd, fminsearch, fmincon
% is not so powerful to support me to find the detailed
% spike part of the abs(jacobian);
% I should have to discover my own method to find a bump
% of the function.