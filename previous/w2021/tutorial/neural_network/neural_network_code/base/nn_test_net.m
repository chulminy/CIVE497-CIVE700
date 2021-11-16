function outData = nn_test_net(net, x)

net.input.data = x;

outData = forward_test(net);
end

function outData = forward_test(net)

net.layer.inData = transpose(net.input.data'*net.layer.weight + net.layer.bias');
net.layer.outData =  nn_activation(net.layer.inData, net.layer.activation, 'forward');

net.output.inData =  transpose(net.layer.outData' * net.output.weight + net.output.bias');

outData =  nn_activation(net.output.inData, net.output.activation, 'forward');

end