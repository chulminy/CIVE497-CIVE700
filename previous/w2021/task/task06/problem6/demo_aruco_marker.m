% Marker Identification
% Author: Chul Min Yeum (cmyeum@uwaterloo.ca)
% Last update:: 01/17/21
clear; close all; clc; format shortG; warning off;

%% Parameter
load aruco_marker % aruco_marker 
folder = 'img';
file_img = 'img (7).jpg';

%% Processing
img = imread(fullfile(folder, file_img));
img = rgb2gray(img);

h = figure(1);
set(h,'WindowStyle','docked') 
imshow(img);

p = drawpolygon('LineWidth',5,'Color','red');
corner = p.Position;

marker_num = find_aruco_num(img, corner, aruco_marker);
fprintf('Aruco Marker Number: %d \n', marker_num);

