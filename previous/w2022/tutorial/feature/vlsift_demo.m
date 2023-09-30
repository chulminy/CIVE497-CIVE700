%% install vl_feat
% run('vlfeat/toolbox/vl_setup');
% vl_version verbose;

%% SIFT
clear;close all; clc;

img1o = imresize(imread('20201226_125213.jpg'), 0.3);
img2o = imresize(imread('20201226_125222.jpg'), 0.3);

img1 = single(rgb2gray(img1o));
img2 = single(rgb2gray(img2o));

figure(1);
subplot(121); imshow(img1o);
subplot(122); imshow(img2o);

[f1,d1] = vl_sift(img1);
[f2,d2] = vl_sift(img2);

figure(2);
imshow(img1o); hold on;
perm = randperm(size(f1,2)) ;
sel = perm(1:50) ;
h1 = vl_plotframe(f1(:,sel)) ; 
h2 = vl_plotframe(f1(:,sel)) ; 
set(h1,'color','k','linewidth',3) ; 
set(h2,'color','y','linewidth',2) ; hold off;

figure(3);
imshow(img1o); hold on;
h3 = vl_plotsiftdescriptor(d1(:,sel),f1(:,sel));
set(h3,'color','g') ; hold off;

[matches, scores] = vl_ubcmatch(d1, d2) ;

[~, perm] = sort(scores, 'descend') ;
matches = matches(:, perm(1:30)) ;
scores  = scores(perm(1:30)) ;

figure(4) ; clf ;
imagesc(cat(2, img1o, img2o)) ;
axis image off ;

x1 = f1(1,matches(1,:)) ;
x2 = f2(1,matches(2,:)) + size(img1,2) ;
y1 = f1(2,matches(1,:)) ;
y2 = f2(2,matches(2,:)) ;

hold on ;
h = line([x1 ; x2], [y1 ; y2]) ;
set(h,'linewidth', 1, 'color', 'b') ;

return;