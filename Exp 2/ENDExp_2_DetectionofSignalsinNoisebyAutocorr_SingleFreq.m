clc;
clearvars;

T = 100;
t = 0:3*T;
x1 = 10*sin(2*pi*t/T);
x = [ x1 zeros(1,1000)];

echo = [zeros(1,500) 0.06.*x1 zeros(1,500)];



noise = randn(1, length(echo));
noise_add_sig = echo + noise;

[Rxr lag] = xcorr(noise_add_sig, x);
Rxr = normalize(Rxr);

subplot(4,1,1)
plot(x);
subplot(4,1,2)
plot(echo)
subplot(4,1,3)
plot(noise_add_sig)
subplot(4,1,4)
plot(lag, Rxr)
