clc;
clearvars;

%Frequency Division Multiplexing System

to = 0.1;

fc1 = 250;
fc2 = 750;
fs = 2000;

ts=1/fs;
t = [-to:ts:to];

m1 = sinc(100*t); 
m2 = sinc(100*t).^2;

c1 = cos(2*pi*fc1*t); % carrier signals
c2 = cos(2*pi*fc2*t);

u = m1.*c1 + m2.*c2;

subplot(4,1,1)
plot(t,u); xlabel("Time"); ylabel("m(t)"); title('Message Signal');


N = 1024;
U = fft(u,N);
U = U/fs; %scaling
M1 = fft(m1,N);
M1 = M1/fs; %scaling
M2 = fft(m2,N);
M2 = M2/fs; %scaling
fn = [0:1/N:1-1/N]*fs - fs/2;


subplot(4,1,2)
plot(fn,abs(fftshift(U))); xlabel("Frequency"); ylabel("Amplitude"); title('Magnitude Spectra of U(t)')
subplot(4,1,3)
plot(fn,abs(fftshift(M1))); xlabel("Frequency"); ylabel("Amplitude"); title('Magnitude Spectra of m1(t)')
subplot(4,1,4)
plot(fn,abs(fftshift(M2))); xlabel("Frequency"); ylabel("Amplitude"); title('Magnitude Spectra of m2(t)')