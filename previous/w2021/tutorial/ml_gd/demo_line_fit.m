%{
Title: Gradient Descent 
Author: Chul Min Yeum
Email: cmyeum@uwaterloo.ca
Last updated: 2020-12-28
%}

clc; clear; close all;

%% Input data
% y = 3x + 1;
in_data = [1 2 3];
out_data = [4.2 6.8 10.1];

%% Plot for the input data
fig1=figure(1); set(fig1,'Position', [100 100 600 300]);

x = 0:0.01:4; y = 3*x+1;
plot(x,y,':b', 'linewidth', 3); hold on; warning off;
legend('true line', 'data'); 
legend('location', 'northwest');
plot(in_data, out_data, 'or', 'linewidth', 3);hold off;
grid on;xlabel('\bf x'); ylabel('\bf y'); hold off;axis tight;grid on;
xlim([0 4]); ylim([1 13]);
set(gca,'fontsize',15,'linewidth',2,'fontweight','bold');

%% Cost function
fig2=figure(2); set(fig2,'Position', [100 100 600 600]);

th1_range = 1:0.1:5;
th2_range = -1:0.1:4;
[th1,th2] = meshgrid(th1_range,th2_range);

J = CompJ(in_data, out_data, th1, th2);

s = surf(th1, th2, J,'FaceAlpha',0.5);
s.EdgeColor = 'none';
xlabel('{\theta}^1'); ylabel('{\theta}^2'); zlabel('\bf J'); 
grid on;hold off;axis tight;grid minor;
xlim([1 5]); ylim([-1 4]);
set(gca,'fontsize',15,'linewidth',2,'fontweight','bold');

%% Cost function: 2D curve given at th1 = 3
fig3= figure(3); set(fig3,'Position', [100 100 600 250]);

ind1 = find(th1_range==3); % we know that a true th1 is 3. 
plot(th2_range,J(:,ind1),'b', 'linewidth', 2); hold on;
grid on;xlabel('{\theta}^2'); ylabel('\bf J'); hold off;axis tight;grid minor;
% xlim([0 4]); ylim([1 13]);
set(gca,'fontsize',12,'linewidth',2,'fontweight','bold');

fig4=figure(4); 
set(fig4,'Position', [100 100 600 250]);

ind2 = find(th2_range==1); % we know that a true th2 is 1. 
plot(th1_range,J(ind2,:),'b', 'linewidth', 2); hold on;
grid on;xlabel('{\theta}^1'); ylabel('\bf J'); hold off;axis tight;grid minor;
% xlim([0 4]); ylim([1 13]);
set(gca,'fontsize',12,'linewidth',2,'fontweight','bold');

fig12=figure(12); set(fig12,'Position', [100 100 600 600]);

th1_range = 1:0.1:5;
th2_range = -1:0.1:4;
[th1,th2] = meshgrid(th1_range,th2_range);

J = CompJ(in_data, out_data, th1, th2);

s = surf(th1, th2, J,'FaceAlpha',0.5);
s.EdgeColor = 'none';
xlabel('{\theta}^1'); ylabel('{\theta}^2'); zlabel('\bf J'); hold on;

% plane at ind1
[tmp2,tmpJ] = meshgrid(th2_range,min(J(:)):0.1:max(J(:)));
s = surf(3*ones(size(tmp2)), tmp2, tmpJ,'FaceAlpha',0.3);
s.FaceColor = 'r';
s.EdgeColor = 'none';

grid on;axis tight;grid minor;
xlim([1 5]); ylim([-1 4]);
set(gca,'fontsize',15,'linewidth',2,'fontweight','bold'); hold off;

%% Cost function: 2D curve given at th2 = 1
fig13=figure(13); set(fig13,'Position', [100 100 600 600]);

th1_range = 1:0.1:5;
th2_range = -1:0.1:4;
[th1,th2] = meshgrid(th1_range,th2_range);

J = CompJ(in_data, out_data, th1, th2);

s = surf(th1, th2, J,'FaceAlpha',0.5);
s.EdgeColor = 'none';
xlabel('{\theta}^1'); ylabel('{\theta}^2'); zlabel('\bf J'); hold on;

% plane at ind1
[tmp1,tmpJ] = meshgrid(th1_range,min(J(:)):0.1:max(J(:)));
s = surf(tmp1, 1*ones(size(tmp1)), tmpJ,'FaceAlpha',0.3);
s.FaceColor = 'r';
s.EdgeColor = 'none';

