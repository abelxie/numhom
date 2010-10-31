%t_numHomotopy_004
%% prepare Data
clear;
P0 = mklassopath(complex(0.5,0),complex(0,0),0.1);
% figure(1);
% clf;hold on;
% axis equal;
% plot(paracvV(P0,linspace(0,1,100)),'.');
brs = numHomotopy(P0,@cuspquartic,@cuspquarticJ);
H0 = mkCompPcms(brs);
%H0 is a cpcm mapping;
sec0 = brs(1,:);

%% Draw Graphs
figure(2);clf;
hold on;
axis equal;

colors = 'rbgk';
for zz = 1:4
    plot(real(sec0(zz)),imag(sec0(zz)),strcat(colors(zz),'o'));
    plot(real(brs(:,zz)),...
        imag(brs(:,zz)),strcat(colors(zz),'.'));
end

%% Draw different lassos
figure(3);clf;
hold on;
axis equal;
lasso0 = spline([0,1],[real(sec0(2)),sec0(4)]);
lassoj = comp0(@complex2vec,curry1(@ppval,diffpp(lasso0)));
imglasso = comp0(curry1(@cpcmV,H0),curry1(@ppval,lasso0));
imglassoj = compJ(curry1(@cpcmJ,H0),imglasso,lassoj);
%curvelength = quad(@(x)arrayfun(comp0(@norm,imglassoj),x),0,1)
cvlengthapp = cvLength( arrayfun(imglasso,linspace(0,1,100)) )
%Note quad need a vectorized version of function
% use arrayfun to make a function vectorized
% use norm to get the value
imgpts = takePoints(imglasso,imglassoj,0.01);
%plot(ppval(lasso0,linspace(0,1,60)),'b-');
% imglasso0 = arrayfun(curry1(@cpcmV,H0),lasso0);
plot(real(imgpts),imag(imgpts),'m-');
for zz = 1:4
    plot(real(sec0(zz)),imag(sec0(zz)),'k.');
end