function R = eulToRotM(euler, euler_seq)
    
    if size(euler,1) ~= 1 
        disp('ERROR: wrong input size to eulToRotM function')
        return
    elseif size(euler,2) ~= 3
        disp('ERROR: wrong input size to eulToRotM function')
        return
    end
    
    phi = euler(1);
    theta = euler(2);
    psi = euler(3);
    
    if euler_seq == '321'
        % euler 3-2-1: same as XYZ
        R11 = cos(theta) * cos(psi);
        R12 = sin(phi) * sin(theta) * cos(psi) - cos(phi) * sin(psi);
        R13 = cos(phi) * sin(theta) * cos(psi) + sin(phi) * sin(psi);

        R21 = cos(theta) * sin(psi);
        R22 = sin(phi) * sin(theta) * sin(psi) + cos(phi) * cos(psi);
        R23 = cos(phi) * sin(theta) * sin(psi) - sin(phi) * cos(psi);

        R31 = -sin(theta);
        R32 = sin(phi) * cos(theta);
        R33 = cos(phi) * cos(theta);
            
        R = [R11, R12, R13;
             R21, R22, R23;
             R31, R32, R33];
    elseif euler_seq == '123'
        % euler 1-2-3
        R11 = cos(theta) * cos(psi);
        R12 = cos(theta) * sin(psi);
        R13 = -sin(theta);

        R21 = sin(phi) * sin(theta) * cos(psi) - cos(phi) * sin(psi);
        R22 = sin(phi) * sin(theta) * sin(psi) + cos(phi) * cos(psi);
        R23 = sin(phi) * cos(theta);

        R31 = cos(phi) * sin(theta) * cos(psi) + sin(phi) * sin(psi);
        R32 = cos(phi) * sin(theta) * sin(psi) - sin(phi) * cos(psi);
        R33 = cos(phi) * cos(theta);
        

        R = [R11, R12, R13;
             R21, R22, R23;
             R31, R32, R33];
    elseif euler_seq == 'XYZ'
        Rx = [1 0 0;
              0 cos(phi) -sin(phi);
              0 sin(phi) cos(phi)];
        Ry = [cos(theta) 0 sin(theta);
              0 1 0;
              -sin(theta) 0 cos(theta)];
        Rz = [cos(psi) -sin(psi) 0;
              sin(psi) cos(psi) 0;
              0 0 1];
        R = Rz*Ry*Rx;  
    elseif euler_seq == 'ZYX'
        Rx = [1 0 0;
              0 cos(phi) -sin(phi);
              0 sin(phi) cos(phi)];
        Ry = [cos(theta) 0 sin(theta);
              0 1 0;
              -sin(theta) 0 cos(theta)];
        Rz = [cos(psi) -sin(psi) 0;
              sin(psi) cos(psi) 0;
              0 0 1];
        R = Rx*Ry*Rz;  
    else
        disp('ERROR:Invalid Euler Sequence')
    end


end