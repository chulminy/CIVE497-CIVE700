clear; close all; clc;


fig1 = figure(1);
h = fspecial('log', 31,4);
subplot(121);surf(h); axis tight; colormap(jet)
xlabel('X-axis'); ylabel('Y-axis');
zlabel('Amplitude')
subplot(122); surf(h); view(0,90);
xlabel('X-axis'); ylabel('Y-axis'); axis tight
set(fig1,'Position', [100 100 800 300]);

%%
fig4 = figure(2);

sig = zeros(1,400);
sig(150:250) = 1;

subplot(711); plot(1:numel(sig), sig, 'linewidth', 1.5); axis tight;
ylabel('\bf f(x)','Interpreter', 'latex'); xlim([0 numel(sig)]);
hYLabel = get(gca,'YLabel');grid on;
set(hYLabel,'rotation',0,'VerticalAlignment','middle', 'HorizontalAlignment','right')

windSize = 51;
h = -gausswin(windSize,3);
subplot(712); plot(1:numel(h), h, 'linewidth', 1.5); axis tight;
ylabel('\bf h(x)','Interpreter', 'latex'); xlim([0 numel(sig)])
hYLabel = get(gca,'YLabel');grid on;
set(hYLabel,'rotation',0,'VerticalAlignment','middle', 'HorizontalAlignment','right')

fh = conv(sig,h,'valid');
subplot(713); plot(windSize/2:numel(fh)+windSize/2-1, fh, 'linewidth', 1.5); axis tight;
ylabel('\bf f * h','Interpreter', 'latex'); xlim([0 numel(sig)])
hYLabel = get(gca,'YLabel');grid on;
set(hYLabel,'rotation',0,'VerticalAlignment','middle', 'HorizontalAlignment','right')

h = -gausswin(windSize,3);
diff_h = diff(h);
subplot(714); plot(1:numel(diff_h), diff_h, 'linewidth', 1.5); axis tight;
ylabel('\bf h''(x)','Interpreter', 'latex'); xlim([0 numel(sig)])
hYLabel = get(gca,'YLabel');grid on;
set(hYLabel,'rotation',0,'VerticalAlignment','middle', 'HorizontalAlignment','right')

fh = conv(sig,diff_h,'valid');
subplot(715); plot(windSize/2:numel(fh)+windSize/2-1, fh, 'linewidth', 1.5); axis tight;
ylabel('\bf f * h''','Interpreter', 'latex'); xlim([0 numel(sig)])
hYLabel = get(gca,'YLabel');grid on;
set(hYLabel,'rotation',0,'VerticalAlignment','middle', 'HorizontalAlignment','right')

diff_h2 = diff(diff(h));
subplot(716); plot(1:numel(diff_h2), diff_h2, 'linewidth', 1.5); axis tight;
ylabel('\bf h''''(x)','Interpreter', 'latex'); xlim([0 numel(sig)])
hYLabel = get(gca,'YLabel');grid on;
set(hYLabel,'rotation',0,'VerticalAlignment','middle', 'HorizontalAlignment','right')

fh2 = conv(sig,diff_h2,'valid');
subplot(717); plot(windSize/2:numel(fh2)+windSize/2-1, fh2, 'linewidth', 1.5); axis tight;
ylabel('\bf f * h'''' ','Interpreter', 'latex'); xlim([0 numel(sig)])
hYLabel = get(gca,'YLabel');grid on;
set(hYLabel,'rotation',0,'VerticalAlignment','middle', 'HorizontalAlignment','right')
set(fig4,'Position', [100 100 900 800]);

%%
fig4 = figure(3);

sig = zeros(1,400);
sig(180:220) = 1;

subplot(711); plot(1:numel(sig), sig, 'linewidth', 1.5); axis tight;
ylabel('\bf f(x)','Interpreter', 'latex'); xlim([0 numel(sig)]);
hYLabel = get(gca,'YLabel');grid on;
set(hYLabel,'rotation',0,'VerticalAlignment','middle', 'HorizontalAlignment','right')

windSize = 51;
h = -gausswin(windSize,3);
subplot(712); plot(1:numel(h), h, 'linewidth', 1.5); axis tight;
ylabel('\bf h(x)','Interpreter', 'latex'); xlim([0 numel(sig)])
hYLabel = get(gca,'YLabel');grid on;
set(hYLabel,'rotation',0,'VerticalAlignment','middle', 'HorizontalAlignment','right')

fh = conv(sig,h,'valid');
subplot(713); plot(windSize/2:numel(fh)+windSize/2-1, fh, 'linewidth', 1.5); axis tight;
ylabel('\bf f * h','Interpreter', 'latex'); xlim([0 numel(sig)])
hYLabel = get(gca,'YLabel');grid on;
set(hYLabel,'rotation',0,'VerticalAlignment','middle', 'HorizontalAlignment','right')

