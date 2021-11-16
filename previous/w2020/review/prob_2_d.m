clear; clc ; close all;

syms t   

f = 2;
y = sin(2*pi*f*t);

% this signal is assumed to be analog (very high sampling rate). 
ncyle = 100;
Fsa = 100; % # of samples per a second
ta = 0:1/Fsa:ncyle;
ya = subs(y, t, ta);

fig1 = figure(1);
set(fig1,'Position', [100 100 1100 700]);

subplot(221); plot(ta,ya,'-b', 'linewidth', 2);hold on;
legend('Analog'); axis tight;grid on;
ylabel('\bf Amplitude'); ylim([-1.3 1.3]);
xlabel('\bf Time (sec)');
set(gca,'fontsize',15,'linewidth',2,'fontweight','bold');

fs = 4.2; % # of samples per a second
td = 0:1/fs:ncyle;
yd = subs(y, t, td);
dt = 1/fs;

nfft = numel(yd)*4; % there is no zero-padding. 
f = (0:nfft/2-1)*1/(nfft*dt);

% use of a 'fft' function
X_fft = fft(double(yd), nfft);

subplot(222); plot(ta,ya,':b', 'linewidth', 1); hold on;
plot(td,yd,'or','linewidth',2); hold off;
legend('Analog', 'digital'); axis tight;grid on;
ylabel('\bf Amplitude'); ylim([-1.3 1.3]);
xlabel('\bf Time (sec)'); 
set(gca,'fontsize',15,'linewidth',2,'fontweight','bold')

subplot(223); plot(td,yd,'-r','linewidth',2); 
legend('digital'); axis tight;grid on;
ylabel('\bf Amplitude'); ylim([-1.3 1.3]);
xlabel('\bf Time (sec)');
set(gca,'fontsize',15,'linewidth',2,'fontweight','bold')

subplot(224); plot(f,abs(X_fft(1:nfft/2)),'-r','linewidth',2); 
legend('digital-fft'); axis tight;grid on;
ylabel('\bf Amplitude'); xlim([1.8 2.1])
xlabel('\bf Frequency (Hz)');
set(gca,'fontsize',15,'linewidth',2,'fontweight','bold')

