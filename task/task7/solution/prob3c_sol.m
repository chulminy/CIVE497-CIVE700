% 3(c) 3D plane: ax + by + cz + d = 0;
% original equation: x + 3y + 2z + 4 = 0;

load prob3_plane

% Let's flatten the data
x = x(:);
y = y(:);
z = z(:);

n_data = numel(x);

all_idx = randperm(n_data,10000);
x = x(all_idx);
y = y(all_idx);
z = z(all_idx);
n_data = numel(x);

n_iter = 1000;
dist_thr = 0.01;

best_param = [];
best_inlier = 0;
for ii=1: n_iter
    
    idx = randperm(n_data,3);
    
    xs = x(idx); % selected x
    ys = y(idx); % selected y
    zs = z(idx); % selected y
    
    mat_test = zeros(3,4);
    for jj=1:3
       mat_test(jj,:) = [xs(jj) ys(jj) zs(jj) 1]; 
    end
    
    [~,~,V] = svd(mat_test);
    param  = V(:,end);
    
    dist_all = zeros(1, n_data);
    for kk=1:n_data
        dist_all(kk) = CompY(param, x(kk), y(kk), z(kk));
    end
    
    inlier_test = sum(dist_all < dist_thr);
    
    if best_inlier < inlier_test
       best_inlier = inlier_test;
       best_param = param; 
    end
end

best_inlier
1./best_param(1)*best_param

function dist_est = CompY(param, x, y, z)
a = param(1);
b = param(2);
c = param(3);
d = param(4);

dist_est = abs(a*x+b*y+c*z+d)/sqrt(a^2 + b^2 + c^2);
end

