function v = paracvVal(mypp,X)
    v = arrayfun(SEL(curry1(@paracvOne,mypp),2,1),X);
end