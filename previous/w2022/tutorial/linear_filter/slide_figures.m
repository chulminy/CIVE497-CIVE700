img = imread('brick-wall-bricks-stone-207142.jpg');

imgg = rgb2gray(imresize(img, 0.1));
figure(1); imshow(imgg);
figure(2); surf(im2double(imgg));colormap(jet); axis off; colorbar