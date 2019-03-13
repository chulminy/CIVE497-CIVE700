function [ImgStruct,PointInfo] = Readnvmfile(folderPathImg, nvmFileName)
%     - input : nvmfile
%     - ouput : ImgStruct
%               PointInfo  

% read a nvmfile
nvmfile = fullfile(nvmFileName);
points  = fileread(nvmfile);
nImg    = textscan(points, ' %f  ','HeaderLines',2);  % skip first two lines 
nImg    = nImg{1}(1);   % # of tested images

% read camera matrix
M1= textscan(points, ' %q %f  %f  %f  %f  %f %f  %f  %f  %f  %f',...
    nImg, 'HeaderLines',3);                                  

imgFileName       = M1{1};
fMat              = M1{2};
quaternionMat     = cell2mat(M1(3:6));
RMat              = quaternion2ROT(quaternionMat);
CMat              = cell2mat(M1(7:9));
rDistMat          = M1{10};

ImgStruct.nImg = nImg;
for ii=1: nImg
    [~,filename, ext] = fileparts(imgFileName{ii});
    imgFileName{ii} = [filename ext];
    info = imfinfo(fullfile(folderPathImg, imgFileName{ii}));
    
    ImgStruct.imgSize{ii} = [info.Width info.Height];
    ImgStruct.imgFileName{ii} = imgFileName{ii};
    ImgStruct.fMat{ii} = fMat(ii);
    ImgStruct.RMat{ii} = reshape(RMat(ii,:),3,3);
    ImgStruct.CMat{ii} = CMat(ii,:);
    ImgStruct.rDistMat{ii} = rDistMat(ii);
end

%--------------------------------------------------------------------------
nPt3D = textscan(points, ' %f  ',1,'HeaderLines',4+nImg); 
nPt3D = nPt3D{1};                        

PointInfo.nPt3D = nPt3D;

P=textscan(points, '%f ','HeaderLines',5+nImg);
P=cell2mat(P);              

idx = 1;
for ii=1:nPt3D

    PointInfo.Pt3D{ii}        = P(idx:idx+2)';
    PointInfo.PtRGB{ii}       = P(idx+3:idx+5)';
    PointInfo.nMatchImg{ii}   = P(idx+6);

    tmpImg  = zeros(PointInfo.nMatchImg{ii},1); 
    tmpSift = zeros(PointInfo.nMatchImg{ii},1); 
    tmpPos  = zeros(PointInfo.nMatchImg{ii},2); 
    tmpPosNew  = zeros(PointInfo.nMatchImg{ii},2);  
    
    for jj=1: PointInfo.nMatchImg{ii}
        tmpImg(jj)   = P(idx+7+(jj-1)*4);
        tmpSift(jj)  = P(idx+7+(jj-1)*4+1);
        tmpPos(jj,:) = [P(idx+7+(jj-1)*4+2) P(idx+7+(jj-1)*4+3)];
    
% Note: the feature locations saved in NVM files are still relative to the
% image centers rather than the calibrated principal point [cx, cy];
% http://ccwu.me/vsfm/doc.html
        tmpPos(jj,:) = tmpPos(jj,:) + ImgStruct.imgSize{tmpImg(jj)+1}/2;
    end
    
    PointInfo.matchImgIdx{ii}         = tmpImg +1; % because it starts from 0
    PointInfo.matchImgPos{ii}         = tmpPos;
    PointInfo.matchImgPosUndist{ii}   = tmpPosNew;
    
    idx = idx + 7 + PointInfo.nMatchImg{ii}*4; 
end

end
%--------------------------------------------------------------------------
function ROT = quaternion2ROT(qmat)

ROT = zeros(size(qmat,1),9);

for ii=1:size(qmat,1)
    q = qmat(ii,:);
    q = q./norm(q);
    rotmat = [ 1 - 2*q(3).^2 - 2*q(4).^2,  ...
        2*q(2)*q(3) - 2*q(1)*q(4), ...
        2*q(4)*q(2) + 2*q(1)*q(3); ...
        ...
        2*q(2)*q(3) + 2*q(1)*q(4), ...
        1 - 2*q(2).^2 - 2*q(4).^2, ...
        2*q(3)*q(4) - 2*q(1)*q(2); ...
        ...
        2*q(4)*q(2) - 2*q(1)*q(3), ...
        2*q(3)*q(4) + 2*q(1)*q(2), ...
        1 - 2*q(2).^2 - 2*q(3).^2 ];
    ROT(ii,:) = rotmat(:);
end

end