G = 1/16*[1 2 1;2 4 2;1 2 1];
g = 1/4*[1 2 1]';
img = rand(10000, 8000);
tic; imgG1 = conv2(img,G); toc
tic; imgG2 = conv2(img,g); toc