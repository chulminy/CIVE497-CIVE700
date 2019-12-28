rng(40); %fixed random number order

num_pt = 100;

% line equation y = mx + b;
m = 2;
b = 4;

% x-axis range
xrange = [-10 10];
x = rand(num_pt,1)*(xrange(2)-xrange(1))+xrange(1);

y_true = m*x+b;
x_meas = x; 
y_meas = y_true + (rand([num_pt 1])*2-1);

yrange = m*xrange+b;
x_out = rand(num_pt*0.5,1)*(xrange(2)-xrange(1))+xrange(1);
y_out = rand(num_pt*0.5,1)*(yrange(2)-yrange(1))+yrange(1);

num_pt_new = num_pt + numel(x_out);
Xmat = [[x_meas;x_out] ones(num_pt_new,1)];
Ymat = [y_meas;y_out];
fparam = pinv(Xmat)*Ymat;

x_data = [x_meas;x_out];
y_data = [y_meas;y_out];

% plots for slides
rng(100); 
pt_idx = randperm(num_pt_new,2);
x_sub = x_data(pt_idx);
y_sub = y_data(pt_idx);

mh = diff(y_sub)/diff(x_sub);
bh = det([y_sub x_sub])/diff(x_sub);
dist_pt = mh*x_data+bh-y_data;

figure(11)
plot(x_meas, y_meas, 'ob', 'linewidth', 1.5);hold on;
plot(x_out, y_out, 'oc', 'linewidth', 1.5);hold on;
legend({'data','outlier'},'location','northwest','FontSize',10)
axis tight;grid on; hold off
xlabel('\bf X-axis');xlim(xrange);
ylabel('\bf Y-axis');ylim(yrange);
set(gca,'FontSize',10,'linewidth',2,'fontweight','bold')

figure(12)
plot(x_data, y_data, 'ob', 'linewidth', 1.5);hold on;
plot(x_sub, y_sub, 'or', 'linewidth', 3);
line(xrange,mh*xrange + bh, 'Color', 'g', 'linewidth',  2, 'LineStyle', '--');

Xpt = [x_data'; x_data'];
Ypt = [y_data'; (mh*x_data+bh)'];
line(Xpt,Ypt, 'Color', 'm', 'linewidth',  1, 'LineStyle', '--');

plot(x_out, y_out, 'oc', 'linewidth', 1.5);hold on;

legend({'data','selected','hyposis line','distance'},'location','northwest','FontSize',10)

axis tight;grid on; hold off
xlabel('\bf X-axis');xlim(xrange);
ylabel('\bf Y-axis');ylim(yrange);
set(gca,'FontSize',10,'linewidth',2,'fontweight','bold');

% 
dist_threshold = 1;
valid_pt = abs(dist_pt)<dist_threshold;

figure(13);
plot(x_sub, y_sub, 'or', 'linewidth', 3); hold on
line(xrange,mh*xrange + bh, 'Color', 'g', 'linewidth',  2, 'LineStyle', '--');

vald_pt_data = valid_pt;
vald_pt_data(1+num_pt:end)=0;

vald_pt_out = valid_pt;
vald_pt_out(1:num_pt)=0;

plot(x_data(vald_pt_data), y_data(vald_pt_data), 'ob', 'linewidth', 1.5);
plot(x_data(vald_pt_out), y_data(vald_pt_out), 'oc', 'linewidth', 1.5);

plot(x_sub, y_sub, 'or', 'linewidth', 3); % redraw points
legend({'selected','hyposis line','valid points from data','valid points from outliers'},'location','northwest','FontSize',10)
title(strcat(sprintf('Number of inliers from data and outliers: %d and %d',sum(valid_pt(1:num_pt)),sum(valid_pt(num_pt+1:end)))));
axis tight;grid on; hold off
xlabel('\bf X-axis');xlim(xrange);
ylabel('\bf Y-axis');ylim(yrange);
set(gca,'FontSize',10,'linewidth',2,'fontweight','bold');

dist_threshold = 4;
valid_pt = abs(dist_pt)<dist_threshold;

figure(14);
plot(x_sub, y_sub, 'or', 'linewidth', 3); hold on
line(xrange,mh*xrange + bh, 'Color', 'g', 'linewidth',  2, 'LineStyle', '--');

vald_pt_data = valid_pt;
vald_pt_data(1+num_pt:end)=0;

vald_pt_out = valid_pt;
vald_pt_out(1:num_pt)=0;

plot(x_data(vald_pt_data), y_data(vald_pt_data), 'ob', 'linewidth', 1.5);
plot(x_data(vald_pt_out), y_data(vald_pt_out), 'oc', 'linewidth', 1.5);

plot(x_sub, y_sub, 'or', 'linewidth', 3); % redraw points
legend({'selected','hyposis line','valid points from data','valid points from outliers'},'location','northwest','FontSize',10)
title(strcat(sprintf('Number of inliers from data and outliers: %d and %d',sum(valid_pt(1:num_pt)),sum(valid_pt(num_pt+1:end)))));
axis tight;grid on; hold off
xlabel('\bf X-axis');xlim(xrange);
ylabel('\bf Y-axis');ylim(yrange);
set(gca,'FontSize',10,'linewidth',2,'fontweight','bold');

dist_threshold = 10;
valid_pt = abs(dist_pt)<dist_threshold;

figure(15);
plot(x_sub, y_sub, 'or', 'linewidth', 3); hold on
line(xrange,mh*xrange + bh, 'Color', 'g', 'linewidth',  2, 'LineStyle', '--');

vald_pt_data = valid_pt;
vald_pt_data(1+num_pt:end)=0;

vald_pt_out = valid_pt;
vald_pt_out(1:num_pt)=0;

plot(x_data(vald_pt_data), y_data(vald_pt_data), 'ob', 'linewidth', 1.5);
plot(x_data(vald_pt_out), y_data(vald_pt_out), 'oc', 'linewidth', 1.5);

plot(x_sub, y_sub, 'or', 'linewidth', 3); % redraw points
legend({'selected','hyposis line','valid points from data','valid points from outliers'},'location','northwest','FontSize',10)
title(strcat(sprintf('Number of inliers from data and outliers: %d and %d',sum(valid_pt(1:num_pt)),sum(valid_pt(num_pt+1:end)))));
axis tight;grid on; hold off
xlabel('\bf X-axis');xlim(xrange);
ylabel('\bf Y-axis');ylim(yrange);
set(gca,'FontSize',10,'linewidth',2,'fontweight','bold');
