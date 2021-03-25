%% Structure from Motion for Beginners
% This is a hands-on demo allowing student to provide practical knowledge
% about structure from motion techniques, authored by Chul Min Yeum
% (cmyeum@uwaterloo.ca). Your tasks are to write your own codes to "YOUR
% CODE HERE" in the each of tasks in this file. Some problems affect the
% rest of process, which are named as "Step". You can feel free to ask
% questions through the course website.

% Date: 12/25/20

%% Step 1: Model generation using VisualSFM
%{
1.  Download and unpack a recent VisualSFM software from the following link 
    http://ccwu.me/vsfm/ 
    Note that you need to download non-cuda version and 64 bit (or cuda
    version if you have a NVIDA graphic card in your machine).
2.  Move the folder of the software in the 'other' folder
3.  Run VisualSFM
4.  Load multi images (File-Oepn Multi images and select all images in img)
5.  Click "Compute missing matches."
6.  Click "Compute 3D reconstruction."
7.  Click "BA (Bundle adjustment)."
8.  Check your constructed model.
9.  Export the model to an NVM file (SfM-Save NView Match) to the folder
    where this code is saved (you need to save it as "result.nvm").

Please take a look at the video if you are unable to get through them.
https://youtu.be/oeQxBM5aQoQ
%}

%--------------------------------------------------------------------------
% End of Step 1------------------------------------------------------------
%--------------------------------------------------------------------------

%% Step 2: Review output model data exported from VisualSfM 
close all; clc; clear; warning off; format shortG;

addpath('other'); % include some additional functions (files)
simgFolder      = 'sample'; % sample images (for instruction)

imgFolder       = 'img';    % folder of original input images
uimgFolder      = 'uimg';   % folder of undistorted images
nvmFileName     = fullfile('result.nvm'); % NVM file name

% Please open result.nvm using a notepad (Notepad++ is much easier to read
% than the notepad. Please google "notepad++") and take look at values
% and structures. You can find the structure of the NVM file the following
% link: http://ccwu.me/vsfm/doc.html

[ImgStruct,PointInfo] = Readnvmfile(imgFolder, nvmFileName);
clearvars nvmFileName;
% You don't need to look at "Readnvmfile" code in detail, but you should
% understand the meanings of follwing two structure arrays:
% ImgStruct and PointInfo.
%{
ImgStruct
    ImgStruct.nImg          : # of original images used for SfM
    ImgStruct.imgSize       : image size (1x2) in each cell
    ImgStruct.imgFileName   : image file name (string) in each cell
    ImgStruct.fMat          : focal length (double) in each cell
    ImgStruct.RMat          : rotation matrix (3x3) in each cell
    ImgStruct.CMat          : camera center vector (1x3) in each cell
    ImgStruct.rDistMat      : radial distortion (double) in each cell

PointInfo
    PointInfo.nPt3D         : # of 3D points in the world 
    PointInfo.Pt3D          : location of a 3D point (1x3) in each cell
    PointInfo.PtRGB         : RGB color of a 3D point (1x3) in each cell
    PointInfo.nMatchImg     : # of images of which are used for generating
                              a 3D point(double) in each cell
    PointInfo.matchImgIdx   : image idexes (nMatchImg x 1) that are used to
                              generate each 3D point
    PointInfo.matchImgPos   : position of a feature in each image that
                              generates a 3D point (nMatchImg x 2) in each
                              cell
%}

% Note that feature positions stored in PointInfo.matchImgPos are the
% positions on the original images of which lens distortion is not
% corrected. 

% If you can't figure out a specific field in these arrays, PLEASE ASK
% QUESTIONS TO THE INSTRUCTORS.

% In some cases, not all images are used for SfM because some
% images having not enough overlaps with others or large distortion or
% corruption will be automatically dropped.

% View all original images used in this demo
fileNames = strcat([imgFolder,filesep], ImgStruct.imgFileName);
figure('Name', 'All original images'); 
montage(fileNames,'size',[2 3]);title('')
clearvars fileNames;

% View calibrated cameras: You can view this in VisualSfM software as well.
% Tip: "plotCamera" is a function to plot camera locations and its angles.
figure('Name', 'Reconstructed 3D point cloud data');
for ii=1:ImgStruct.nImg
    plotCamera('location',ImgStruct.CMat{ii}, ...
               'Orientation',ImgStruct.RMat{ii}, ...
               'Label',ImgStruct.imgFileName{ii}, ...
               'Color', rand(1,3), ...
               'size',0.2); hold on;
end;axis equal; grid on; axis off;

