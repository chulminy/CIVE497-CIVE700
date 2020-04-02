% Simple neural network demonstration
% This code shows how to implement a neural network with one hidden layer. 
% You can change some basic parameters including
% learning rate, number of neurons, number of epoch, etc. You can also see
% similar demo from here: 
% https://github.com/tensorflow/playground
% optimization: Stochastic gradient descent

% Dataset: XOR (Two-class Classification)

% Author: Chul Min Yeum (cmyeum@uwaterloo.ca)
% Last update: 04/01/2020
clear; close all; clc;

addpath('base');

dataset = GenerateXorData;
net = set_nn; % you need to configure your network depending your dataset
test_nn(net, dataset);

function data = GenerateXorData
range = [-6 6];
numPt = 1000;

data.set1 = zeros(numPt,2);
data.set1(:,1) = (range(2)-range(1))*rand([numPt,1]) + range(1);
data.set1(:,2) = (range(2)-range(1))*rand([numPt,1]) + range(1);
data.set1(:,2) = sign(data.set1(:,1)).* abs(data.set1(:,2));

data.set2 = zeros(numPt,2);
data.set2(:,1) = (range(2)-range(1))*rand([numPt,1]) + range(1);
data.set2(:,2) = (range(2)-range(1))*rand([numPt,1]) + range(1);
data.set2(:,2) = -sign(data.set2(:,1)).* abs(data.set2(:,2));
end

function net = set_nn
net.param.numepoch = 50; % number of epoch
net.param.learningrate = 0.03; % learning rate

net.param.train_test_ratio = [0.85 0.15]; % training and testing division

net.input.node = 2;
net.layer.node = 15;
net.output.node = 2;

net.layer.activation = 'sigmoid';
net.output.activation = 'softmax';
net.output.loss = 'cross_entropy';

% layer: hidden layer (input to hidden)
net.layer.weight = rand(net.input.node, net.layer.node)-1; % set random value between -1 ~ 1
net.layer.bias = zeros(net.layer.node, 1); % set bias as zero

% output: output layer (hidden to output)
net.output.weight = rand(net.layer.node, net.output.node)-1; % -1 ~ 1
net.output.bias = zeros(net.output.node, 1);

end

function test_nn(net, dataset)

train_test_ratio = net.param.train_test_ratio;
numepoch = net.param.numepoch;  % # of iteration

[x, t] = data2xt(dataset); % data transformation

% training and testing split
[trainInd, ~, testInd] = ...
    dividerand(size(x,2),train_test_ratio(1), 0, train_test_ratio(2));

close all; clc;
figure('Name', 'Neural Network Training', 'NumberTitle','off', 'Position', [10 10 1300 600]);
h1 = subplot(2,2,1);
h2 = subplot(2,2,3);
h3 = subplot(2,2,[2 4]);

[xgrid, ygrid] = meshgrid(-6:0.1:6);
loss = zeros(2, numepoch);
accuracy = zeros(1, numepoch);

for ii=1:numepoch
    
    % training
    [net, train_loss] = nn_train_net(net, x(:,trainInd), t(:, trainInd));
    
    % testing
    out = nn_test_net(net, x(:,testInd)); 
    
    % plotting loss curve
    loss(1, ii) = train_loss;
    
    test_loss = mean(nn_loss(out,t(:, testInd), net.output.loss, 'forward'));     
    loss(2, ii) = test_loss; % testing loss
    
    show_loss(h2, ii, loss);
    
    % plotting accuracy curve (check if the data is classified correctly)
    [~,out_clss] = max(out, [], 1); % predicted class
    [~,true_clss] = max(t(:, testInd), [], 1); % true class
    n_test = numel(out_clss);
    n_test_correct = sum(out_clss == true_clss);
    
    accuracy(ii) = n_test_correct/n_test;
    show_acc(h1, ii, accuracy);
    
    % ploting
    % visualization (testing grid coordinates)
    out_grid = nn_test_net(net, [xgrid(:)';ygrid(:)']);
    
    grid_info.xrange = [-6 6];
    grid_info.yrange = [-6 6];
    grid_info.size_mat = size(xgrid);
    grid_info.grid_clss_prob = out_grid;
    grid_info.numPt_plot = 0.1*size(t,2); 
    
    show_map(h3, x, t, grid_info);
    pause(0.001);
end
end

function show_acc(cur_ax, epoch, accuracy)

axes(cur_ax);
plot(1:epoch, accuracy(1,1:epoch), '-ob', 'linewidth', 1); hold on;

legend('\bf Test', 'Location','southeast')
xlabel('\bf Epoch');
ylabel('\bf Accuracy');ylim([-0.1 1.1]);
set(cur_ax,'fontsize',10,'linewidth',2,'fontweight','bold')
grid on; hold off;

end

function show_loss(cur_ax, epoch, loss)

axes(cur_ax);
plot(1:epoch, loss(1,1:epoch), '-ob', 'linewidth', 1); hold on;
plot(1:epoch, loss(2,1:epoch), '-or', 'linewidth', 1); 

legend('\bf Train','\bf Test', 'Location','northeast');
xlabel('\bf Epoch');
ylabel('\bf Loss');
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