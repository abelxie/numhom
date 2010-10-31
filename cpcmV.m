% compose pcmV
function v = cpcmV(cpcm,x)
    N = length(cpcm);
    v = x;
    for ic = 1:N
        v = pcmV(cpcm{ic},v);
    end
end