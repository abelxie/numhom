% Jacob
function vv = paracvJ(mypp,X)
    s = paracvT(mypp);
    v = arrayfun(@(t) mypp{3}{s(t)}(t),X);
    vv = [real(v);imag(v)];
end