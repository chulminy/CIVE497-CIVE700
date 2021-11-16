% Simple neural network demonstration
% This code shows how to implement a neural network with one hidden layer. 
% You can change some basic parameters including
% learning rate, number of neurons, number of epoch, etc. You can also see
% similar demo from here: 
% https://github.com/tensorflow/playground
% optimization: Stochastic gradient descent

% Dataset: Polynomial dataset (Task 7)
% CM: I added learning rate scheduling to fine-tune the curve. 

% True curve
%{
% Fourth degree polynomial: y = ax^4 + bx^3 + cx^2 + dx + e
a = 1;
b = -0.6;
c = -9;
d = 1.8;
e =  12.5235;

% The data is generated when x is within -3.5 to 4
%}
  
% Author: Chul Min Yeum (cmyeum@uwaterloo.ca)
% Last update: 04/01/2020
clear; close all; clc;

addpath('base');

dataset = ReadPolyData('data/prob3_polynomial.mat');
net = set_nn; % you need to configure your network depending your dataset
test_nn(net, dataset);

function data = ReadPolyData(file)
data = load(file);
end

function net = set_nn
net.param.numepoch = 150; % number of epoch
net.param.learningrate = 0.005; % learning rate
net.learning_rate_scheduling = 0.9;

net.param.train_test_ratio = [0.7 0.3]; % training and testing division

net.input.node = 1;
net.layer.node = 15;
net.output.node = 1;

net.layer.activation = 'sigmoid';
net.output.activation = 'linear';
net.output.loss = 'l2_loss';

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

[x, t] = data2xt_poly(dataset); % data transformation

% training and testing split
[trainInd, ~, testInd] = ...
    dividerand(size(x,2),train_test_ratio(1), 0, train_test_ratio(2));

close all; clc;
figure('Name', 'Neural Network Training', 'NumberTitle','off', 'Position', [10 10 1300 600]);
h1 = subplot(2,2,1);
h2 = subplot(2,2,3);
h3 = subplot(2,2,[2 4]);

xrange = -3.5:0.01:4;
y  = @(xx) 1*xx.^4 + -0.6 * xx.^3 + -9*xx.^2 + 1.8*xx + 12.5235;
y_true = y(xrange);

loss = zeros(2, numepoch);
rmse = zeros(2, numepoch);
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
    show_log_loss(h1, ii, loss);
    
    % plotting RMSE (root mean square error)accuracy 
    rmse_test = sqrt(mean((t(:, testInd)-out).^2));
    rmse(2, ii) = rmse_test;
    
    out_train = nn_test_net(net, x(:,trainInd)); 
    rmse_train = sqrt(mean((t(:, trainInd)-out_train).^2));
    rmse(1, ii) = rmse_train;
        
    show_rmse(h2, ii, rmse);
    
    % plotting: visualization
    out_graph = nn_test_net(net, xrange);
    
    axes(h3);
    plot(x(:,trainInd), t(:,trainInd), 'og', 'linewidth', 1); hold on;
    plot(x(:,testInd), t(:,testInd), 'om', 'linewidth', 1);
    plot(xrange, y_true, ':b', 'linewidth', 2);
    plot(xrange, out_graph, '-r', 'linewidth', 2); 
    legend('training data', 'testing data','\bf True curve','\bf Estimate curve',  'Location','northeast');
    xlabel('\bf Epoch');
    ylabel('\bf Log loss');
    set(h3,'fontsize',10,'linewidth',2,'fontweight','bold')
    grid on; hold off;
    
end
end

function show_log_loss(cur_ax, epoch, loss)

axes(cur_ax);
plot(1:epoch, log(loss(1,1:epoch)), '-ob', 'linewidth', 1); hold on;
plot(1:epoch, log(loss(2,1:epoch)), '-or', 'linewidth', 1); 

legend('\bf Train','\bf Test', 'Location','northeast');
xlabel('\bf Epoch');
ylabel('\bf Log loss');
set(cur_ax,'fontsize',10,'linewidth',2,'fontweight','bold')
grid on; hold off;

end

function show_rmse(cur_ax, epoch, accuracy)

axes(cur_ax);
plot(1:epoch, accuracy(1,1:epoch), '-ob', 'linewidth', 1); hold on;
plot(1:epoch, accuracy(2,1:epoch), '-or', 'linewidth', 1); 
legend('\bf Train', 'Test', 'Location','southeast')
xlabel('\bf Epoch');
ylabel('\bf RMSE');
set(cur_ax,'fontsize',10,'linewidth',2,'fontweight','bold')
grid on; hold off;

end

function [x, t] = data2xt_poly(dataset)

t = dataset.y;
x = dataset.x;

n_data = numel(t);

% shuffling
rind = randperm(n_data);
x = x(rind);
t = t(rind);
end
