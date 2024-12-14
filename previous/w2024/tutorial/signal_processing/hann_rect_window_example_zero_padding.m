function [sig, hann, rectw, fs] = hann_rect_window_example_zero_padding(T,Tz)

f1 = 10; f2=20; f3=21; 

fs=60; % sampling frequency
t = 0: 1/fs : T-1/fs;
x = 2*sin(2*pi*f1*t) + 2 * sin(2*pi*f2*t) + 2 * sin(2*pi*f3*t);

t = 0: 1/fs : (T+Tz)-1/fs ;

x = [x zeros(1,ceil(Tz*fs))];

sig.x = x;
sig.t = t;

N = length(x);
nfft = 4096;

whan = hanning(N);
xhann = x.*whan';
X = fft(xhann);
f = fs*(0:N-1)/N;

Xz = fft(xhann, nfft);
Nz = length(Xz);
fz = fs*(0:Nz-1)/Nz;

hann.X = X;
hann.f = f;
hann.N = N;
hann.Xz = Xz;
hann.fz = fz;
hann.Nz = Nz;

wrect = rectwin(N);
xrect = x.*wrect';
X = fft(xrect);
f = fs*(0:N-1)/N;

Xz = fft(xrect, nfft);
Nz = length(Xz);
fz = fs*(0:Nz-1)/Nz;

rectw.X = X;
rectw.f = f;
rectw.N = N;
rectw.Xz = Xz;
rectw.fz = fz;
rectw.Nz = Nz;
