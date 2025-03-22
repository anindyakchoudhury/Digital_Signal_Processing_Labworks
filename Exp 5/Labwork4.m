clc;
clearvars;
close all;

del1 = 0.05;
del2 = 0.005;
del = min(del1, del2);
A = -20*log10(del);
ws = 2.2;
wp = 1.8;
wc = 2;
M = ceil(1 + (A - 8)/(2.285*(ws - wp)));
if A > 50
    beta = 0.1102*(A-8.7);
elseif A >= 21 && A <= 50
    beta = 0.5842*(A - 21)^0.4 + 0.07886*(A - 21);
else
    beta = 0;
end

w = (kaiser(M, beta))'; %notice the apostrophe here
n = 0:M - 1;
alpha = (M - 1)/2;
hd = sinc(wc*(n - alpha)/pi)*wc/pi; %this is the LPF
h =hd .* w; %this is the impulse response

subplot(411), stem(n, h); title("Impulse Response");
Nfft = 1024;
y = abs(fftshift(fft(h, Nfft)));
subplot(412),
plot(linspace(-pi, pi, Nfft), y); title("Magnitude Response")
subplot(413)
plot(y(700:805)); title("Passband Ripple") %passband ripple is found from pass band peak and trough difference
subplot(414)
plot(y(870:920)); title("Stopband Ripple") %stopband ripple is found from stop band peak and trough difference maybe
