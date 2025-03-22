clc;
clearvars;
close all;
Fs = 100e3;
dt = 1/Fs; %GENERATING THE RECTANGULAR PULSE TRAIN
T = 1e-3; %PERIOD OF THE PULSE TRAIN
D = .1; %DUTY CYCLE
PW = D*T; %PULSE WIDTH
f = 1/T; %ANALOG FREOUENCY
t = -T/2: dt: T/2; %TIME INTERVAL FOR A PERIOD
n = t/dt; %INDEX FOR DATA POINTS IN A PERIOD
L = PW/dt; %DATA POINTS IN THE THE HIGH TIME
x = zeros (1,length(t)) ; %INITIALIZING A SINGLE RECTANGULAR PULSE
x (find (abs (n)<=L/2))=1.1; %GENERATION OF A SINGLE RECTANGULAR PULSE
%END OF RECTANGULAR PULSE TRAIN
N = length(x);
Nc = N; %TOTAL NO OF COEFFICIENTS
if mod(Nc, 2) ==0
    k=-Nc/2:Nc/2-1;
else
    k=- (Nc-1) /2: (Nc-1)/2;
end
c=zeros (1,length(k)) ;%INITIALIZING FOURIER COEFFICIENTS
for i=1:length(x)
    for j=1:length(k)
        c(j)=c(j)+1/N*x(i)*exp(-1i*2*pi*k(j)*n(i)/N);
    end
end
figure(2)
subplot(212)
stem(k,abs(c), '.k', 'linewidth', 2) ;
xlabel('k','fontsize', 14)
ylabel('|c_k|', 'fontsize', 14)
title('Fourier series coefficients c_k', 'fontsize', 14);
subplot(211)
stem(n, x, '.k', 'linewidth', 2) ; xlabel('Index, n', 'fontsize', 14), ylabel (' x(n)', 'fontsize',14)