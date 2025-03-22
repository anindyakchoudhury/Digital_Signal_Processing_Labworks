clc;
clearvars;
close all;

f = 100;
T = 1/f;
Fs = 2000;
dt = 1/Fs;

t = -.02:dt:0.02;
n = t/dt;
x = zeros(1, length(t));

for i = 1: length(t)
    if t(i)>= -.005 && t(i)<=0.005
    x(i) = sin(2*pi*f*t(i));
    end
end

M = 301;
w = linspace(-pi,pi,M);
dw = w(2)-w(1);
X = zeros(1,M);

for b = 1:length(x) 
    for a = 1:M
        X(a) = X(a) + x(b) * exp(-1i* w(a)*n(b));
    end
end


n_re = -100:100;
x_re = zeros(1, length(n_re));

for ii = 1:M
    for jj = 1:length(n_re)
        x_re(jj) = x_re(jj) + (1/(2*pi))*X(ii)*exp(1i*w(ii)*n_re(jj))*dw;
    end
end



subplot(511)
plot(t,x)
subplot(512)
stem(n,x)
subplot(513)
plot(w, abs(X));
subplot(514)
plot(w, angle(X)*180/pi);
subplot(515)
stem(n_re, x_re);

