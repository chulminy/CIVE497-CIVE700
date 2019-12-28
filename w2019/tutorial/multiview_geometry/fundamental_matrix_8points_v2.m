clear; close all; clc;

P1 = [eye(3,3) zeros(3,1)];
P2 = eye(3,3)*[rotx(10)*roty(20)*rotz(30) [5;5;1]];

nPt = 100;

X = rand(4, nPt);
x1 = P1*X; x1 = bsxfun(@rdivide, x1(1:2,:), x1(3,:));
x2 = P2*X; x2 = bsxfun(@rdivide, x2(1:2,:), x2(3,:));

funRow = @(u,v,up,vp) [u*up v*up up u*vp v*vp vp u v 1];

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
    l = [x2(:,ii);1]'*F;
    dist = abs(l(1)*x1(1,ii) + l(2)*x1(2,ii) + l(3))/norm(l(1:2));
    xFx(ii) = dist;
end
mean(xFx)

C1 = null(P1);
e2 = P2*C1;
e2x = [0 -e2(3) e2(2);e2(3) 0 -e2(1);-e2(2) e2(1) 0];
FNew = e2x * P2 * pinv(P1);

xFx = zeros(100,1);
for ii=1:100
    l = [x2(:,ii);1]'*FNew;
    dist = abs(l(1)*x1(1,ii) + l(2)*x1(2,ii) + l(3))/norm(l(1:2));
    xFx(ii) = dist;
end
mean(xFx)

