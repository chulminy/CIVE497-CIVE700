% Measurement on a Planar Surface
% Author: Chul Min Yeum (cmyeum@uwaterloo.ca)
% Last update:: 05/13/22
format shortG

%% Please setup this parameter before executing this file
mark_size = 100; % mm
imgFile = '20220513_091827.jpg';

%% Please do modify the code below unless it is not needed. 
%% Step1: Pick four corners of your calibrate image
img = imread(imgFile);
figure(1); imshow(img);
p = drawpolygon('LineWidth',5,'Color','blue');

%% Step2: Compute H
movingPoints = p.Position;
fixedPoints = bbox2points([0 0 mark_size mark_size]);
tform = fitgeotrans(movingPoints, fixedPoints,'projective');
H = tform.T';

%% Step3: Select the line that you want to measure
close;
figure(2); imshow(img);
pline = drawpolyline('LineWidth',5,'Color','red');

%% Step4: Measure a distance
ptLine = pline.Position;
ptWHom = H*[ptLine ones(2,1)]';
ptW = bsxfun(@rdivide, ptWHom, ptWHom(3,:));
dist = sqrt((ptW(1, 2)- ptW(1, 1))^2 + (ptW(2, 2)- ptW(2, 1))^2 );
fprintf('\n');
fprintf('Distance is %3.1f mm \n', dist);
fprintf('Distance is %3.1f inch \n', dist*0.0393701);