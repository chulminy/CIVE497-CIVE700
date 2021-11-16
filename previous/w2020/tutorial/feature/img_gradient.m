imgPatch = imread('color_patch.png');
ims
[Gmag,Gdir] = imgradient(rgb2gray(imgPatch));
figure;imshow(Gmag);

perm = randperm(size(f,2)) ;
sel = perm(1:50) ;
h2 = vl_plotframe(f(:,sel)) ;
% h2 = vl_plotframe(f) ;
set(h2,'color','y','linewidth',2) ;

h3 = vl_plotsiftdescriptor(d(:,sel),f(:,sel)) ;
% h3 = vl_plotsiftdescriptor(d,f) ;
set(h3,'color','g') ;

% f(:,4058): 720.48;461.91;4.9993;-4.076     
rad2deg(-4.076)

h2 = vl_plotframe(f(:,4058)) ;
set(h2,'color','y','linewidth',2) ;
h3 = vl_plotsiftdescriptor(d(:,4058),f(:,4058)) ;
set(h3,'color','g') ;

[Gmag,Gdir] = imgradient(imgaussfilt(im2double(uint8(img)),4.9993));
Gdir(461:462,720:721)


% f(:,198): 263.33;398.93;2.1149;-0.12329   
rad2deg(-0.12329)
h2 = vl_plotframe(f(:,198)) ;
set(h2,'color','y','linewidth',2) ;
h3 = vl_plotsiftdescriptor(d(:,198),f(:,198)) ;
set(h3,'color','g') ;

[Gmag,Gdir] = imgradient(imgaussfilt(im2double(uint8(img)),2.1149));
Gdir(398:399,263:264)


% f(:,300): 348.32       926.05       1.7762     -0.86404
rad2deg(-0.86404)
h2 = vl_plotframe(f(:,300)) ;
set(h2,'color','y','linewidth',2) ;
h3 = vl_plotsiftdescriptor(d(:,300),f(:,300)) ;
set(h3,'color','g') ;

[Gmag,Gdir] = imgradient(imgaussfilt(im2double(uint8(img)),1.7762));
Gdir(926:927,348:349)