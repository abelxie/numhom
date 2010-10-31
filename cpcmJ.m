% cpcmJ: composition of the jacobian matrix
function jacob = cpcmJ(cpcm,x)
    N = length(cpcm);
    jacob = eye(2);
    v = x;
    for ic = 1:N        
        jacob = pcmJ(cpcm{ic},v)*jacob;
        v = pcmV(cpcm{ic},v);%chain rule
    end
end