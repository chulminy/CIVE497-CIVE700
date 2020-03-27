% 3(a) ellipse: ax^2 + cy^2 + dx + ey + f = 0;
% original equation: 1.3x^2 + 3.5y^2 + 3x + 10y + 3 = 0;

clear; close all; clc;

load prob3_ellipse

n_data = numel(x); % # of data
n_iter = 3000; % # of ransac iteration
dist_thr = 0.01; % distance threshold

best_param = [];
best_inlier = 0;
for ii=1: n_iter
    
    idx = randperm(n_data,4);
    
    xs = x(idx); % selected x
    ys = y(idx); % selected y
    
    mat_test = zeros(4,5);
    for jj=1:4
       mat_test(jj,:) = [xs(jj)^2 ys(jj)^2 xs(jj) ys(jj) 1]; 
    end
    
    [~,~,V] = svd(mat_test);
    param  = V(:,end);
    
    dist_all = zeros(1, n_data);
    for kk=1:n_data
        est_y_test = CompY(param, x(kk));
        dist_all(kk) = min(abs(est_y_test - y(kk)));
    end
    
    inlier_test = sum(abs(dist_all) < dist_thr);
    
    if best_inlier < inlier_test
       best_inlier = inlier_test;
       best_param = param; 
    end
end

best_inlier
3./best_param(end)*best_param

function est_y = CompY(param, x)
a = param(1);
c = param(2);
d = param(3);
e = param(4);
f = param(5);

val_sqrt = sqrt(-a/c*x*x - d/c*x -f/c + e^2/4/c/c);
if ~isreal(val_sqrt)
    val_sqrt = 10000; % assign large number
end   
est_y = [val_sqrt -val_sqrt]-e/2/c;
end