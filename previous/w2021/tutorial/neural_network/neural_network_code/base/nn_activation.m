function y = nn_activation(x, func, path)

switch func
    case 'linear'
        y = linear(x, path);
    case 'relu'
        y = relu(x, path);
    case 'sigmoid'
        y = sigmoid(x, path);
    case 'softmax'
        y = softmax(x, path);
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
        % https://eli.thegreenplace.net/2016/the-softmax-function-and-its-derivative/
        p = exp(x)./sum(exp(x));
        n_data = numel(p);
        y = zeros(n_data,n_data);
        
        for ii=1:n_data
            for jj=1:n_data
                if ii==jj
                   y(ii,jj) = p(ii)*(1-p(jj)); 
                else
                   y(ii,jj) = -p(ii)*p(jj); 
                end
            end
        end
end
end