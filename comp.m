function [re,rejacob] = comp(f,g,fjacob,gjacob)
   re = @(x) f(g(x));
   rejacob = @(x) fjacob(g(x))*gjacob(x);
end