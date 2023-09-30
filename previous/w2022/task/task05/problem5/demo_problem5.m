% Image Overlay
% Author: Chul Min Yeum (cmyeum@uwaterloo.ca)
% Last update:: 12/14/20
clear; close all; clc; format shortG;

%% Parameter
imgBoardFile = 'IMG_0067.JPG';
imgPicFile = 'adrian-trinkaus-681192-unsplash.jpg';

info = imfinfo(imgPicFile);
sizePic = [info.Width info.Height];

%% Step1: Pick four corners of your white board in (a)
imgBoard = imread(imgBoardFile);
figure(1); imshow(imgBoard);
p = drawpolygon('LineWidth',5,'Color','black');
corner = p.Position;

%% Step2: Compute H (Your Section)
H = ComputeH(corner, sizePic);

%% Step3: Overlay your picture (I think there is a better way to do this)
imgPic = imread(imgPicFile);
[imgPicTran, RB] = imwarp(imgPic, projective2d(H'));
BWPic = roipoly(imgPicTran, corner(:,1)-RB.XWorldLimits(1), corner(:,2)-RB.YWorldLimits(1));


BWBoard = ~roipoly(imgBoard, corner(:,1), corner(:,2));
RA = imref2d(size(BWBoard));

imgBoardMask = bsxfun(@times, imgBoard, cast(BWBoard, 'like', imgBoard));
imgPicTranMask = bsxfun(@times, imgPicTran, cast(BWPic, 'like', imgPicTran));

imgFinal(:,:,1) = imfuse(imgBoardMask(:,:,1),RA, imgPicTranMask(:,:,1),RB,'diff');
imgFinal(:,:,2) = imfuse(imgBoardMask(:,:,2),RA, imgPicTranMask(:,:,2),RB,'diff');
imgFinal(:,:,3) = imfuse(imgBoardMask(:,:,3),RA, imgPicTranMask(:,:,3),RB,'diff');

imshow(imgFinal); imwrite(imgFinal, 'result.jpg');
