clc;
clearvars;

n = 0:100;
w0 = 0.2*pi;
x = cos(w0*n); %single sinusoid
N = 2048;
fre = linspace(-1,1-(1/N),N);
x1 = x(1:25); % L = 25

figure(1)
subplot(2,1,1)
plot(fre,abs(fftshift(fft(x1,N)))); xlabel("Frequency"); ylabel("Magnitude");
wind = hann(25);
X1 = x1'.*(wind); %windowing
subplot(2,1,2)
plot(fre,abs(fftshift(fft(X1,N)))); xlabel("Frequency"); ylabel("Magnitude");
w1 = 0.2*pi;
w2 = 0.22*pi;
w3 = 0.6*pi;
y = cos(w1*n)+cos(w2*n); %two sinusoids
y0 = cos(w1*n)+cos(w3*n);
y1 = y(1:25); % L = 25
y0 = y0(1:25);
 
figure(2)
subplot(2,1,1)
plot(fre,abs(fftshift(fft(y1,N)))); xlabel("Frequency"); ylabel("Magnitude");
Y1 = y1'.*(wind); %windowing
subplot(2,1,2)
plot(fre,abs(fftshift(fft(Y1,N)))); xlabel("Frequency"); ylabel("Magnitude");

figure(3)
subplot(2,1,1)
plot(fre,abs(fftshift(fft(y0,N)))); xlabel("Frequency"); ylabel("Magnitude");
Y0 = y0'.*(wind); %windowing
subplot(2,1,2)
plot(fre,abs(fftshift(fft(Y0,N)))); xlabel("Frequency"); ylabel("Magnitude");

