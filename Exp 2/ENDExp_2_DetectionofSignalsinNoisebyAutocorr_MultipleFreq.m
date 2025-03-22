clc;
clearvars;

T = 100;
t = 0:3*T;
x1 = 10*chirp(0:299,0.01,t(end), 0.1);
%be careful with chirp thing
%understand the value thing
x = [ x1 zeros(1,1000)];

echo = [zeros(1,500) 0.05.*x1 zeros(1,500)];



noise = randn(1, length(echo));
noise_add_sig = echo + noise;

[Rxr lag] = xcorr(noise_add_sig, x);
Rxr = normalize(Rxr);
%multifreq burst is better single freq burst
subplot(4,1,1)
plot(x);
subplot(4,1,2)
plot(echo)
subplot(4,1,3)
plot(noise_add_sig)
subplot(4,1,4)
plot(lag, Rxr)