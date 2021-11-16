clc; clear; close all;

%% Input data
% y = 3x + 1;
in_data = [1 2 3];
out_data = [4.2 6.8 10.1];

th1_range = 1:0.01:5;
th2_range = -1:0.01:4;
[th1,th2] = meshgrid(th1_range,th2_range);

J = CompJ(in_data, out_data, th1, th2);

%% Stochastic Gradient descent 
n_iter = 12;
l_r = 0.01;

J1 = @(t1, t2) -2*sum((out_data-t1*in_data-t2).*in_data);
J2 = @(t1, t2) -2*sum((out_data-t1*in_data-t2));

t1 = zeros(n_iter,1);
t2 = zeros(n_iter,1);
t1(1) = 1;
t2(1) = 0;
for ii=1:n_iter-1
    t1(ii+1) = t1(ii) - l_r*J1(t1(ii), t2(ii));
    t2(ii+1) = t2(ii) - l_r*J2(t1(ii), t2(ii));
end

n_data = 3;

J1st = @(t1, t2, out, in) -2*(out-t1*in-t2).*in;
J2st = @(t1, t2, out, in) -2*(out-t1*in-t2);

t1st = zeros(n_iter*n_data,1);
t2st = zeros(n_iter*n_data,1);
t1st(1) = 1;
t2st(1) = 0;
count = 1;
for ii=1:n_iter-1
    for jj=1:n_data
        t1st(count+1) = t1st(count) - l_r*J1st(t1st(count), t2st(count), out_data(jj), in_data(jj));
        t2st(count+1) = t2st(count) - l_r*J2st(t1st(count), t2st(count), out_data(jj), in_data(jj));
        count = count + 1;
    end
end

fig1=figure(1); 
set(fig1,'Position', [100 100 1200 600]);
fig1a = subplot(121);
s = surf(th1, th2, J,'FaceAlpha',0.5); hold on;
s.EdgeColor = 'none';
grid on;xlabel('{\theta}^1'); ylabel('{\theta}^2'); zlabel('\bf J'); axis tight;grid minor;
xlim([1 5]); ylim([-1 4]);
set(gca,'fontsize',15,'linewidth',2,'fontweight','bold');

fig1b = subplot(122); 
copyobj(s,fig1b); view(2)
grid on;xlabel('{\theta}^1'); ylabel('{\theta}^2'); zlabel('\bf J'); axis tight;grid minor;
xlim([1 3.2]); ylim([-1 1.5]);
set(gca,'fontsize',15,'linewidth',2,'fontweight','bold');

% pause(3);
Jvec = zeros(n_iter,1);
Jvecst = zeros(count-1,1);
count = 1;
for ii=1:n_iter
    Jvec(ii) = CompJ(in_data, out_data, t1(ii), t2(ii));
    p1= plot3(fig1a,t1(1:ii),t2(1:ii), Jvec(1:ii), '*g', 'LineWidth', 3);
    p2= plot3(fig1a,t1(1:ii),t2(1:ii), Jvec(1:ii), ':m', 'LineWidth', 2);
    for jj=1:n_data
        Jvecst(count) = CompJ(in_data, out_data, t1st(count), t2st(count));
        p3 = plot3(fig1a,t1st(1:count),t2st(1:count), Jvecst(1:count), 'or', 'LineWidth', 3);
        p4 = plot3(fig1a,t1st(1:count),t2st(1:count), Jvecst(1:count), ':b', 'LineWidth', 2);
        
        copyobj([p1 p2 p3 p4],fig1b);
        
        count = count + 1;
        pause(2)
    end
end; hold off;




%% cost function
function J = CompJ(in_data, out_data, th1, th2)

J = zeros(size(th1));
n_data = numel(in_data);
for ii=1:n_data
    J = J + (out_data(ii) - in_data(ii)*th1-th2).^2;
end

end
