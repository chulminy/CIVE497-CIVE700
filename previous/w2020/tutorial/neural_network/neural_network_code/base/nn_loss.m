function y = nn_loss(x, t, func, path)

switch func
    case 'cross_entropy'
        y = cross_entropy(x,t,path);
    case 'l2_loss'
        y = l2_loss(x,t,path);    
end
end

function y = cross_entropy(x, t, path)

switch path
    case 'forward'
        y = -log(x(t==1));
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