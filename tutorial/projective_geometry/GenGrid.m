function [pos, adj, col_dot] = GenGrid(n)

[X, Y] = meshgrid(1:n,1:n);
pos = [X(:)-1 Y(:)-1];
dist_grid = pdist2(pos, pos); 
adj = le(dist_grid,1.1); % Use of 1.1 is for avoding numerical error. 
col_dot = rand(n*n,3);

