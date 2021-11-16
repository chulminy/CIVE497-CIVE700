clear; close all; clc;
% % create a bick patch
% img = imread('brick-wall-bricks-stone-207142.jpg');
% figure(1);imshow(img)
% [J, rect] = imcrop(img);
% imwrite('brick_patch.jpg',J);

img = imread('brick-wall-bricks-stone-207142.jpg');
img = imresize(img,0.2);
imgg = rgb2gray(img);
imgg = im2double(imgg);

patch = imread('brick_patch.jpg');
patch = imresize(patch,0.2);
patchg = rgb2gray(patch);
patchg = im2double(patchg);

cp = size(patch, 1);
rp = size(patch, 2);

img_map = normxcorr2(patchg, imgg);

figure(1); imagesc(img_map);colormap(gray);

figure(2); imshow(img_map>0.75)
img_map = img_map(round(cp/2):(end-round(cp/2)+1), rp/2:(end-rp/2+1));

s = regionprops(img_map>0.75,'Centroid'); 
label_str = cell(numel(s),1);
position = zeros(numel(s),4);
for ii=1:numel(s)
    label_str{ii} = ['Brick: ' num2str(ii)];
    cent = s(ii).Centroid;
    position(ii,:) = [cent(1)-rp/2, cent(2)-cp/2, rp, cp];
end

RGB = insertObjectAnnotation(img,'rectangle',position,label_str,...
    'TextBoxOpacity',0.9,'FontSize',8);

% img2 = imfill(~im2bw(img),'holes');


figure(3); imshow(RGB);