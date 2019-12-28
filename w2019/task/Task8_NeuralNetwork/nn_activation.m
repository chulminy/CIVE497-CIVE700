function y = nn_activation(x, func, path)

switch func
    case 'relu'
        y = relu(x, path);
    case 'sigmoid'
        y = sigmoid(x, path);
    case 'softmax'
        y = softmax(x, path);
    case 'linear'
        y = linear(x, path);
end
end

function y = relu(x, path)
switch path
    case 'forward'
        y = max(x,0);
    case 'backward'
        y = zeros(size(x));
        y(x>0) = 1;
end
end

function y = sigmoid(x, path)
switch path
    case 'forward'
        y = 1./(1+exp(-x));
    case 'backward'
        sig = 1./(1+exp(-x));
        y = sig.*(1-sig);
end
end

function y = softmax(x, path)
switch path
    case 'forward'
        y = exp(x)./sum(exp(x));
    case 'backward'
        denom = sum(exp(x))^2;
        numer = exp(x).*(sum(exp(x))-exp(x));
        y = numer./denom;
end
end

function y = linear(x, path)
switch path
    case 'forward'
        y = x;
    case 'backward'
        y = 1;
end
end