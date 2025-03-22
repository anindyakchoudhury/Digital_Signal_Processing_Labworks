%CALCULATION OF FOURIER SERIES COEFFICIENTS
clc;
clearvars;
close all;

Fs = 2400;
dt = 1/Fs;
%GENERATING THE SIGNAL
T = 0.0067; %PERIOD OF THE PULSE TRAIN (Minimum Freq in this signal is 150 Hz)
D = .1; %DUTY CYCLE
PW = D*T; %PULSE WIDTH
f = 1/T; %ANALOG FREQUENCY
t = 0:dt:T; %TIME INTERVAL FOR A PERIOD
n = t/dt; %INDEX FOR DATA POINTS IN A PERIOD
L = PW/dt; %DATA POINTS IN THE THE HIGH TIME
x = 4*sin(300*pi*t) - 3*cos(600*pi*t) + cos(1200*pi*t);
N = length(x); %TOTAL NO DATA POINTS IN A PERIOD
Nc = 5*N;
if mod(Nc,2)==0
    k=-Nc/2:Nc/2-1;
else
    k=-(Nc-1)/2:(Nc-1)/2;
end
c = zeros(1,length(k));%INITIALIZING FOURIER COEFFICIENTS
for i1=1:length(k)
    for i2=1:length(x)
        c(i1)=c(i1)+1/N*x(i2)*exp(-1i*2*pi*k(i1)*n(i2)/N);
    end
end

subplot(2,1,1)
stem(k,abs(c), '.k', 'linewidth', 2); xlabel('k', 'fontsize', 14); ylabel('|c_k|','fontsize', 14);
title('Fourier Series Coefficients c_k', 'fontsize', 14);

subplot(2,1,2)
stem(k,angle(c)*180/pi, '.k', 'linewidth', 2); xlabel('k', 'fontsize', 14); ylabel('Angle(c_k)','fontsize', 14)