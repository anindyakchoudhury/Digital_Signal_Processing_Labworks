clc;
close all;
clearvars;

f1 = 800;
f2 = 1600;
f3 = 2000;

fs = 16000;
ts = 1/fs;
ftest = gcd(gcd(gcd(f1,f2),gcd(f1,f3)),fs);

N = fs/ftest;
N = 1*N;
t = (0: N-1)*ts;
fn = (0:N-1)* (fs/N) - fs/2;

x = sin(2*pi*f1*t) + 0.75* sin(2*pi*f2*t) + 0.5* sin(2*pi*f3*t);
subplot(211)
stem(t,x)
subplot(212)
stem(fn, abs(fftshift(fft(x))));