h = -gausswin(windSize,3);
diff_h = diff(h);
subplot(714); plot(1:numel(diff_h), diff_h, 'linewidth', 1.5); axis tight;
ylabel('\bf h''(x)','Interpreter', 'latex'); xlim([0 numel(sig)])
hYLabel = get(gca,'YLabel');grid on;
set(hYLabel,'rotation',0,'VerticalAlignment','middle', 'HorizontalAlignment','right')

fh = conv(sig,diff_h,'valid');
subplot(715); plot(windSize/2:numel(fh)+windSize/2-1, fh, 'linewidth', 1.5); axis tight;
ylabel('\bf f * h''','Interpreter', 'latex'); xlim([0 numel(sig)])
hYLabel = get(gca,'YLabel');grid on;
set(hYLabel,'rotation',0,'VerticalAlignment','middle', 'HorizontalAlignment','right')

diff_h2 = diff(diff(h));
subplot(716); plot(1:numel(diff_h2), diff_h2, 'linewidth', 1.5); axis tight;
ylabel('\bf h''''(x)','Interpreter', 'latex'); xlim([0 numel(sig)])
hYLabel = get(gca,'YLabel');grid on;
set(hYLabel,'rotation',0,'VerticalAlignment','middle', 'HorizontalAlignment','right')

fh2 = conv(sig,diff_h2,'valid');
subplot(717); plot(windSize/2:numel(fh2)+windSize/2-1, fh2, 'linewidth', 1.5); axis tight;
ylabel('\bf f * h'''' ','Interpreter', 'latex'); xlim([0 numel(sig)])
hYLabel = get(gca,'YLabel');grid on;
set(hYLabel,'rotation',0,'VerticalAlignment','middle', 'HorizontalAlignment','right')
set(fig4,'Position', [100 100 900 800]);

%%
fig4 = figure(4);

sig = zeros(1,400);
sig(188:212) = 1;

subplot(711); plot(1:numel(sig), sig, 'linewidth', 1.5); axis tight;
ylabel('\bf f(x)','Interpreter', 'latex'); xlim([0 numel(sig)]);
hYLabel = get(gca,'YLabel');grid on;
set(hYLabel,'rotation',0,'VerticalAlignment','middle', 'HorizontalAlignment','right')

windSize = 51;
h = -gausswin(windSize,3);
subplot(712); plot(1:numel(h), h, 'linewidth', 1.5); axis tight;
ylabel('\bf h(x)','Interpreter', 'latex'); xlim([0 numel(sig)])
hYLabel = get(gca,'YLabel');grid on;
set(hYLabel,'rotation',0,'VerticalAlignment','middle', 'HorizontalAlignment','right')

fh = conv(sig,h,'valid');
subplot(713); plot(windSize/2:numel(fh)+windSize/2-1, fh, 'linewidth', 1.5); axis tight;
ylabel('\bf f * h','Interpreter', 'latex'); xlim([0 numel(sig)])
hYLabel = get(gca,'YLabel');grid on;
set(hYLabel,'rotation',0,'VerticalAlignment','middle', 'HorizontalAlignment','right')

h = -gausswin(windSize,3);
diff_h = diff(h);
subplot(714); plot(1:numel(diff_h), diff_h, 'linewidth', 1.5); axis tight;
ylabel('\bf h''(x)','Interpreter', 'latex'); xlim([0 numel(sig)])
hYLabel = get(gca,'YLabel');grid on;
set(hYLabel,'rotation',0,'VerticalAlignment','middle', 'HorizontalAlignment','right')

fh = conv(sig,diff_h,'valid');
subplot(715); plot(windSize/2:numel(fh)+windSize/2-1, fh, 'linewidth', 1.5); axis tight;
ylabel('\bf f * h''','Interpreter', 'latex'); xlim([0 numel(sig)])
hYLabel = get(gca,'YLabel');grid on;
set(hYLabel,'rotation',0,'VerticalAlignment','middle', 'HorizontalAlignment','right')

diff_h2 = diff(diff(h));
subplot(716); plot(1:numel(diff_h2), diff_h2, 'linewidth', 1.5); axis tight;
ylabel('\bf h''''(x)','Interpreter', 'latex'); xlim([0 numel(sig)])
hYLabel = get(gca,'YLabel');grid on;
set(hYLabel,'rotation',0,'VerticalAlignment','middle', 'HorizontalAlignment','right')

fh2 = conv(sig,diff_h2,'valid');
subplot(717); plot(windSize/2:numel(fh2)+windSize/2-1, fh2, 'linewidth', 1.5); axis tight;
ylabel('\bf f * h'''' ','Interpreter', 'latex'); xlim([0 numel(sig)])
hYLabel = get(gca,'YLabel');grid on;
set(hYLabel,'rotation',0,'VerticalAlignment','middle', 'HorizontalAlignment','right')
set(fig4,'Position', [100 100 900 800]);