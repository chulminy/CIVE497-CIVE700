function [net, loss] = nn_train_net(net, x, t)

nData = size(x,2);

loss = zeros(nData,1);
for jj=1:nData
    net.input.data = x(:,jj);
    net.output.data = t(:,jj);
    
    [net, loss(jj)] = forward_prop(net);
    net = backward_prop(net);
end
loss = mean(loss); % average loss (entropy)

end

function [net, loss] = forward_prop(net)

net.layer.inData = transpose(net.input.data'*net.layer.weight + net.layer.bias');
net.layer.outData =  nn_activation(net.layer.inData, net.layer.activation, 'forward');

net.output.inData =  transpose(net.layer.outData' * net.output.weight + net.output.bias');
net.output.outData =  nn_activation(net.output.inData, net.output.activation, 'forward');

% evaluation
loss = nn_loss(net.output.outData, net.output.data, net.output.loss, 'forward'); % cost function
end

function net = backward_prop(net)
% output layer
net.output.dEdO = nn_loss(net.output.outData, net.output.data, net.output.loss, 'backward');
net.output.dOdI = nn_activation(net.output.inData, net.output.activation, 'backward');
net.output.dIdW = repmat(net.layer.outData,1,net.output.node);
if  strcmp(net.output.activation, 'softmax')
    net.output.dEdI = net.output.dOdI*net.output.dEdO;
else
    net.output.dEdI = net.output.dEdO.*net.output.dOdI;
end
net.output.dEdW = bsxfun(@times, net.output.dEdI' , net.output.dIdW);

net.output.weight = bsxfun(@minus, net.output.weight, net.output.dEdW*net.param.learningrate);
net.output.bias = bsxfun(@minus, net.output.bias,  net.output.dEdI*net.param.learningrate);

% hidden layer
net.layer.dEdO = sum(bsxfun(@times,net.output.dEdI', net.output.weight),2);
net.layer.dOdI = nn_activation(net.layer.inData, net.layer.activation, 'backward');
net.layer.dIdW = repmat(net.input.data,1,net.layer.node);
net.layer.dEdI = net.layer.dEdO.*net.layer.dOdI;
net.layer.dEdW = bsxfun(@times, net.layer.dEdI', net.layer.dIdW);

net.layer.weight = bsxfun(@minus, net.layer.weight, net.layer.dEdW*net.param.learningrate);
net.layer.bias = bsxfun(@minus, net.layer.bias,  net.layer.dEdI*net.param.learningrate);
end