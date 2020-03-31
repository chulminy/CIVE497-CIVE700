g1 = @(x) exp(x);
g2 = @(x) exp(-x);
g3 = @(x) log(x);
g4 = @(x) 1./(1+exp(-x));



fig1 = figure(1);
set(fig1,'Position', [100 100 1300 700]);

xrange = -5:0.01:1;
subplot(221); plot(xrange, g1(xrange), 'b', 'linewidth', 3); 
grid on;xlabel('\bf x'); ylabel('\bf y'); hold off;axis tight;grid on;
set(gca,'fontsize',15,'linewidth',2,'fontweight','bold');

xrange = -1:0.01:5;
subplot(222); plot(xrange, g2(xrange), 'b', 'linewidth', 3); 
grid on;xlabel('\bf x'); ylabel('\bf y'); hold off;axis tight;grid on;
set(gca,'fontsize',15,'linewidth',2,'fontweight','bold');

xrange = -3:0.01:3;
subplot(223); plot(xrange, g3(xrange), 'b', 'linewidth', 3); 
grid on;xlabel('\bf x'); ylabel('\bf y'); hold off;axis tight;grid on;
set(gca,'fontsize',15,'linewidth',2,'fontweight','bold');

xrange = -3:0.01:3;
subplot(224); plot(xrange, g4(xrange), 'b', 'linewidth', 3); 
grid on;xlabel('\bf x'); ylabel('\bf y'); hold off;axis tight;grid on;
set(gca,'fontsize',15,'linewidth',2,'fontweight','bold');
