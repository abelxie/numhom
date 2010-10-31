% pcm is a piecewise cell mapping
% x: a complex number
% jacob: the jacob at point x
function jacob = pcmJ(pcm,x)
fjacob = @(x) polyval([6,-6,0],x);
ind = find( abs(x-pcm.P) < pcm.R , 1);
jacob = eye(2);
if isempty(ind) % not in any cell, hence mapping is id
    return
end
dist = abs(x-pcm.P(ind));
if  abs(dist-0)<1e5*eps
    return
end
rr   = pcm.R(ind);
vec  = pcm.Q(ind) - pcm.P(ind);
vec  = [real(vec);imag(vec)];
xp   = x-pcm.P(ind);
xp   = [real(xp),imag(xp)];

jacob  = jacob + fjacob(dist/rr) / (rr*dist) * (vec * xp);

end