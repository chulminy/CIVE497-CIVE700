function y = nn_loss(x, t, func, path)

switch func
    case 'cross_entropy'
        y = cross_entropy(x,t,path);
end
end

function y = cross_entropy(x, t, path)

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