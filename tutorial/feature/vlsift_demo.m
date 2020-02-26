
% http://www.vlfeat.org/install-matlab.html

% One-time setup Download and unpack the latest VLFeat binary distribution
% in a directory of your choice (e.g. ~/src/vlfeat). Let VLFEATROOT denote
% this directory. VLFeat must be added to MATLAB search path by running the
% vl_setup command found in the VLFEATROOT/toolbox directory. From MATLAB
% prompt enter
% 
% >> run('VLFEATROOT/toolbox/vl_setup') VLFeat 0.9.17 ready. To check that
% VLFeat is sucessfully installed, try to run the vl_version command:
% 
% >> vl_version verbose VLFeat version 0.9.17
%     Static config: X64, little_endian, GNU C 40201 LP64, POSIX_threads,
%     SSE2, OpenMP 4 CPU(s): GenuineIntel MMX SSE SSE2 SSE3 SSE41 SSE42
%     OpenMP: max threads: 4 (library: 4) Debug: yes SIMD enabled: yes

% run('vlfeat/toolbox/vl_setup');
% vl_version verbose;

% http://www.vlfeat.org/matlab/vl_sift.html
% http://www.vlfeat.org/overview/sift.html

%% SIFT
clear;close all; clc;

imgRGB = imread('IMG_0067_resize.JPG');

figure(1);imshow(imgRGB);

img = single(rgb2gray(imgRGB));

figure(2);imshow(uint8(img));

[f,d] = vl_sift(img);

% A frame is a disk of center f(1:2), scale f(3) and orientation f(4) .
size(f)
size(d)

figure(3);imshow(uint8(img));
perm = randperm(size(f,2)) ;
sel = perm(1:50) ;
h2 = vl_plotframe(f(:,sel)) ;
set(h2,'color','y','linewidth',2) ;

h3 = vl_plotsiftdescriptor(d(:,sel),f(:,sel)) ;
set(h3,'color','g') ;

figure(4);imshow(uint8(img));
h2 = vl_plotframe(f) ;
set(h2,'color','y','linewidth',2) ;

figure(5);imshow(uint8(img));
[f,d] = vl_sift(img, 'PeakThresh', 3);
h2 = vl_plotframe(f) ;
set(h2,'color','y','linewidth',2) ;

%% SIFT matching
clear; close all; clc

Ia = single(rgb2gray(imread('IMG_0080 (Large).JPG')));
Ib = single(rgb2gray(imread('IMG_0084 (Large).JPG')));

figure(6);
subplot(121); imshow(uint8(Ia));
subplot(122); imshow(uint8(Ib));

[fa, da] = vl_sift(Ia) ;
[fb, db] = vl_sift(Ib) ;

[matches, scores] = vl_ubcmatch(da, db) ;

figure(8) ; clf ;
imagesc(cat(2, Ia, Ib)) ;

xa = fa(1,matches(1,:)) ;
xb = fb(1,matches(2,:)) + size(Ia,2) ;
ya = fa(2,matches(1,:)) ;
yb = fb(2,matches(2,:)) ;

h = line([xa ; xb], [ya ; yb]) ;
set(h,'linewidth', 1, 'color', 'b') ;

vl_plotframe(fa(:,matches(1,:))) ;
fb(1,:) = fb(1,:) + size(Ia,2) ;
vl_plotframe(fb(:,matches(2,:))) ;
axis image off ;

[fa, da] = vl_sift(Ia) ;
[fb, db] = vl_sift(Ib) ;

[matches, scores] = vl_ubcmatch(da, db) ;

figure(9); ax = axes;
showMatchedFeatures(Ia, Ib, fa(1:2,matches(1,:))',fb(1:2,matches(2,:))','montage','Parent',ax)


[~,id] = sort(scores,'ascend');
figure(10); ax = axes;
showMatchedFeatures(Ia, Ib, fa(1:2,matches(1,id(1:20)))',fb(1:2,matches(2,id(1:20)))','montage','Parent',ax)


[fa, da] = vl_sift(Ia) ;
[fb, db] = vl_sift(Ib) ;

[matches, scores] = vl_ubcmatch(da, db) ;

figure(11) ; clf ;
imagesc(cat(2, Ia, Ib)) ;

xa = fa(1,matches(1,id(1))) ;
xb = fb(1,matches(2,id(1))) + size(Ia,2) ;
ya = fa(2,matches(1,id(1))) ;
yb = fb(2,matches(2,id(1))) ;

h = line([xa ; xb], [ya ; yb]) ;
set(h,'linewidth', 1, 'color', 'b') ;

vl_plotframe(fa(:,matches(1,id(1)))) ;
fb(1,:) = fb(1,:) + size(Ia,2) ;
vl_plotframe(fb(:,matches(2,id(1)))) ;
axis image off ;

