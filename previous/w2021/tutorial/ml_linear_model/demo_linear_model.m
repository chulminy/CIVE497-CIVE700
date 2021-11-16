%{
Title: Linear Model & Regularization
Author: Chul Min Yeum
Email: cmyeum@uwaterloo.ca
Last updated: 2020-12-28
%}

clc; clear; close all;
%% Data generation

rng(180);

% y = 10*(x-0.1)(x-0.5)(x-1);
xin = rand(10,1);
yin = 10*(xin-0.1).*(xin-0.5).*(xin-1) + (rand(10,1)-0.5)*0.3; % add noise

fig1=figure(1); set(fig1,'Position', [100 100 800 600]);

x_graph = -1:0.01:2;
y_graph = 10*(x_graph-0.1).*(x_graph-0.5).*(x_graph-1);
plot(x_graph,y_graph,'g', 'linewidth', 2); hold on; warning off;
plot(xin, yin, 'ob', 'linewidth', 3);hold off;
legend('True line', 'data'); 
legend('location', 'northwest');
grid on;xlabel('\bf x'); ylabel('\bf y'); hold off;axis tight;grid on;
xlim([-0.3 1.3]); ylim([-1 1]);
set(gca,'fontsize',15,'linewidth',2,'fontweight','bold');

%% Gradient Descent of a polynomial model & Regularization

n_iter = 50000;
l_r = 0.05;
lambda = 0.001;
order = 6;

params = zeros(order+1,n_iter);
% cost_all = zeros(1, n_iter);

params(:,1) = 2*(rand(order+1,1)-0.5);
% cost_all(1) = Cost_J(params(:,1), xin, yin, lambda);
for ii=1:n_iter-1
    dJ = Cost_dJ(params(:,ii), xin, yin, lambda);
    params(:,ii+1) = params(:,ii) - l_r*dJ;
%     cost_all(ii+1) = Cost_J(params(:,ii+1), xin, yin, lambda);
end

x_test = -1.3:0.01:2.3;

fig2=figure(2);
set(fig2,'Position', [100 100 800 600]);
x_graph = -1.3:0.01:2.3;
y_graph = 10*(x_graph-0.1).*(x_graph-0.5).*(x_graph-1);

plot(x_graph,y_graph,'g', 'linewidth', 3); hold on; warning off;
plot(xin, yin, 'ob', 'linewidth', 3);

y_test = CompPoly(params(:,end), x_test');
plot(x_test,y_test,':m', 'linewidth', 3); hold off; warning off;

legend('True line', 'data', 'Best fitted line'); 
legend('location', 'northwest');
grid on;xlabel('\bf x'); ylabel('\bf y'); hold off;axis tight;grid on;
xlim([-1.3 2.3]); ylim([-5 5]);
set(gca,'fontsize',15,'linewidth',2,'fontweight','bold');


function y = CompPoly(pa, x)
n = numel(pa)-1; % nth order polynomial
powx = x.^(0:n); % matrix having x power of n to 0 
y = powx*pa;
end

function J = Cost_J(pa, x, y, lambda)
n = numel(pa)-1; % nth order polynomial
powx = x.^(0:n); % matrix having x power of n to 0 
J = sum((powx*pa-y).^2) + lambda*pa'*pa;
end

function dJ = Cost_dJ(pa, x, y, lambda)
n = numel(pa)-1; % nth order polynomial
dJ = zeros(n+1,1); % partial dervivative of the cost function
powx = x.^(0:n); % matrix having x power of n to 0 

for ii=1:n+1
    dJ(ii) = 2*sum((powx*pa - y).*powx(:,ii)) + pa(ii)*lambda;
end
end
