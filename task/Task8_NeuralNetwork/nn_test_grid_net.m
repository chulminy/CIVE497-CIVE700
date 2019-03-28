function clss_prob = nn_test_grid_net(net, x)

net.input.data = x;
clss_prob = forward_prop(net);

end

function clss_prob = forward_prop(net)

net.layer.inData = transpose(net.input.data'*net.layer.weight + net.layer.bias');
net.layer.outData =  nn_activation(net.layer.inData, net.layer.activation, 'forward');

net.output.inData =  transpose(net.layer.outData' * net.output.weight + net.output.bias');
net.output.outData =  nn_activation(net.output.inData, net.output.activation, 'forward');

clss_prob = net.output.outData;

end
