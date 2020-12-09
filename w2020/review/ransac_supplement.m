% line equation y = mx + b;
m = 2;
b = 4;

npt = 100;

% x-axis range
xrange = [-10 10];
x = rand(npt,1)*(xrange(2)-xrange(1))+xrange(1);

y_true = m*x+b;
y = y_true + (rand([npt 1])*2-1);

sx = sum(x);
sx2 = sum(x.*x);
sy = sum(y);
sxy = sum(x.*y);

mb = inv([sx npt; sx2 sx])*[sy;sxy];

figure(1)
plot(x, y, 'ob', 'linewidth', 2); hold on;
line(xrange,m*xrange + b, 'Color', 'g', 'linewidth',  2, 'LineStyle', '--');
line(xrange,mb(1)*xrange + mb(2), 'Color', 'r', 'linewidth',  2, 'LineStyle', '--');
legend({'data','true',strcat('y=',sprintf('%3.3f',mb(1)),'x+',sprintf('%3.3f',mb(2)))},'location','northwest')
axis tight;grid on; hold off
title('\bf Line Fitting');
xlabel('\bf X-axis');xlim(xrange);
ylabel('\bf Y-axis');
set(gca,'FontSize',12,'linewidth',2,'fontweight','bold')


sx = sum(x);
sx2 = sum(x.*x);
sx3 = sum(x.^3);
sx4 = sum(x.^4);

sy = sum(y);
sxy = sum(x.*y);
sx2y = sum(x.^2.*y);

abc = inv([npt sx sx2; sx sx2 sx3; sx2 sx3 sx4])*[sy;sxy;sx2y];

figure(2)
plot(x, y, 'ob', 'linewidth', 2); hold on;
line(xrange,m*xrange + b, 'Color', 'g', 'linewidth',  2, 'LineStyle', '--');
line(xrange,abc(1)+ abc(2)*xrange + abc(3)*xrange.*xrange, 'Color', 'r', 'linewidth',  2, 'LineStyle', '--');
legend({'data','true',strcat('y=',sprintf('%3.3f',abc(1)),' +' ,sprintf('%3.3f',abc(2)), 'x + ',sprintf('%3.3f',abc(3)), 'x*x')},'location','northwest')
axis tight;grid on; hold off
title('\bf Line Fitting');
xlabel('\bf X-axis');xlim(xrange);
ylabel('\bf Y-axis');
set(gca,'FontSize',12,'linewidth',2,'fontweight','bold')