% Simple neural network demonstration
% This code shows how to implement a neural network with one hidden layer. 
% You can change some basic parameters including
% learning rate, number of neurons, number of epoch, etc. You can also see
% similar demo from here: 
% https://github.com/tensorflow/playground
% optimization: Stochastic gradient descent

% Dataset: Wine quality dataset
% https://archive.ics.uci.edu/ml/datasets/wine+quality
% The dataset can be downloaded from the following link (winequality-red.csv)
% https://archive.ics.uci.edu/ml/machine-learning-databases/wine-quality/
% Kaggle: https://www.kaggle.com/meepbobeep/intro-to-regression-and-classification-in-r#Regression-Approaches-to-Quality-Score

% Author: Chul Min Yeum (cmyeum@uwaterloo.ca)
% Last update: 04/01/2020
clear; close all; clc;

addpath('base');

dataset = ReadWineData('data/winequality-red.csv');
net = set_nn; % you need to configure your network depending your dataset
test_nn(net, dataset);

function data = ReadWineData(file)
fid = fopen(file);
data_cell = textscan(fid,'%f %f %f %f %f %f %f %f %f %f %f %f', 1600, 'Delimiter',';','HeaderLines', 1);
data = cell2mat(data_cell);
end

function net = set_nn
net.param.numepoch = 100; % number of epoch
net.param.learningrate = 0.005; % learning rate

net.param.train_test_ratio = [0.7 0.3]; % training and testing division

net.input.node = 11;
net.layer.node = 20;
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

[x, t] = data2xt_red_wine(dataset); % data transformation

% training and testing split
[trainInd, ~, testInd] = ...
    dividerand(size(x,2),train_test_ratio(1), 0, train_test_ratio(2));

close all; clc;
figure('Name', 'Neural Network Training', 'NumberTitle','off', 'Position', [10 10 1300 450]);
h1 = subplot(1,2,1);
h2 = subplot(1,2,2);

loss = zeros(2, numepoch);
rmse = zeros(2, numepoch);
for ii=1:numepoch
    
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
    
end
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
legend('\bf Train', 'Test', 'Location','northeast')
xlabel('\bf Epoch');
ylabel('\bf RMSE');
set(cur_ax,'fontsize',10,'linewidth',2,'fontweight','bold')
grid on; hold off;

end

function [x, t] = data2xt_red_wine(dataset)

n_data = size(dataset,1);

out = dataset(:,end);
in = dataset(:,1:end-1);

% normalize each column 
x = normalize(in, 1);
t = out'-5; % subtract 5 because it ranges from -5 to 5

% shuffling
rind = randperm(n_data);
x = x(rind,:)';
t = t(:,rind);
end
