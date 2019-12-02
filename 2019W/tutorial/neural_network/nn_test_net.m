function tr = nn_test_net(net, x, t)

net.input.data = x;
net.output.data = t;
[tr.entropy, tr.acc, tr.clss_prob] = forward_test(net);
end

function [entropy, accuracy, clss_prob] = forward_test(net)

net.layer.inData = transpose(net.input.data'*net.layer.weight + net.layer.bias');
net.layer.outData =  nn_activation(net.layer.inData, net.layer.activation, 'forward');

net.output.inData =  transpose(net.layer.outData' * net.output.weight + net.output.bias');
net.output.outData =  nn_activation(net.output.inData, net.output.activation, 'forward');

% evaluation
entropy_all = nn_loss(net.output.outData, net.output.data, net.output.loss, 'forward');
entropy = mean(entropy_all);

[clss_prob,I] = max(net.output.outData);

acc_all = zeros(numel(I),1); 
for ii=1:numel(I)
    gt = find(net.output.data(:,ii));
    acc_all(ii) = isequal(gt, I(ii));
end
accuracy = mean(acc_all);

end
