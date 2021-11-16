function tr = nn_test_net(net, x, t)

nData = size(x,2);

entropy = zeros(nData,1);
is_correct = zeros(nData,1);
for jj=1:nData
    net.input.data = x(:,jj);
    net.output.data = t(:,jj);
    [entropy(jj), is_correct(jj)] = forward_prop(net);
end
tr.entropy = mean(entropy);
tr.acc = sum(is_correct)/nData;

end

function [entropy, is_correct] = forward_prop(net)

net.layer.inData = transpose(net.input.data'*net.layer.weight + net.layer.bias');
net.layer.outData =  nn_activation(net.layer.inData, net.layer.activation, 'forward');

net.output.inData =  transpose(net.layer.outData' * net.output.weight + net.output.bias');
net.output.outData =  nn_activation(net.output.inData, net.output.activation, 'forward');

% evaluation
entropy = nn_loss(net.output.outData, net.output.data, net.output.loss, 'forward');
[~, I] = max(net.output.outData);
is_correct = isequal(I, find(net.output.data));
end