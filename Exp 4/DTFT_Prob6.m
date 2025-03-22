clc;
clearvars;
close all;
%Rectangular Pulse
Fs = 5000; %sampling freq
dt = 1/Fs;
T = 0.01;
f = 1/T;
t = -0.02:dt:0.02;
n = t/dt;
N = length(t);
D = 0.5; %Duty Cycle
PW = D*T; 
L = PW/dt;
x = zeros(1,N);
x(abs(n) <= L/2) = 1.1;
M = 201;
w = linspace(-pi,pi,M);
dw = w(2)- w(1);
X = zeros(1,M);
for i = 1:length(x)
    for j = 1:M
        X(j) = X(j) + x(i)*exp(-1i*w(j)*n(i));
    end
end

%Sinc funtion
Fs2 = 5000;
dt2 = 1/Fs2;
T2 = 0.01;
f2 = 100;
t2 = -0.02:dt2:0.02;
n2 = t2/dt2;
N2 = length(t);
x2 = sinc(2*f2*t2); 
M2 = 201;
w2 = linspace(-pi,pi,M2);
dw2 = w2(2)- w2(1);
X2 = zeros(1,M2);
for i = 1:length(x)
    for j = 1:M2
        X2(j) = X2(j) + x2(i)*exp(-1i*w2(j)*n2(i));
    end
end

%Plots 
figure(1)
subplot(2,1,1)
plot(n,x,"LineWidth",2); xlabel("n"); ylabel("x(n)")
title("Rectangular Pulse")

subplot(2,1,2)
plot(w,X,"LineWidth",2); xlabel("Angular Frequency"); ylabel("X(w)")
title("Frequency Spectra")

figure(2)
subplot(2,1,1)
plot(n2,x2,"LineWidth",2); xlabel("n"); ylabel("x(n)");
title("Sinc Signal")

subplot(2,1,2)
plot(w2,abs(X2),"LineWidth",2); xlabel("Angular Frequency"); ylabel("X(w)")
title("Frequency Spectra")
