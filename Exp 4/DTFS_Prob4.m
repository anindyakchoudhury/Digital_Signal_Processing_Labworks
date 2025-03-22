clc;
clearvars;
close all;
Fs = 100e3;
dt = 1/Fs;
% GENERATING THE RECTANGULAR PULSE TRAIN
T = 1e-3; %PERIOD OF THE PULSE TRAIN
D = 0.1; %DUTY CYCLE
PW = D*T; %PULSE WIDTH
f = 1/T; %ANALOG FREQUENCY
t = -T:dt:T; %TIME INTERVAL FOR A PERIOD
n = t/dt;   %INDEX FOR DATA POINTS IN A PERIOD
L = PW/dt;  %DATA POINTS IN THE THE HIGH TIME
x = zeros(1,length(t));   %INITIALIZING A SINGLE RECTANGULAR PULSE
x(abs(n)<=L/2) = 1.1;     %GENERATION OF A SINGLE RECTANGULAR PULSE
% Fourier Coefficients Calculation
N = length(x);     %TOTAL NO DATA POINTS IN A PERIOD
Nc = N;
if mod(Nc,2) == 0
    k = -Nc/2:Nc/2-1;
else
    k = -(Nc-1)/2:(Nc-1)/2;
end
c = zeros(1,length(k));   %INITIALIZING FOURIER COEFFICIENTS
for idx1 = 1:length(k)
    for idx2 = 1:length(x)
        c(idx1) = c(idx1) + 1/N*x(idx2)*exp(-1i*2*pi*k(idx1)*n(idx2)/N);
    end
end
psd = c.*conj(c);   %PSD of rectangular pulse

subplot(3,1,1)
stem(n,x,'.',"LineWidth",2); xlabel("n"); ylabel("x(n)"); title("Rectangular Pulse")

subplot(3,1,2)
stem(k,abs(c),'.',"LineWidth",2); xlabel("k"); ylabel("|ck|"); title("Fourier Series Coefficients")

subplot(3,1,3)
stem(k,psd,'.',"LineWidth",2); xlabel("k"); ylabel("|ck|^2"); title("Power Spectral Density of Rectangular Pulse")