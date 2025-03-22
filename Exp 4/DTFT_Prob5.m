clc;
clearvars;
close all;
f = 100;
Fs = 2000;
dt = 1/Fs;
t=-0.02:dt:0.02;
n = t/dt;
x = zeros(1,length(n));
for i = 1:length(t)
    if  ((t(i) >= -0.005) && (t(i) <= 0.005))
        x(i) = sin(2*pi*f*t(i));
    end
end

figure(1)
subplot(2,1,1)
plot(t,x,"LineWidth",2); xlabel("t"); ylabel("x(t)")
title("Given Continuous Time Signal")

subplot(2,1,2)
stem(n,x,"Linewidth",2); xlabel("n"); ylabel("x(n)")
title("Sampled Signal (Fs= 2000)")

M = 301;
w = linspace(-pi,pi,M);
dw = w(2) - w(1);
x_r = zeros(1,M);
for i = 1:length(x)
    for b = 1:M
        x_r(b) = x_r(b) + x(i)*exp(-1i*w(b)*n(i));
    end
end

figure(2)
subplot(2,1,1)
plot(w*Fs,abs(x_r),"LineWidth",2); xlabel("Angular Frequency"); ylabel("X(w)");
title("Frequency Spectra")

subplot(2,1,2)
plot(w*Fs,angle(x_r)*180/pi,"LineWidth",2); xlabel("Angular Frequency"); ylabel("X(w)");
title("Phase Spectra")