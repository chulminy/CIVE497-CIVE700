clear; close all; clc;
%% Generate data
% please do not change this section
% true model: y = 0.5 + 0.7x + 0.1x^2 
x = (-6:0.01:-1);
sig_org = 0.5 + 0.7*x + 0.1*x.^2;
sig_err = normrnd(0, 0.03, 1, numel(x));
sig_data = sig_org + sig_err;

figure(1); plot(x, sig_data, 'ob', 'linewidth', 3); 
grid on;xlabel('\bf x'); ylabel('\bf y'); hold off;axis tight;grid on;
% xlim([-0.1 1.1]); ylim([-1.5 1.5])
set(gca,'fontsize',15,'linewidth',2,'fontweight','bold');

%% Fit data using gradient descent

% M=3
n_iter = 10000;
lr = 0.000001; % learning rate
w = normrnd(0, 0.3, 3, 1);

cost_vec = zeros(1,n_iter);
w_vec = zeros(numel(w), n_iter);
w_vec(:,1) = w;
for ii=1:n_iter
    w = w_vec(:,ii);
    cost = CompE(x, sig_data, w);
    dE = CompdE(x, sig_data, w);
    
    cost_vec(1, ii) = cost;
    w_vec(:,ii+1) = UpdateGD(dE, w, lr);
end

figure(2); plot(1:n_iter, log(cost_vec), 'r', 'linewidth', 3); 
grid on;xlabel('\bf iteration'); ylabel('\bf Cost'); hold off;axis tight;grid on;
% xlim([-0.1 1.1]*2*pi); ylim([-1.5 1.5])
set(gca,'fontsize',15,'linewidth',2,'fontweight','bold');


w_end = w_vec(:,end);

M = numel(w); 
x_poly = x.^([0:M-1]');
sig_data_est = sum(w_end.*x_poly);

figure(3); plot(x, sig_data, 'ob', 'linewidth', 3); hold on;
plot(x, sig_data_est, 'r', 'linewidth', 3); 
grid on;xlabel('\bf x'); ylabel('\bf y'); hold off;axis tight;grid on;
% xlim([-0.1 1.1]); ylim([-1.5 1.5])
set(gca,'fontsize',15,'linewidth',2,'fontweight','bold');


function cost = CompE(x, y, w)
M = numel(w);
x_poly = x.^([0:M-1]');
y_est = sum(w.*x_poly);
cost = 1/2*1/numel(x)*sum((y_est-y).^2);
end


function dE = CompdE(x, y, w)
M = numel(w);
x_poly = x.^([0:M-1]');
y_est = sum(w.*x_poly);
dE = sum((y_est-y).*x_poly,2);
end

function w_new = UpdateGD(dE, w, lr)

w_new = w - lr*dE;

end
