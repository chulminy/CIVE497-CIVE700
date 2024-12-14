function param_best = cm_ransac_line(x_data, y_data, dist_thr, max_n_trials)

nData = numel(x_data);
param_best = zeros(2,1);
num_inliner_best = 0;
for ii=1:max_n_trials
    pt_idx = randperm(nData,2);
    x_sub = x_data(pt_idx);
    y_sub = y_data(pt_idx);
    
    % https://en.wikipedia.org/wiki/Line_(geometry)
    mh = diff(y_sub)/diff(x_sub);
    bh = det([y_sub x_sub])/diff(x_sub);
    
    dist_pt = abs(mh*x_data+bh-y_data);
    
    num_inlier = sum(dist_pt<dist_thr);
    if num_inlier>num_inliner_best
        param_best(1) = mh;
        param_best(2) = bh;
        num_inliner_best = num_inlier;
    end
end