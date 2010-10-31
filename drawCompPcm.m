% Draw a preimage of a cpcm mapping
function h = drawCompPcm(cpcm)
N = length(cpcm);
h = figure;
figure(h);clf;hold on;axis equal;

s1 = exp(1i*linspace(0,2*pi,100));
col = 'rgbcmk';

for ib = 1:N
    pcm = cpcm{ib};
    for ip = 1:length(pcm.P)
        cv = pcm.P(ip)+ pcm.R(ip)*s1;
        fill(real(cv),imag(cv),col( mod(ip,6) ));
    end
end

end