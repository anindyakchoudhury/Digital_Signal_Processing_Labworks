clc;
clearvars;
close all;
n = 1:51;
x1 = rand (1, 51);
x2 = sin(2*pi*1000*n/10000);
x = x1+x2;
len = length(x);

X1 = fft([ x zeros(1, len - 1)]);
X1_conjugate = conj (X1);

Rx = fftshift(ifft(X1.*X1_conjugate)); %calculation in Freq. Domain
rx = xcorr(x); %calculation in time domain


subplot(3,1,1);
plot(Rx); title("ACF Calculation in Freq Domain");
subplot(3,1,2); 
plot(rx); title("ACF Calculation in Time Domain");
subplot(3,1,3);
stem((X1.*X1_conjugate)/51); title("PSD of x(n)")