grid on;axis tight;grid minor;
xlim([1 5]); ylim([-1 4]);
set(gca,'fontsize',15,'linewidth',2,'fontweight','bold'); hold off;

fig14=figure(14); set(fig14,'Position', [100 100 600 600]);

th1_range = 1:0.1:5;
th2_range = -1:0.1:4;
[th1,th2] = meshgrid(th1_range,th2_range);

J = CompJ(in_data, out_data, th1, th2);

s = surf(th1, th2, J,'FaceAlpha',0.5);
s.EdgeColor = 'none';
xlabel('{\theta}^1'); ylabel('{\theta}^2'); zlabel('\bf J'); hold on;

% plane at ind1
[tmp1,tmpJ] = meshgrid(th1_range,min(J(:)):0.1:max(J(:)));
s = surf(tmp1, 1*ones(size(tmp1)), tmpJ,'FaceAlpha',0.3);
s.FaceColor = 'r';
s.EdgeColor = 'none';

[tmp2,tmpJ] = meshgrid(th2_range,min(J(:)):0.1:max(J(:)));
s = surf(3*ones(size(tmp2)), tmp2, tmpJ,'FaceAlpha',0.3);
s.FaceColor = 'r';
s.EdgeColor = 'none';

grid on;axis tight;grid minor;
xlim([1 5]); ylim([-1 4]);
set(gca,'fontsize',15,'linewidth',2,'fontweight','bold'); hold off;


fig15=figure(15); set(fig15,'Position', [100 100 600 600]);

th1_range = 1:0.01:5;
th2_range = -1:0.01:4;
[th1,th2] = meshgrid(th1_range,th2_range);

J = CompJ(in_data, out_data, th1, th2);

s = surf(th1, th2, log(J),'FaceAlpha',0.5);
s.EdgeColor = 'none';
xlabel('{\theta}^1'); ylabel('{\theta}^2'); zlabel('\bf log(J)'); hold on;

grid on;axis tight;grid minor;
xlim([1 5]); ylim([-1 4]);
set(gca,'fontsize',15,'linewidth',2,'fontweight','bold'); hold off;

%% Gradient descent (Changing l_r)
n_iter = 12;
l_r = 0.05;

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

fig6=figure(6); 
set(fig6,'Position', [100 100 600 600]);

s = surf(th1, th2, J,'FaceAlpha',0.5); hold on;
s.EdgeColor = 'none';
grid on;xlabel('{\theta}^1'); ylabel('{\theta}^2'); zlabel('\bf J'); axis tight;grid minor;
xlim([1 5]); ylim([-1 4]);
set(gca,'fontsize',15,'linewidth',2,'fontweight','bold');

Jvec = zeros(n_iter,1);
for ii=1:n_iter
    Jvec(ii) = CompJ(in_data, out_data, t1(ii), t2(ii));
    plot3(t1(1:ii),t2(1:ii), Jvec(1:ii), 'or', 'LineWidth', 3);
    plot3(t1(1:ii),t2(1:ii), Jvec(1:ii), ':b', 'LineWidth', 3);
    
%     pause(2)
end; hold off;

%% Gradient descent (a large learning rate)
n_iter = 12;
l_r = 0.08;

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

fig7=figure(7); 
set(fig7,'Position', [100 100 600 600]);

th1_range = -600:1:600;
th2_range = -300:1:300;
[th1,th2] = meshgrid(th1_range,th2_range);

J = CompJ(in_data, out_data, th1, th2);

s = surf(th1, th2, J,'FaceAlpha',0.5); hold on;
s.EdgeColor = 'none';
grid on;xlabel('{\theta}^1'); ylabel('{\theta}^2'); zlabel('\bf J'); axis tight;grid minor;
% xlim([1 5]); ylim([-1 4]);
set(gca,'fontsize',15,'linewidth',2,'fontweight','bold');

Jvec = zeros(n_iter,1);
for ii=1:n_iter
    Jvec(ii) = CompJ(in_data, out_data, t1(ii), t2(ii));
    plot3(t1(1:ii),t2(1:ii), Jvec(1:ii), 'or', 'LineWidth', 3);
    plot3(t1(1:ii),t2(1:ii), Jvec(1:ii), ':b', 'LineWidth', 3);
    
    pause(2)
end; hold off;

%% cost function
function J = CompJ(in_data, out_data, th1, th2)

J = zeros(size(th1));
n_data = numel(in_data);
for ii=1:n_data
    J = J + (out_data(ii) - in_data(ii)*th1-th2).^2;
end

end