% Tip: "pcshow" is to plot 3D point cloud locations and colors.
pcshow(reshape(cell2mat(PointInfo.Pt3D),3,PointInfo.nPt3D)', ...
       reshape(cell2mat(PointInfo.PtRGB),3,PointInfo.nPt3D)'./255, ...
       'MarkerSize', 50);
title('SfM result'); hold off; 

% Here is a sample of comparison of model views in Visualsfm and Matlab,
% which I captured in my computer screen. Please do not confuse it with a
% real figure. You will see similar views. 
figure('Name', 'Sample: comparison of model views in visualSfm and Matlab'); 
imshow(imread(fullfile(simgFolder,'VisualSFM and Matlab.jpg')));

%--------------------------------------------------------------------------
% Generate and save undistorted images: You do not have to look at the
% undistortion process below (but, you have to run this code to generate
% and save undistorted images). An undirotrtion method varies depending on
% the software. Undistorted images are saved in "uimgFolder", with a same
% filename with the one for the corresponding original images.

% (Very important) Note that a pinhole camera geometry is only valid
% between the undistorted images (NOT original images) and the world points
% (3D).

if exist(uimgFolder,'file') ~= 7
    mkdir(uimgFolder);
end
for ii = 1:ImgStruct.nImg
    imgName       = ImgStruct.imgFileName{ii};
    if exist(fullfile(uimgFolder, imgName),'file') ~= 2
        fprintf('Processing undistortion of an image (%d/%d) \n', ...
            ii,ImgStruct.nImg);
        
        I   = imread(fullfile(imgFolder, imgName));
        params.cx   = ImgStruct.imgSize{ii}(1)/2;
        params.cy   = ImgStruct.imgSize{ii}(2)/2;
        params.r    = ImgStruct.rDistMat{ii}/(ImgStruct.fMat{ii})^2;
        
        img         = undistort(I,params);
        imwrite(img, fullfile(uimgFolder,imgName));
    end
end; clearvars params img I imgName ii

%--------------------------------------------------------------------------
% End of Step 2------------------------------------------------------------
%--------------------------------------------------------------------------

%% Problem 1: Observe the effect of lens (barrel) distortion
% Theorectically, all straight lines in the world become staright on the
% image if they are captured using a perfect pin-hole camera. However, due
% to radial (barrel) distorion, straight lines are distorted in their view
% on images. In this task, you will check that a straight line is not
% staright on an original image but it will be staright on an undistorted
% image. Please write your own code to check out straight line in both
% images to demonstrate the effect of lens distortion and its correction.
% You can make your result similar to the sample plot.

% Here is the sample plot. Bolt holes are placed in a straight line. 
figure('Name', 'Sample: effect of lens distortion'); 
imshow(imread(fullfile(simgFolder,'lens_distortion.jpg')));

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%% YOUR CODE HERE %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Note that your code does not affect upcoming steps. 

%% Problem 2: Plot SIFT features and their matches
% You learned the SIFT features and descriptors in the class. Feature
% extraction and matching are a key process to enaable SfM. In this task,
% convince yourself that the model generated from VisualSFM is constructed
% based on the correct feature matching , which were used to compute
% projection matrix of each image as well as its lens distortion parameter.
% In other words, plot features on any pair of images and draw matching
% lines between features to check that they are correctly matched. To
% complete this task, you need to understand the structure of "ImgStruct"
% and "PointInfo". You can randomly select any two images. The sample
% image simply shows the overall match quality. You need to observe one or
% two feature locations by zooming in those images and include them in your
% report (screen capture is fine). 

% Please think about where we plot the features, original image or
% undistorted image?

% Here is the sample plot.
figure('Name', 'Sample: feature matches'); 
imshow(imread(fullfile(simgFolder,'matchPoints.jpg')));

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%% YOUR CODE HERE %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Note that this code does not affect upcoming steps. 

%% Problem 3: Confirm that image features indicate a same world point
% This task is to understand each field in "PointInfo" and "ImgStruct". In
% the previous problem, you found that the features on the images are
% correctly matched. Such corresponded feature points generate a 3D point
% (Pt3D). Each of 3D points has which features and their images are used
% for its construction. Once you randomly select a single 3D point, plot
% all feature points on their corresponding images. Again, think about
% where we plot the features, original image or undistorted image?

% 1: Randomly or manually select a signle 3D point in PointInfo
% 2: Find the corresponding image (feature) points in PointInfo
% 3: Plot (mark) features in the corresponding image

