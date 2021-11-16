%% ------------------------------------------------------------------------
%                       CIVE 497 / CIVE 700 
%             Smart Structure Technology (Winter, 2019)
% -------------------------------------------------------------------------
% Task 7 - Scan Registration
% by: ENTER STUDENT NAME
% ID: ENTER STUDENT ID
%% ------------------------------------------------------------------------
% NOTES: 
% * You may need to set your current directory to the directory of this
%   main file.
% * The general layout for this assignment has been done ahead of time for
%   you. The areas that you need to complete are marked by:
%     % ****
%     % [...Do Stuff...]
%     % ****

clc; clear; 
close all;

% Comment out the following 3 lines if using 2016 and earlier
set(0,'DefaultLegendAutoUpdate','off');
diary cwOutput.txt
diary on


%% Add path for input files
addpath(pwd,'functions')
addpath(pwd,'scans')

%% STEP 1) Load required files

% a) Load scans:
    scanCFile = 'scanC.pcd';
    scanDFile = 'scanD.pcd';
    % ****
    % Use .ply files if using matlab 2016 and earlier:
    %scanCFile = 'scanC.ply';
    %scanDFile = 'scanD.ply';
    % ****

%% STEP 2) Read point clouds and pre-process
disp('Loading point clouds...')
tic
%{%}

% a) read point clouds from file:
scanC = pcread(fullfile(pwd,'scans',scanCFile));
scanD = pcread(fullfile(pwd,'scans',scanDFile));

% b) Crop point cloud
    
    % ****
    % Crop Ceiling:
    % cropAreaC = []; % [Xmin, Xmax; Ymin, Ymax; Zmin, Zmax]
    % cropAreaD = [];

    % Or Crop out only white board area:
    % cropAreaC = []; 
    % cropAreaD = [];
    
    % scanC = select(****, findPointsInROI(****, cropAreaC));
    % scanD = select(****, findPointsInROI(****, cropAreaD));
    % ****
    
% c) denoise:
    % ****
    % scanC = pcdenoise(****, 'NumNeighbors', ####, 'Threshold', ####);
    % scanD = pcdenoise(****, 'NumNeighbors', ####, 'Threshold', ####);
    % ****

% d) downsample using one of two methods:

    % ****
    % 1) grid average filter:
    % scanCred = pcdownsample(****, 'gridAverage', ####); % for point2point
    % scanDred = pcdownsample(****, 'gridAverage', ####); % for point2point
    % 
    % 2) grid non-uniform grid filter to preserve normals:
    % maxNoPtsC = ###;
    % maxNoPtsD = ###;
    % scanCred = pcdownsample(****, 'nonuniformGridSample', maxNoPtsC); % for point2plane
    % scanDred = pcdownsample(****, 'nonuniformGridSample', maxNoPtsD); % for point2plane
    % ****
    
toc
%% STEP 3) Combine Scans
% -------------------------------------------------------------------------
% let: 
    % scanD:  be the reference scan in frame F_R
    % scanC:  be the target scan in frame F_T
% Goal: transform the target scan into the reference scan frame and
% combine them in the reference scan's frame (F_T -> F_R)

disp('registering scans...')
tic

% a) set reference and target clouds:
    scanT = scanC;
    scanR = scanD;
    scanTred = scanCred;
    scanRred = scanDred;

% b) Create initial transformation guess
    % T_rest_t: transform from target frame to estimated reference frame
    % (F_T -> F_Rest)

    % NOTE: for some of the functions, we need to work with affine3d objects 
    % instead of 4x4 transformation matrices. I have created functions to 
    % convert to and from an affine3d representation of a transformation matrix

    % i) Enter estimated translation
    % ****
    % t_Rest_T = []; % [dx ; dy; dz] in m
    % ****
    
    % ii) Create estimated rotation matrix using XYZ convention
    % Notes:
    % XYZ convention means perform rotations about X axis, then Y, then Z
    % This is a custom eulToRotM. The built-in matlab version is eul2rotm.
    % This custom version creates R which pre-multiplies points (R * x)
    % Matlab's version creates R which post-multiplies points (x * R)
    
    % ****
    % R_Rest_T = eulToRotM([****], 'XYZ'); % [RotX, RotY, RotZ] in rad
    % ****
    
    % iii) Create transformation matrix:
    T_Rest_T = buildTransform(R_Rest_T, t_Rest_T);
    TA_Rest_T = convertToAffine3d(T_Rest_T); % convert to affine3d object

% c) Transform cloud using estimated transform
    % ****
    % scanTintermediate = pctransform(****, ****);
    % ****

% d) Refine using scan registration with reduced clouds
    
    % i) Run scan registration to get a precise transformation between 
    % the estimated reference frame and the true reference frame
    
    % ****
    % [TA_R_T] = pcregrigid(****, ****, ...
    %                      'InitialTransform', ****,  ... % IMPORTANT
    %                      'Metric', 'pointToPoint', ... %  Or pointToPlane
    %                      'MaxIterations', ****, ...
    %                      'Tolerance', [***, ****], ...
    %                      'Verbose', true, ...
    %                      'InlierRatio', ****);
    % ****
    T_R_T = convertFromAffine3d(TA_R_T);
    
    % ii) Apply final transformation to map 
    % scanTredreg = pctransform(****, ****); % registered and reduced
    % scanTreg = pctransform(****, ****);  % registered and full resolution
toc

%% STEP 4) Plotting Point Clouds
T_0 = [1 0 0 0; 0 1 0 0; 0 0 1 0; 0 0 0 1]; % this is used for plotting the origin axis

