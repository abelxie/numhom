% Jacob
function v = paracvJ(mypp,X)
    s = paracvT(mypp);
    v = arrayfun(@(t) mypp{3}{s(t)}(t),X);
end