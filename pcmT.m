function fun = pcmT(pcm)
ind = @(x) find( abs(x-pcm.P) < pcm.R , 1);
img = x;
jacob  = eye(2);
if isempty(ind) % not in any cell, hence mapping is id
    return
end

dist = abs(x-pcm.P(ind));
rr   = pcm.R(ind);
vec  = pcm.Q(ind) - pcm.P(ind);
img  = x + f(dist/rr) * vec;

vec  = [real(vec);imag(vec)];
xp   = x-pcm.P(ind);
xp   = [real(xp),imag(xp)];
if   dist ~= 0
    jacob  = jacob + fjacob(dist/rr) / (rr*dist) * (vec * xp);
end
end