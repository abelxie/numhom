function v = paracvJ(mypp,X)
    v = arrayfun(SEL(curry1(@paracvOne,mypp),2,2),X);
end