clc; 
clearvars;


% to = 0.1;
%  to = 0.9;
to = 0.01;

fc = 250;
fs = 1250;
ts = 1/fs;

t = [-to:ts:to];
m = sinc(100*t);

figure(1)

plot(t,m); xlabel("Time"); ylabel("m(t)");
title('t0 = 0.01');

c = cos(2*pi*fc*t);
u = m.*c; %DSB-AM Modulated Signal
N = 1024; %FFT bin size, after Zero Padding
M = fft(m,1024);
M = M/fs; %scaling
U = fft(u,1024);
U = U/fs; %scaling
fn = [0:1/N:1-1/N]*fs - fs/2;

figure(2)
subplot(2,1,1), plot(fn,abs(fftshift(M))); xlabel("Frequency"); ylabel("Amplitude"); title('Spectra of Message Signal')
subplot(2,1,2), plot(fn,abs(fftshift(U))); xlabel("Frequency"); ylabel("Amplitude"); title("Spectra of Modulated Signal")