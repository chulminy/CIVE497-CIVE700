function T = buildTransform(R,t)
    if size(R,1) ~= 3
        disp('ERROR: Invalid R matrix inputted to buildTransform function')
        return
    elseif size(R,2) ~= 3
        disp('ERROR: Invalid R matrix inputted to buildTransform function')
        return
    elseif size(t,1) ~= 3
        disp('ERROR: Invalid t matrix inputted to buildTransform function')
        return
    elseif size(t,2) ~= 1
        disp('ERROR: Invalid t matrix inputted to buildTransform function')
        return
    end
    
    T = eye(4);
    T(1:3, 1:3) = R;
    T(1:3, 4) = t;
end