% You should (visually) check that the features are indicating the same 3D
% points. Note that this problem is not using x = PX equation. You just
% select a 3D point and feature points in PointInfo and plot the feature
% points on the corresponding images. Step 3 (problem 4) is to compute
% projection matrix for each image. 

% Here is a sample result:
figure('Name', ['Sample: features on different', ... 
    ' images which are used for creating a 3D point']); 
imshow(imread(fullfile(simgFolder,'SameFeatures.jpg')));

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%% YOUR CODE HERE %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Note that this code does not affect upcoming steps. 

%% Step 3: Construct projection matrices (Problem 4)
% You will construct a projective matrix in each image. Go to the visualSFM
% documentation page and learn how to construct K matrix:
% http://ccwu.me/vsfm/doc.html Once you find K matrices, you will compute
% the projective matrix in each of the images. You need to use
% ImgStruct.fMat, ImgStruct.RMat, ImgStruct.CMat

% Note the projection matrices will be used at the upcomping steps. You
% need to put a cell array of projection matrices in "ImgStruct.PMat" for
% next tasks. You need to pass the assert statements.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%% YOUR CODE HERE %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    
%--------------------------------------------------------------------------
% End of Step 3------------------------------------------------------------
%--------------------------------------------------------------------------

assert(numel(ImgStruct.PMat)==ImgStruct.nImg, ...
    'incorect size of PMat');
assert(isequal(size(ImgStruct.PMat{1}),[3,4]), ...
    'incorect size of a projection matrix');

%% Problem 5: Check out x = PX relationship
% We computed the projection matrix for each image in Problem 4. The x = PX
% equation tells you that we can compute image points corresponding to any
% world points using the projection matrix. You should (visually) check
% that image points on each image projected from a single 3D point (X)
% indicate X. Note that this problem is different from Problem 3. In SfM,
% matched features on original images generate 3D points (X). However, due
% to the lens distortion, the locations of the features (x) is not exactly
% the same with PX. Problem 3 is just to check that features used for
% computing a single 3D point indicate the same 3D point. Problem 5 is to
% check that image points projected using the PX = x equation indicate the
% same scene (3D) point.

% Problem 3: I asked you to confirm that we use "same" visual points
% (features) to construct a 3D point. These feature locations are
% originally saved in the NVM file and organized in PointInfo.matchImgPos.

% Problem 5: You will confirm that the image points (NOT FEATURE !!) that
% are projected from a single 3D point are indicating same world point if
% you have correct projection matrices for test images. 

% Bascially, you can test any X point but it should be visiable (captured)
% on images. Thus, it would be better to test one of 3D points in
% PointInfo.Pt3D.

% You should use projective matrices stored in ImgStruct.PMat where you
% computed in Problem 4.

% If you do not understand the difference between Problem 3 and Problem 5,
% you should not start this problem. Understanding the difference between
% problems 3 and 5 is very important. 

figure('Name', 'Sample: identify the x = PX relationship'); 
imshow(imread(fullfile(simgFolder,'projection_reltionship.jpg')));

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%% YOUR CODE HERE %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Note that this code does not affect upcoming steps. 

