clear; clc ; close all;


A1 = 1;
A2 = 1;
A3 = 1;

f1 = 25;
f2 = 45;
f3 = 75;

y = @(t) A1*cos(2*pi*f1*t)+A2*cos(2*pi*f2*t)+A3*cos(2*pi*f3*t);

% (c) and (d)
fs = 110; dt = 1/fs; t = -3:dt:3-dt;

xn = y(t);

% use of a 'fft' function
nfft = numel(xn);
Xk = fft(xn, nfft);

f = 1/(nfft*dt) * (0:nfft/2-1);

fig1 = figure(1); set(fig1,'Position', [100 100 500 300]);
plot(f,1/fs*abs(Xk(1:(nfft/2))),':r', 'linewidth', 2);hold off;
legend('Xk(f)'); axis tight;grid on;
axis tight;grid on;
ylabel('\bf Amplitude'); 
xlabel('\bf f');
set(gca,'fontsize',15,'linewidth',2,'fontweight','bold');

% (f)
fs = 120; dt = 1/fs; t = -20:dt:20-dt;

xn = y(t);

% use of a 'fft' function
nfft = numel(xn);
Xk = fft(xn, nfft);

f = 1/(nfft*dt) * (0:nfft/2-1);

fig2 = figure(2); set(fig2,'Position', [100 100 500 300]);
plot(f,1/fs*abs(Xk(1:(nfft/2))),':r', 'linewidth', 2);hold off;
legend('Xk(f)'); axis tight;grid on;
axis tight;grid on;
ylabel('\bf Amplitude'); 
xlabel('\bf f');
set(gca,'fontsize',15,'linewidth',2,'fontweight','bold');

% (g)
fs = 151; dt = 1/fs; t = -20:dt:20-dt;

xn = y(t);

% use of a 'fft' function
nfft = numel(xn);
Xk = fft(xn, nfft);

f = 1/(nfft*dt) * (0:nfft/2-1);

fig3 = figure(3); set(fig3,'Position', [100 100 500 300]);
plot(f,1/fs*abs(Xk(1:(nfft/2))),':r', 'linewidth', 2);hold off;
legend('Xk(f)'); axis tight;grid on;
axis tight;grid on;
ylabel('\bf Amplitude'); 
xlabel('\bf f');
set(gca,'fontsize',15,'linewidth',2,'fontweight','bold');