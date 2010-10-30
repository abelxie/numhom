path = exp(i*linspace(0,2*pi-1,5));
xx = real(path);
yy = imag(path);
%plot(xx,yy);
tt = linspace(0,1,length(xx));
pp = spline(tt,[xx;yy]);
t0 = linspace(0,1,100);
zz = ppval(pp,t0);
ppc = spline(tt,xx+1i*yy);
zzc = ppval(ppc,t0);
plot(zz(1,:),zz(2,:),'.');
hold on
plot(zzc,'r');