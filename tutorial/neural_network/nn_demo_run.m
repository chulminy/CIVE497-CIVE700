function nn_demo_run
% Simple neural network demonstration
% This code shows how to implement a multi-layer neural network (having a
% single hidden layer). User can change some basic parameters including
% learning rate, number of neurons, number of epoch, etc. User also see the
% following web-based implementation from here:
% https://github.com/tensorflow/playground

% Author: Chul Min Yeum (cmyeum@uwaterloo.ca)
% Last update: 11/28/2018

% % dataset 1: demonstration using gaussian dataset
dataset = nn_generate_dataset('gaussian');
test_nn(dataset);

% dataset 2: demonstration using circle dataset
% dataset = nn_generate_dataset('circle');
% test_nn(dataset);

% % dataset 3: demonstration using xor dataset
% dataset = nn_generate_dataset('xor');
% test_nn(dataset);

end
function net = set_nn
net.param.numepoch = 10;
net.param.train_test_ratio = [0.85 0.15];

net.param.learningrate = 0.01;

net.input.node = 2;
net.layer.node = 15;
net.output.node = 2;

net.layer.activation = 'sigmoid';
net.output.activation = 'softmax';
net.output.loss = 'cross_entropy';

net.layer.weight = rand(net.input.node, net.layer.node)-1; % -1 ~ 1
net.layer.bias = zeros(net.layer.node, 1);

net.output.weight = rand(net.layer.node, net.output.node)-1; % -1 ~ 1
net.output.bias = zeros(net.output.node, 1);

end

function test_nn(dataset)

net = set_nn;

train_test_ratio = net.param.train_test_ratio;
numepoch = net.param.numepoch;

[x, t] = data2xt(dataset);

[trainInd, ~, testInd] = ...
    dividerand(size(x,2),train_test_ratio(1), 0, train_test_ratio(2));

close all; clc;
figure('Name', 'Neural Network Training', 'NumberTitle','off', 'Position', [10 10 1300 600]);
h1 = subplot(2,2,1);
h2 = subplot(2,2,3);
h3 = subplot(2,2,[2 4]);

[xgrid, ygrid] = meshgrid(-6:0.1:6);
accuracy = zeros(2, numepoch);
entropy = zeros(2, numepoch);
for ii=1:numepoch
    [net, tr_train] = nn_train_net(net, x(:,trainInd), t(:, trainInd));
    tr_test = nn_test_net(net, x(:,testInd), t(:, testInd));
    grid_clss_prob = nn_test_grid_net(net, [xgrid(:)';ygrid(:)']);
    
    % ploting
    grid_info.xrange = [-6 6];
    grid_info.yrange = [-6 6];
    grid_info.size_mat = size(xgrid);
    grid_info.grid_clss_prob = grid_clss_prob;
    grid_info.numPt_plot = 0.1*size(t,2); 
    
    accuracy(1,ii) = tr_train.acc;
    accuracy(2,ii) = tr_test.acc;
    show_acc(h1, ii, accuracy);
    
    entropy(1,ii) = tr_train.entropy;
    entropy(2,ii) = tr_test.entropy;
    show_entropy(h2, ii, entropy);
    
    show_map(h3, x, t, grid_info);
    pause(0.001);
end
end

function show_acc(cur_ax, epoch, accuracy)

axes(cur_ax);
plot(1:epoch, accuracy(1,1:epoch), '-ob', 'linewidth', 1); hold on;
plot(1:epoch, accuracy(2,1:epoch), '-or', 'linewidth', 1); 

legend('\bf Train','\bf Test', 'Location','southeast')
xlabel('\bf Epoch');
ylabel('\bf Accuracy');ylim([-0.1 1.1]);
set(cur_ax,'fontsize',10,'linewidth',2,'fontweight','bold')
grid on; hold off;

end

function show_entropy(cur_ax, epoch, entropy)

axes(cur_ax);
plot(1:epoch, entropy(1,1:epoch), '-ob', 'linewidth', 1); hold on;
plot(1:epoch, entropy(2,1:epoch), '-or', 'linewidth', 1); 

legend('\bf Train','\bf Test', 'Location','northeast');
xlabel('\bf Epoch');
ylabel('\bf Cross Entropy');
set(cur_ax,'fontsize',10,'linewidth',2,'fontweight','bold')
grid on; hold off;

end

function show_map(cur_ax, x, t, grid_info)

axes(cur_ax);

[M,I] = max(grid_info.grid_clss_prob);
M(I==1) = (1-M(I==1));
prob_value_plot = reshape(M, grid_info.size_mat);

% color gradient
custom_map = tri_color_gradient([1 0.5 0.5],[1 1 1],[0.5 0.5 1],256);

imagesc(grid_info.xrange, grid_info.yrange, prob_value_plot);
hold on; view(0,90); colormap(custom_map);

ind_set1 = find(t(1,:));
ind_set2 = find(t(2,:));

ind_set1 = ind_set1(1:grid_info.numPt_plot);
ind_set2 = ind_set2(1:grid_info.numPt_plot);
plot(x(1,ind_set1), x(2,ind_set1), 'MarkerEdgeColor', 'w', ...
    'MarkerFaceColor', [1 0 0], 'Marker', 'o', ...
    'LineStyle', 'none', 'linewidth', 1); 
plot(x(1,ind_set2), x(2,ind_set2), 'MarkerEdgeColor', 'w', ...
    'MarkerFaceColor', [0 0 1], 'Marker', 'o', ...
    'LineStyle', 'none', 'linewidth', 1); 
set(gca,'fontsize',10,'linewidth',2,'fontweight','bold')
xlabel('\bf X-data');xlim([-6.5 6.5]);
ylabel('\bf Y-data');ylim([-6.2 6.2]);
grid on;  axis('equal'); 
hold off; 

end

function [x, t] = data2xt(dataset)

nSet1 = size(dataset.set1,1);
nSet2 = size(dataset.set2,1);

x = cat(2, dataset.set1', dataset.set2');
t = zeros(2, nSet1+nSet2);

t(1,1:nSet1) = 1;
t(2,nSet1+1:end) = 1;

% shuffling
rind = randperm(nSet1+nSet2);
x = x(:,rind);
t = t(:,rind);
end

function grad=tri_color_gradient(c1,c2,c3,depth)

drgb1 =(c2-c1)/(depth/2-1);
drgb2 =(c3-c2)/(depth/2-1);

grad = zeros(depth, 3);

for ii=1:depth/2
    grad(ii,:) = drgb1*(ii-1) + c1;
    grad(ii+(depth/2),:) = drgb2*(ii-1) + c2;
end
    
end