%% Problem 6: Compute a fundamental matrix 
% In class, we learned how to compute a fundamental matrix between two
% images. In this problem, you are going to compute a fundamental matrix F
% using point correspondances. Again, x2'*F*x1 = 0 is established only if
% the images follow a pinhole geometry. This means the locations of the
% features extracted from the orignal images do not produce an accurate F,
% although we used these features extracted from orginal images for
% computing projection matrix for each image. Instead of using extracted
% features, we will create x (image points) by projecting 3D world points
% onto images. Then, you will compute F using normalized 8-point algorithm
% from point correspondances between two images. You also need to compute F
% from projection matrices of these images (F=[e]xP'P+).

% 1: Randomly or manually select two images (A and B)
% 2: Find all 3D points generated from features on both A and B
% 3: Compute image points on A and B corresponding to each 3D point using
%    the x=PX equation (in x2'*F*x1 = 0, x on A and B become x1 and x2,
%    respectively)

% 4_1: Compute F using noramlize 8 point algorithm (refer to
%    'fundamental_matrix_norm_8points.m' in tutorial)
% 5_1: Evaluate the average accuracy of your F (You are going to compute the
%    distance between l and x1, where l is x2' * F. 

% 4_2: Compute F using projection matrices (F2=[e]xP'P+).
% 5_2: Evaluate the average accuracy of your F2

% Here, you are going to test all x1 and x2 to compute the average
% accuracy.

% Here is the average accuracy from a instructor's code (screen capture)
% Your values do not have to be the same as mine but should be small. 
figure('Name', 'Sample: average accuracy of F estimation'); 
imshow(imread(fullfile(simgFolder,'fundamental_matrix.jpg')));

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%% YOUR CODE HERE %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Note that this code does not affect upcoming steps. 

%% Problem 7: Draw and check epipolar lines
% This problem is to show your results that are obtained from Problem
% 6. As we learned, we do not know the corresponding point x2 (in image2)
% of x1 (in image1) because we do not know the location of the
% corresponding 3D point. We only know the 3D line equation (ray) that 3D
% point is placed and 2D line equation (epipolar line) in image2 that x2 is
% placed. You are going to draw 2~3 epipolar lines in image1 or image2 to
% check if the corresponding points are placed on the lines. 

% Again, if we know X, P1 and P2, we know the x1 and x2 on image1 and
% image2, respectively. Epipolar lines are used to compute F, followed by
% P computation. You areadly utilized this relationship in Problem 6. The
% accuracy computations is done by measuring the distance between epipolar
% lines and points. You can simply repeat this process visually. 

% 1. Conduct 1-4 in Problem 6. You need to reuse the data that you computed
%    in Problem 6.
% 2. Randomly or manually select 2~3 x1. 
% 3. Plot their epipolar lines on image 2. In this case, where do we plot
%    the image points (x), original image or undistorted image?
% 4. Plot x2 on image 2 and check if x2 lies on the corresponding epipolar
%    lines

figure('Name', 'Sample: plot epipolar lines'); 
imshow(imread(fullfile(simgFolder,'epipolar_lines.jpg')));

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%% YOUR CODE HERE %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Note that this code does not affect upcoming steps. 

%% Problem 8: Point registration and scaling computation  (Step 4)
% You need to provide a physical dimensional information to your point
% cloud. In other world, scale information should be provided to measure
% distances between any pair of two 3D points in your point cloud model.
% Your SfM model that you constructed is up to scale. You should properly
% scale your model using one of known distances between two points. To find
% a scaling factor, you need to compute (register) locations of two 3D
% points and measure its distance between them IN YOUR MODEL. The scaling
% factor is the ratio of a physical distance to the model distance that you
% computed. 

% For the "Bowen wall" example, a space between bolt holes is 2 ft and the
% bolt holes are regurally spaced. You can compute the scaling factor using
% a space between any two bolt holes.
figure('Name', 'reference_length'); 
imshow(imread(fullfile(simgFolder,'reference_bowen_wall.jpg')));

% Here, the two points where you knew the distance are not likely FEATURES
% that you detected. This means that you need to compute locations of
% those 3D points in your model. To do so, you will use the a triangulation
% method to compute 3D point from 2D points on the images that we learned
% in the class. There is a MATLAB function of "triangulate". You need to
% implement your own code for triangulation and compare the results with
% the outcome from the MATLAB function. For Python users, you do not need
% to do this if there is no internal function (there is a function in
% OpenCV). 

% Write your own 
% worldPoints = your_triangulate(matchedPoints1, matchedPoints2, 
%      cameraMatrix1, cameraMatrix2) 
% This is the same structure with "triangulate". 

% Tip: "cpselect" gives you easy selection and exporting of same
% points on two images

% Finally, you compute a scaling and store it in a variable of
% `scalingFactor`. You need to pass the assert statements to do the next
% process. 

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%% YOUR CODE HERE %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%--------------------------------------------------------------------------
% End of Step 4------------------------------------------------------------
%--------------------------------------------------------------------------

assert(logical(exist('scalingFactor', 'var')), ...
    'please create a variable of scalingFactor');
assert(isscalar(scalingFactor), 'scalingFactor variable should be scalar') 

%% Problem 9: Compute an unknown distance
% Please watch the following video to learn how to make measurement:
% https://youtu.be/urlWtFr7JF8

% Please make measurement of a distance between two points. Please do not
% select the same points used in the video. 

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%% YOUR CODE HERE %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% Problm 10: Repeat this process using given differnt image sets 
% Two more datasets are provided, named as "Bookshelf" and "Monitor". You
% will see "reference.jpg" in each dataset and find some physical
% distances. You will compute a scaling factor using one of ground-truth
% measurements. Then, the other measurements are used for validating
% your measurement that is calculated using your software above.

%% Problm 11: Repeat this process using your own image set 
% You will collect a new dataset using your camera. I recommend using a
% regular camera to collect images but I think you can use your phone
% camera. You need to measure a couple of physical distance in your scene
% and compare them with your measurements calculated using your software.