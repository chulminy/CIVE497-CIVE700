function colourMap = colourScan(scan, K, T_C_L, img)
    disp('Colouring scans...')
    tic
    img = flip(img, 2); 
    umax = size(img, 1);
    vmax = size(img, 2);
    D = eye(3);
    D = [D, [0;0;0]];
    colourMap = zeros(scan.Count,3);
    counter = 0;
    
    for i = 1:scan.Count
        X = [scan.Location(i,1);
             scan.Location(i,2);
             scan.Location(i,3);
                             1];
        X_cam = T_C_L * X;
        X_proj =  K * D * X_cam;
        u = int16(round(X_proj(1)/X_proj(3)));
        v = int16(round(X_proj(2)/X_proj(3)));
%         fx = K(1,1);
%         fy = K(2,2);
%         cx = K(1,3);
%         cy = K(2,3);
%         x = X_cam(1,1);
%         y = X_cam(2,1);
%         z = X_cam(3,1);
%         u = fx*x/z + cx;
%         v = fy*y/z + cy;
%         u = int16(round(u));
%         v = int16(round(v));
        if(u > 0 && v > 0 && u<umax && v<vmax && X_cam(3,1)>0)
            r = img(u,v,1);
            g = img(u,v,2);
            b = img(u,v,3);
            if(r== 0 && g == 0 && b == 0)
                % DO NOT COLOUR
            else
                colourMap(i,1) = r;
                colourMap(i,2) = g;
                colourMap(i,3) = b;              
                counter = counter +1;
            end
        end
        
    end
    toc
    fprintf('Total points in cloud: %d\n',scan.Count);
    fprintf('Points within image plane: %d\n', counter);
end