figure (1)
    colormap cool

    subplot(1,2,1)
    pcshow(scanRred.Location)
    drawAxis(T_0, 10);
    legend('Reference, R', 'X-axis', 'Y-axis', 'Z-axis');
    xlabel('x')
    ylabel('y')
    zlabel('z')
    title('Reference Scan')

    subplot(1,2,2)
    pcshow(scanTred.Location)
    drawAxis(T_0, 10);
    xlabel('x')
    ylabel('y')
    zlabel('z')
    legend('Target, T', 'X-axis', 'Y-axis', 'Z-axis');
    title('Target Scan')

figure (2)

    subplot(1,2,1)
    hold on
    pcshow(scanRred.Location, [1, 0, 0])
    pcshow(scanTintermediate.Location, [0, 0, 1])
    legend('Reference, R', 'T transformed', 'X-axis', 'Y-axis', 'Z-axis');
    drawAxis(T_0, 10);
    drawAxis(T_Rest_T, 10);
    xlabel('x')
    ylabel('y')
    zlabel('z')
    title('R vs T transformed')

    subplot(1,2,2)
    hold on
    pcshow(scanRred.Location, [1, 0, 0])
    pcshow(scanTredreg.Location, [0, 1, 0])
    legend('Reference, R', 'T registered', 'X-axis', 'Y-axis', 'Z-axis');
    drawAxis(T_0, 10);
    drawAxis(T_R_T, 10);
    xlabel('x')
    ylabel('y')
    zlabel('z')
    title('R vs T registered')

% Crop point cloud to include only white board

combinedCloud = pcmerge(scanR, scanTreg, 0.01);
cropArea = [-3.5, 0.5; -5, -1; -1, 10];
croppedIndices = findPointsInROI(combinedCloud, cropArea);
combinedCloudCropped = select(combinedCloud, croppedIndices);

figure (3)
    hold on
    pcshow(combinedCloudCropped.Location)
    drawAxis(T_0, 1);
    drawAxis(T_R_T, 1);
    legend('Cloud', 'X-axis', 'Y-axis', 'Z-axis');
    xlabel('x')
    ylabel('y')
    zlabel('z')
    title('Combined and Cropped Cloud - registered cloud')

combinedCloud2 = pcmerge(scanRred, scanTintermediate, 0.01);
croppedIndices = findPointsInROI(combinedCloud2, cropArea);
combinedCloudCropped2 = select(combinedCloud2, croppedIndices);

figure (4)
    hold on
    pcshow(combinedCloudCropped2.Location)
    drawAxis(T_0, 1);
    drawAxis(T_Rest_T, 1);
    legend('Cloud', 'X-axis', 'Y-axis', 'Z-axis');
    xlabel('x')
    ylabel('y')
    zlabel('z')
    title('Combined and Cropped Cloud - initial guess')
    
%% STEP 5) Colouring scans
% UNCOMMENT THIS FOR Q5 & Q6
%{ 

% From Ladybug & Lidar calibration - DO NOT EDIT:
%--------------------------------------------------------------------------
% Tranform from Ladybug frame to Lidar frame: 
    R_L_C = eulToRotM([-0.010 -0.000 -1.8658], 'ZYX');
    t_L_C = [0.2173 -0.00 0.1231]';
    T_L_C = buildTransform(R_L_C, t_L_C);
    
% Intrinsics Cam 0:
    imSize = [2464 2048];
    f0 = [0.183942 0.221305].*imSize;
    c0 = [0.492484   0.510805].*imSize;
    K0 = [f0(1) 0     c0(1)
          0     f0(2) c0(2)
          0     0     1];

% Extrinsics Cam C0 
    R_C_C0  =  eulToRotM([1.900436 1.569641 1.900436], 'XYZ');
    t_C_C0 = [ 0.061028 0.000269 -0.000359 ]'; 
    T_C_C0 = buildTransform(R_C_C0, t_C_C0);
    T_L_C0 = T_L_C * T_C_C0;
    T_C0_R = inv(T_L_C0);

% Intrinsics Cam 2:
    f2 = [0.178925 0.215269].*imSize;
    c2 = [0.511217   0.511563].*imSize;
    K2 = [f2(1) 0     c2(1)
          0     f2(2) c2(2)
          0     0     1];  
  
% Extrinsics Cam C2       
    R_C_C2  =  eulToRotM([-0.662375 1.566779 3.108176], 'XYZ');
    t_C_C2 = [-0.049274 -0.036115 0.000434]'; 
    T_C_C2 = buildTransform(R_C_C2, t_C_C2);
    T_L_C2 = T_L_C * T_C_C2;
%--------------------------------------------------------------------------

imC0 = im2double(imread(fullfile(pwd,'images','pose_D_C0.jpg')));
% imC2 = im2double(imread(fullfile(pwd,'images','pose_C_C2.jpg')));

% ****
% MAKE SURE YOU HAVE THE FOLLOWING CLOUDS: combinedCloudCropped, combinedCloud
% which need to be expressed in Frame R (scanD Frame)
colourMapCropped0 = colourScan(combinedCloudCropped, K0, T_C0_R, imC0); 
colourMapFull0 = colourScan(combinedCloud, K0, T_C0_R, imC0); 
% *****

figure (5)
    hold on
    pcshow(combinedCloudCropped.Location, colourMapCropped0)
    %pcshow(combinedCloud.Location, colourMapCropped0) % uncomment to see full cloud
    drawAxis(T_0, 1);
    drawAxis(T_L_C, 0.5);
    drawAxis(T_L_C0, 0.7);
    legend('Cloud', 'X-axis', 'Y-axis', 'Z-axis');
    xlabel('x')
    ylabel('y')
    zlabel('z')
    title('Coloured Cloud - imC0')    
%}