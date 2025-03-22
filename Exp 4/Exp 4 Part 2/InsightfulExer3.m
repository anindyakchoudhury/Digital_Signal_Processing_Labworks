clc;
clearvars;

w = [0 pi/3 2*pi/3 pi]; %digital angular frequency
freq = w/pi; %normalised angular frequency
L = 5; %up-sampling factor

mag = [1 1 0 0];
x = fir2(99,freq,mag); %generating 100 points sequence
[X,w] = freqz(x,1,512); %DTFT
subplot(4,1,1)
plot(w/pi,abs(X), 'k', 'Linewidth', 2); xlabel('Normalised Angular Frequency'); ylabel('|X|');title('Original Signal Spectrum')
subplot(4,1,2)
stem(x); xlabel('Time Index, n'); ylabel('Amplitude'); title('Original Signal')


y=zeros(1,L*length(x));
y(1:L:length(y)) = x; %up-sampled sequence
subplot(4,1,3)
stem(y); xlabel('Time Index, n'); ylabel('Amplitude'); title('Up-Sampled Signal');
[Y,w] = freqz(y,1,512); %DTFT
subplot(4,1,4)
plot(w/pi,abs(Y), 'Linewidth', 2); xlabel('Normalised Angular Frequency'); ylabel('|Y|'); title('Up-Sampled Signal Spectrum');

%z-transform

syms n w L a;
ym = sin(a*n);
Ymz = ztrans(ym)
ym2 = sin(a*n/L);
Ymz2 = ztrans(ym2)