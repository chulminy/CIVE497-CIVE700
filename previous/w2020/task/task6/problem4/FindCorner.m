function corner = FindCorner(img)

imgG = rgb2gray(img);
imgG = adapthisteq(imgG);
imgG2 = imgaussfilt(imgG, 8);
BW = edge(imgG2, 'canny',[0.2 0.3]);
[H,T,R] = hough(BW);

p = houghpeaks(H,4);
d = R(p(:,1));
theta = T(p(:,2));
lineAll = [cosd(theta); sind(theta); -d];
[~, id] = sort(abs(theta-theta(1)), 'ascend');

lineSet1 = lineAll(:, [1, id(2)]);
lineSet2 = lineAll(:, [id(3), id(4)]);

pt1 = cross(lineSet1(:,1), lineSet2(:,1)); pt1 = pt1(1:2)./pt1(3);
pt2 = cross(lineSet1(:,1), lineSet2(:,2)); pt2 = pt2(1:2)./pt2(3);
pt3 = cross(lineSet1(:,2), lineSet2(:,2)); pt3 = pt3(1:2)./pt3(3);
pt4 = cross(lineSet1(:,2), lineSet2(:,1)); pt4 = pt4(1:2)./pt4(3);

side1_max = max(norm(pt1-pt2),norm(pt3-pt4));
side2_max = max(norm(pt2-pt3),norm(pt4-pt1));
[~,max_side] = max([side1_max side2_max]);
if max_side == 1
    corner = [pt2 pt3 pt4 pt1]';
else
    corner = [pt1 pt2 pt3 pt4]';
end