x = -10:0.01:10;

y_identy = x; % Identity
y_bin_step = 0*(x<0) + (x>0); % Binary step
y_logistic = 1./(1+exp(-x));
y_tanh = 2./(1+exp(-2*x)) - 1;
y_relu = 0*(x<0) + x.*(x>0);
alpha = 0.1;
y_prelu = alpha*x.*(x<0) + x.*(x>0);


fig1 = figure(1);
set(fig1,'Position', [100 100 700 700]);

subplot(321);plot(x, y_identy, 'r', 'linewidth', 2);
axis tight;grid on; hold off
xlabel('\bf X');ylabel('\bf Y');
set(gca,'FontSize',9,'linewidth',2,'fontweight','bold')
legend('Identity','location','northwest','FontSize',10); legend('boxoff')

subplot(322);plot(x, y_bin_step, 'b', 'linewidth', 2);
axis tight;grid on; hold off
xlabel('\bf X');ylabel('\bf Y');
set(gca,'FontSize',9,'linewidth',2,'fontweight','bold')
legend('Binary step','location','northwest','FontSize',10); legend('boxoff')

subplot(323);plot(x, y_logistic, 'm', 'linewidth', 2);
axis tight;grid on; hold off
xlabel('\bf X');ylabel('\bf Y');
set(gca,'FontSize',9,'linewidth',2,'fontweight','bold')
legend('Logistic','location','northwest','FontSize',10); legend('boxoff')

subplot(324);plot(x, y_tanh, 'k', 'linewidth', 2);
axis tight;grid on; hold off
xlabel('\bf X');ylabel('\bf Y');
set(gca,'FontSize',9,'linewidth',2,'fontweight','bold')
legend('Tanh','location','northwest','FontSize',10); legend('boxoff')

subplot(325);plot(x, y_relu, 'c', 'linewidth', 2);
axis tight;grid on; hold off
xlabel('\bf X');ylabel('\bf Y');
set(gca,'FontSize',9,'linewidth',2,'fontweight','bold')
legend('ReLu','location','northwest','FontSize',10); legend('boxoff')

subplot(326);plot(x, y_prelu, 'g', 'linewidth', 2); 
axis tight;grid on; hold off
xlabel('\bf X');ylabel('\bf Y');
set(gca,'FontSize',9,'linewidth',2,'fontweight','bold')
legend('PReLu','location','northwest','FontSize',10); legend('boxoff')

