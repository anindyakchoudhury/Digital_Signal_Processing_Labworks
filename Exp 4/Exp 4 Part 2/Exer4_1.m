clc; 
clearvars;

N = 64;
ts = 125*10^(-6);

f1 = 1062.5;
f2 = 1625;
fs = 1/ts;
t = (0:N-1)/fs;
x = sin(2*pi*f1*t)+0.05*sin(2*pi*f2*t);
f = (0:N-1)/(N*ts)-fs/2;

figure(1)
subplot(2,1,1)
plot(t,x); title("Data Sequence x(t) vs Time")
subplot(2,1,2)
stem(f/fs,abs(fftshift(fft(x)))); title("Magnitude Spectrum |X(w)| vs Frequency")

h=hann(64);
nx=x.*h';

figure(2)
subplot(2,1,1) 
plot(t,nx); title("Data Sequence nx(t) vs Time")
subplot(2,1,2) 
stem(f/fs,abs(fftshift(fft(nx)))); title("Magnitude Spectrum |NX(w)| vs Frequency")