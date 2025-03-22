clc;
clearvars;
close all;
%fs=4*BW
to = .1;
ts = .0025;
fs = 1/ts;
nup = round(to/ts);
nlo = -nup; % generate time index
n = nlo:nup;
t = n*ts;
m = (sinc(100*t)).^2;
N = 1024;% FFT bin size ,after zero padding
fn = [0:1/N:5-1/N]*fs - 5*fs/2;
k = 0:5*N-1;
WN = exp(-1i*2*pi/N);
nk = n'*k;
W = WN.^nk;
M = m*W;
M = fft(m,1024);

figure(1)
subplot(2,1,1)
plot(fn,abs(fftshift(M)),0,0,"LineWidth",2)
title("fs = 4BW")
fs = 2*BW;
ts = 0.005;
fs = 1/ts;
nup = round(to/ts);
nlo = -nup;% generate time index
n = nlo:nup;
t = n*ts;
m = (sinc(100*t)).^2;
N = 1024;% FFT bin size ,after zero padding
fn = [0:1/N:5-1/N]*fs-5*fs/2;
k = 0:5*N-1;
WN = exp(-1i*2*pi/N);
nk = n'*k;
W = WN.^nk;
M = m*W;
%M=fft(m,1024);
subplot(212)
plot(fn,abs(fftshift(M)),0,0,"LineWidth",2)
title("fs = 2BW")
% fs=1.25*BW
ts = .008;
fs = 1/ts;
nup = round(to/ts);
nlo = -nup;% generate time index
n = nlo:nup;
t = n*ts;
m = (sinc(100*t)).^2;
N = 1024;% FFT bin size ,after zero padding
fn = [0:1/N:5-1/N]*fs-5*fs/2;
k = 0:5*N-1;
WN = exp(-1i*2*pi/N);
nk = n'*k;
W = WN.^nk;
M = m*W;
%M=fft(m,1024);
figure(2)
subplot(211)
plot(fn,abs(fftshift(M)),0,0,"LineWidth",2)
title("fs = 1.25BW")
% fs=BW
ts = .01;
fs = 1/ts;
nup = round(to/ts);
nlo = -nup;% generate time index
n = nlo:nup;
t = n*ts;
m = (sinc(100*t)).^2;
N = 1024;% FFT bin size ,after zero padding
fn = [0:1/N:5-1/N]*fs-5*fs/2;
k = 0:5*N-1;
WN = exp(-1i*2*pi/N);
nk = n'*k;
W = WN.^nk;
M = m*W;
%M=fft(m,1024);
subplot(212)
plot(fn,abs(fftshift(M)),0,0,"LineWidth",2); ylim([0 1.5])
title("fs = BW")