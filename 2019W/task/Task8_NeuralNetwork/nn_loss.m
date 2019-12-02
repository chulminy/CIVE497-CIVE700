function y = nn_loss(x, t, func, path)

switch func
    case 'binary_cross_entropy'
        y = binary_cross_entropy(x,t,path);
    case 'categorical_cross_entropy'
        y = categorical_cross_entropy(x,t,path);
    case 'l2_loss'
        y = l2_loss(x,t,path);
end
end

function y = binary_cross_entropy(x, t, path)

switch path
    case 'forward'
        y = -(log(x(t==1))+log(1-x(t~=1)));
    case 'backward'
        y = zeros(size(x));
        i_1 = find(t==1);
        i_0 = find(t~=1);
        
        y(i_1) = -1./x(i_1);
        y(i_0) = 1./(1-x(i_0));
end

end

function y = categorical_cross_entropy(x, t, path)

switch path
    case 'forward'
        y = zeros(size(x));
        i_1 = find(t==1);
        y(i_1) = -log(x(i_1));
    case 'backward'
        y = zeros(size(x));
        i_1 = find(t==1);
        y(i_1) = -1./x(i_1);
end

end


function y = l2_loss(x, t, path)

switch path
    case 'forward'
        y = 1/2*(x-t).*(x-t);
    case 'backward'
        y = x-t;
end

end