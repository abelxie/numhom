function rf = curry1(f,x1)
    rf = @(x2) f(x1,x2);
end