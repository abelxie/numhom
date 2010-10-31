% value of paracv
function v = paracvV(mypp,X)
    s = paracvT(mypp);
    v = arrayfun(@(t) mypp{2}{s(t)}(t),X);
end