% pcm is a piecewise cell mapping
% x: a complex number
% img: the image of x
function img = pcmV(pcm,x)
    f = @(x) polyval([2,-3,0,1],x);
    ind = find( abs(x-pcm.P) < pcm.R , 1);
    img = x;
    if isempty(ind) % not in any cell, hence mapping is id
        return
    end
    dist = abs(x-pcm.P(ind));
    rr   = pcm.R(ind);
    vec  = pcm.Q(ind) - pcm.P(ind);
    img  = x + f(dist/rr) * vec;
end
