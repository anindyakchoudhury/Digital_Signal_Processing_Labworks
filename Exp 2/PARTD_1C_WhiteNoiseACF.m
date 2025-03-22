clc;
clearvars;

%Exercise D1 c

%observe ACF of a random white noise

white_noise = randn(1, 500);
[rxx lag] = xcorr(white_noise);
rxx = rxx/max(rxx); %always normalise the value of corr for better comparison
subplot(2,1,1);
stem(white_noise);
subplot(2,1,2);
stem(lag, rxx);
fig= gcf
WinOnTop(fig, true);