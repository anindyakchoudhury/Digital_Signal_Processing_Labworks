clc;
clearvars;

%Exercise D1 B

T = 2*10^(-3);
tstep = T/100;
t = tstep:tstep:5*T;

x = 2* sin(2*pi*t/T)

[rx,lag] = xcorr(x);
subplot(2,1,1)
stem(t,x)
subplot(2,1,2)
stem(lag, rx)