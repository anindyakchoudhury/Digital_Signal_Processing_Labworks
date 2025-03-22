clc;
clearvars;
close all;

DFT_PTS = 512;
wp = 1.8;
wc = 2.0;
ws = 2.2;
dp = 0.05;
ds = 0.005;
f = [wp ws];
ripple = [dp ds];
m = [1 0];

[N, fo, mo, wo] = remezord(f, m, ripple, 2*pi);
h = remez(N, fo, mo, wo);
n = 0 : N;
fn = linspace(-pi, pi, DFT_PTS);
H = fftshift(fft(h, DFT_PTS));

figure(1)
subplot(311)
plot(fn, abs(H))
title('DFT of filter')
subplot(312)
plot(fn(105 : 409), abs(H(105 : 409)));
title('Passband')
subplot(313)
plot(fn(435 : end), abs(H(435 : end)));
title('Stopband')
figure(2)
plot(fn, 2*db(abs(H)))
title('Magnitude Response (in dB)');