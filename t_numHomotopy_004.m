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
lasso0 = linspace(complex(real(sec0(2)),0),sec0(4),100);
%plot(lasso0,'k.');
imglasso0 = arrayfun(curry1(@cpcmV,H0),lasso0);
plot(real(imglasso0),imag(imglasso0),'m-');
for zz = 1:4
    plot(real(sec0(zz)),imag(sec0(zz)),'k.');
end