
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
clear;close all; clc;
imgRGB = imread('IMG_0067_resize.JPG');

figure(1);imshow(imgRGB);

img = single(rgb2gray(imgRGB));

figure(2);imshow(uint8(img));

[f,d] = vl_sift(img);

% A frame is a disk of center f(1:2), scale f(3) and orientation f(4) .
size(f)
size(d)

perm = randperm(size(f,2)) ;
sel = perm(1:50) ;
h2 = vl_plotframe(f(:,sel)) ;
set(h2,'color','y','linewidth',2) ;

h3 = vl_plotsiftdescriptor(d(:,sel),f(:,sel)) ;
set(h3,'color','g') ;




