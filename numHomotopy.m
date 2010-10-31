% generate the numeric Homotopy from the curve monodromy
% path: 'prarcv' obj
% f   : f(x) are the coefficients of y's in the polynomial of F(x,y) = 0
% fj  : y_i'(x) for each branch y_i
function br = numHomotopy(path,f,fj)
xt = curry1(@paracvV,path);
xjacobs = curry1(@paracvJ,path);

    function branchDataSet = simulate(t0,t1)
        % generate raw datas
        branchDataSet = struct('yis',[],'yjacobs',[],'x',[],'t',[],...
            'features',0,'trainingSet',0);
        t = t0;
        while t<t1
            x   = xt(t) ;
            yis = roots(f(x)).';
            yjacobs = arrayfun(curry1(fj,x),yis);
            
            M = max(norm(yjacobs)) ;
            dx = minDist(yis)/(6*M) ;
            
            dt = dx/norm(xjacobs(t)) ;
            % because jacobian is possible a vector
            % not always as a complex number, so it's safer to use norm
            branchDataSet.yis = [branchDataSet.yis;yis];
            branchDataSet.yjacobs = [branchDataSet.yjacobs;yjacobs];
            branchDataSet.x = [branchDataSet.x,x];
            branchDataSet.t = [branchDataSet.t,t];
            t = t+dt;
        end
        if t>t1
            x = xt(t1);
            yis = roots(f(x)).';
            yjacobs = arrayfun(curry1(fj,x),yis);
            branchDataSet.yis = [branchDataSet.yis;yis];
            branchDataSet.yjacobs = [branchDataSet.yjacobs;yjacobs];
            branchDataSet.x = [branchDataSet.x,x];
            branchDataSet.t = [branchDataSet.t,t];            
        end
        sz = size(branchDataSet.yis);
        branchDataSet.features = sz(2);
        branchDataSet.trainingSet = sz(1);
    end

    function branches = clustering(branchDataSet)
        % using naive clustering method to group the branch points 
        % belonging to the same branch together;
        % assuming the classes of data(1) is 1:features
        lastyis = branchDataSet.yis(1,:);
        lastyjacobs = branchDataSet.yjacobs(1,:);
        branches = zeros(branchDataSet.trainingSet,branchDataSet.features);
        branches(1,:)=lastyis;
        for ix = 2:branchDataSet.trainingSet
            dx = branchDataSet.x(ix) - branchDataSet.x(ix-1);
            predict = lastyis + lastyjacobs*dx;
            % y(x+dx) approximate by y(x)+y'(x)dx;
            features = minDistMatch(predict,branchDataSet.yis(ix,:));
            lastyis(features) = branchDataSet.yis(ix,:);
            lastyjacobs(features) = branchDataSet.yjacobs(ix,:);
            branches(ix,:)=lastyis;
        end        
    end
    
    ds = simulate(0,1);
    br = clustering(ds);

end