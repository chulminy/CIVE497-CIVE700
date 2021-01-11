img_base_c = imread('where_waldo.jpg');

waldo_rect = [151 135 29 50];
img_wal_c = imcrop(img_base_c, waldo_rect);

img_base = im2double(rgb2gray(img_base_c));
img_wal = im2double(rgb2gray(img_wal_c));

img_base = img_base-mean(img_wal, 'all');
img_wal = img_wal-mean(img_wal, 'all');

crr = xcorr2(img_base, img_wal); 

[~, ind] = max(crr(:)); 
[row, col] = ind2sub(size(crr), ind);

[sz1, sz2] = size(img_wal);

img_base_c = insertShape(img_base_c, 'rectangle', [col-sz2+1, row-sz1+1, sz2, sz1], 'LineWidth',5);

figure; imagesc(crr);
figure; imshow(img_base_c);