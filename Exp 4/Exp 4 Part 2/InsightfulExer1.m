clc;
clearvars;

N = 1000;
noise = randn(1,N);

subplot(3,1,1)
plot(noise); title("White Noise");

[rw,lag] = xcorr(noise);
subplot(3,1,2)
plot(lag,rw); title("Auto Corr of White Noise"); xlabel('Lags')

noise1 = fft(rw);
noise2 = conj(noise1);
W = noise1.*noise2;
PSD = 10*log10(W/N);
subplot(3,1,3)
plot(PSD); title("Power Spectral Density of White Noise")