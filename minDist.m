% minimial distance of a set of distinct points
function d = minDist(v)
    d = Inf;
    l = length(v);
    for iv =1:l-1
        for jv = iv+1:l
            d0 = abs(v(iv)-v(jv));
            if d0<d
                d=d0;
            end
        end
    end
end