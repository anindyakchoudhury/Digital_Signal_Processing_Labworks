clc; 
clearvars;

w0 = 0.2*pi;
w1 = 0.22*pi;
w2 = 0.6*pi;

N = 1024;
n = 0:100;
x = cos(w0*n) + cos(w1*n) + cos(w2*n);
fre = linspace(-1,1-(1/N),N);


x1 = x(1:25); % window length L1 = 25
x2 = x(1:50); % window length L1 = 50
x3 = x(1:100); % window length L1 = 100


subplot(3,2,1) 
plot(fre,abs(fftshift(fft(x1,N)))); xlabel("Frequency"); ylabel("Magnitude"); title("Magnitude Spectra Before Windowing, L = 25");
subplot(3,2,3)
plot(fre,abs(fftshift(fft(x2,N)))); xlabel("Frequency"); ylabel("Magnitude"); title("Magnitude Spectra Before Windowing, L = 50");
subplot(3,2,5)
plot(fre,abs(fftshift(fft(x3,N)))); xlabel("Frequency"); ylabel("Magnitude"); title("Magnitude Spectra Before Windowing, L = 100");

%windowing
X1=x1'.*(hann(25));
X2=x2'.*(hann(50));
X3=x3'.*(hann(100));

title("Magnitude Spectra After Windowing")
subplot(3,2,2), plot(fre,abs(fftshift(fft(X1,N)))); xlabel("Frequency"); ylabel("Magnitude"); title("Magnitude Spectra After Windowing, L = 25");
subplot(3,2,4), plot(fre,abs(fftshift(fft(X2,N)))); xlabel("Frequency"); ylabel("Magnitude"); title("Magnitude Spectra After Windowing, L = 50");
subplot(3,2,6), plot(fre,abs(fftshift(fft(X3,N)))); xlabel("Frequency"); ylabel("Magnitude"); title("Magnitude Spectra After Windowing, L = 100");