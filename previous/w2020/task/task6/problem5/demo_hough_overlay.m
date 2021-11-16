% Hough Transformation
% Author: Chul Min Yeum (cmyeum@uwaterloo.ca)
% Last update:: 02/28/19
clear; close all; clc; format shortG;

%% Parameter
file_img1 = '20200227_104101.jpg';
file_img2 = 'IMG_0080.JPG';

%% Processing
img1 = imread(fullfile(file_img1));
img2 = imread(fullfile(file_img2));

figure(1); imshow(img1);
p = drawpolygon('LineWidth',5,'Color','black');
corner1 = p.Position;

img2_new = fun_prob5(img1, img2, corner1); % you need to write your own code!
imshow(img2_new);
