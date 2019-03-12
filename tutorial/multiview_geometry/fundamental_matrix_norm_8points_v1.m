P1 = [diag([3000,3000,1]) zeros(3,1)];
P2 = diag([3000,3000,1])*[rotx(10)*roty(20)*rotz(30) [5;5;1]];

nPt = 100;

X = rand(4, nPt);
x1 = P1*X; x1 = bsxfun(@rdivide, x1(1:2,:), x1(3,:));
x2 = P2*X; x2 = bsxfun(@rdivide, x2(1:2,:), x2(3,:));

x1 = x1 + rand(2,nPt);
x2 = x2 + rand(2,nPt);

funRow = @(u,v,up,vp) [u*up v*up up u*vp v*vp vp u v 1];

% 8 point algorithm
A = zeros(8,9);
id = randperm(nPt,8); 
for ii=1:8
   A(ii,:) = funRow(x1(1,id(ii)), x1(2,id(ii)), x2(1,id(ii)), x2(2,id(ii))); 
end

[~, ~, V] = svd(A);
F = reshape(V(:,9), 3, 3)';
[U, D, V] = svd(F);
F = U*diag([D(1,1) D(2,2) 0])*V';

% test transpose(x')*F*x = 0 
xFx = zeros(100,1);
for ii=1:100
    xFx(ii) = [x2(:,ii);1]'*F*[x1(:,ii);1];
end

% normalize 8 point algorithm
T1 = [2/max(x1(1,:)) 0 -1; 0 2/max(x1(2,:)) -1; 0 0 1]; 
T2 = [2/max(x2(1,:)) 0 -1; 0 2/max(x2(2,:)) -1; 0 0 1];

x1T = T1*[x1;ones(1,nPt)]; x1T = bsxfun(@rdivide, x1T(1:2,:), x1T(3,:));
x2T = T2*[x2;ones(1,nPt)]; x2T = bsxfun(@rdivide, x2T(1:2,:), x2T(3,:));

A = zeros(8,9);
for ii=1:8
   A(ii,:) = funRow(x1T(1,id(ii)), x1T(2,id(ii)), x2T(1,id(ii)), x2T(2,id(ii))); 
end
[~, ~, V] = svd(A);
FT = reshape(V(:,9), 3, 3)';
[U, D, V] = svd(FT);
FT = U*diag([D(1,1) D(2,2) 0])*V';

F = T2'*FT*T1;

% test transpose(x')*F*x = 0 
xFx_norm = zeros(100,1);
for ii=1:100
    xFx_norm(ii) = [x2(:,ii);1]'*F*[x1(:,ii);1];
end

mean(xFx)
mean(xFx_norm)
