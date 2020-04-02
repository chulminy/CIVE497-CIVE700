% Simple neural network demonstration
% This code shows how to implement a neural network with one hidden layer. 
% You can change some basic parameters including
% learning rate, number of neurons, number of epoch, etc. You can also see
% similar demo from here: 
% https://github.com/tensorflow/playground
% optimization: Stochastic gradient descent

% https://archive.ics.uci.edu/ml/machine-learning-databases/car/

% Author: Chul Min Yeum (cmyeum@uwaterloo.ca)
% Last update: 04/01/2020
clear; close all; clc;

addpath('base');

dataset = ReadCarData('data/car.data');
net = set_nn; % you need to configure your network depending your dataset
test_nn(net, dataset);

function data = ReadCarData(file)

n_data = 1728;

fid = fopen(file);
data_cell = textscan(fid,'%s %s %s %s %s %s %s', n_data, 'Delimiter',',');
fclose(fid);

data = zeros(n_data, 7);
for ii=1:7
    [c,ia,ic] = unique(data_cell{ii}); % text to scalar
    data(:,ii) = ic;
end

%{
buying: vhigh, high, med, low.
maint: vhigh, high, med, low.
doors: 2, 3, 4, 5more.
persons: 2, 4, more.
lug_boot: small, med, big.
safety: low, med, high.

class: unacc, acc, good, vgood
%}
end

function net = set_nn
net.param.numepoch = 300; % number of epoch
net.param.learningrate = 0.1; % learning rate
net.learning_rate_scheduling = 0.9;

net.param.train_test_ratio = [0.7 0.3]; % training and testing division

net.input.node = 6;
net.layer.node = 12;
net.output.node = 4;

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

[x, t] = data2xt_car(dataset); % data transformation

% training and testing split
[trainInd, ~, testInd] = ...
    dividerand(size(x,2),train_test_ratio(1), 0, train_test_ratio(2));

close all; clc;
figure('Name', 'Neural Network Training', 'NumberTitle','off', 'Position', [10 10 1300 450]);
h1 = subplot(1,2,1);
h2 = subplot(1,2,2);

loss = zeros(2, numepoch);
accuracy = zeros(2, numepoch);

for ii=1:numepoch
    
    % learning rate scheduling
    if ~mod(ii,10)
        net.param.learningrate = net.param.learningrate * net.learning_rate_scheduling;
    end
    
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
    accuracy(2, ii) = n_test_correct/n_test;
    
    out_train = nn_test_net(net, x(:,trainInd)); 
    [~,out_train_clss] = max(out_train, [], 1); % predicted class
    [~,true_train_clss] = max(t(:, trainInd), [], 1); % true class
    n_train = numel(out_train_clss);
    n_train_correct = sum(out_train_clss == true_train_clss);
    accuracy(1, ii) = n_train_correct/n_train;

    show_acc(h1, ii, accuracy);
end
end

function show_acc(cur_ax, epoch, accuracy)

axes(cur_ax);
plot(1:epoch, accuracy(1,1:epoch), '-ob', 'linewidth', 1); hold on;
plot(1:epoch, accuracy(2,1:epoch), '-or', 'linewidth', 1); 
legend('\bf Train', 'Test', 'Location','southeast')
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

function [x, t] = data2xt_car(dataset)

% 4-class
n_data = size(dataset,1);

out = dataset(:,end);
x = dataset(:,1:end-1);

% normalize each column 
t = zeros(4, n_data);
 
for ii=1:n_data
    t(out(ii),ii) = 1;
end

% shuffling
rind = randperm(n_data);
x = x(rind,:)';
t = t(:,rind);
end
