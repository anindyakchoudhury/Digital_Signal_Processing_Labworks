clc
clear
close all

to = 0.1;
fs = 2000;
ts = 1 / fs;
f1 = 250;
f2 = 750;
t = -to : ts : to ;
N = length(t);
fn = (0 : N - 1) *fs/N - fs / 2; %what is this
m1 = sinc(100 * t);
m2 = sinc(100 * t) .^ 2;
c1 = cos(2 * pi * f1 * t);
c2 = cos(2 * pi * f2 * t);
u1 = m1 .* c1;
u2 = m2 .* c2;
u = u1 + u2;
M1 = fft(m1, N);
M2 = fft(m2, N);
M1 = M1 / fs;
M2 = M2 / fs; %why 
U1 = fft(u1, N);
U2 = fft(u2, N);
U1 = U1 / fs;
U2 = U2 / fs;
U = U1 + U2;
%% Modulation
figure(1)
subplot(221)
plot(fn, abs(fftshift(M1)),"LineWidth",2)
title('m_1(t)')
xlabel('Frequency (Hz)')
ylabel('Amplitude')

subplot(222)
plot(fn,abs(fftshift(U1)),"LineWidth",2)
title('Modulated m_1(t)');xlabel('Frequency (Hz)');ylabel('Amplitude');

subplot(223)
plot(fn, abs(fftshift(M2)),'r',"LineWidth",2)
title('m_2(t)');xlabel('Frequency (Hz)');ylabel('Amplitude')

subplot(224)
plot(fn, abs(fftshift(U2)),'r',"LineWidth",2)
title('Modulated m_2(t)');xlabel('Frequency (Hz)');ylabel('Amplitude');

%% FDM
figure(2)
plot(fn, abs(fftshift(U)),'c',"LineWidth",2)
title('Spectra of FDM Signal')
xlabel('Frequency (Hz)')
ylabel('Amplitude')

%% Band Pass Filtering
BW=200;
H1 = zeros(1, N);
H2 = zeros(1, N);
H1(((fn <= f1 + BW / 2) & (fn >= f1 - BW / 2))) = 1;
H1(((fn <= -f1 + BW / 2) & (fn >= -f1 - BW / 2))) = 1;
Y1 = (fftshift(U)) .* H1;
H2(((fn <= f2 + BW / 2) & (fn >= f2 - BW / 2))) = 1;
H2(((fn <= -f2 + BW / 2) & (fn >= -f2 - BW / 2))) = 1;
Y2 = (fftshift(U)) .* H2;

figure(3)
subplot(211)
plot(fn, abs((Y1)),"LineWidth",2)
title('y_1(t) from bandpass filter'); xlabel('Frequency (Hz)'); ylabel('Amplitude')

subplot(212)
plot(fn, abs((Y2)),'r',"LineWidth",2)
title('y_2(t) from bandpass filter'); xlabel('Frequency (Hz)'); ylabel('Amplitude')

y11 = ifft(Y1, length(t));
y22 = ifft(Y2, length(t));
r1 = ifft(ifftshift(Y1), N) .* c1;
r2 = ifft(ifftshift(Y2), N) .* c2;
R1 = fft(r1, N) / fs;
R2 = fft(r2, N) / fs;

%% Demodulation
figure(4)
subplot(211)
plot(fn, abs(fftshift(R1)),"LineWidth",2)
title('y_1(t) Multiplied by c_1(t)'); xlabel('Frequency (Hz)'); ylabel('Amplitude')

subplot(212)
plot(fn, abs(fftshift(R2)),'r',"LineWidth",2)
title('y_2(t) Multiplied by c_2(t)'); xlabel('Frequency (Hz)'); ylabel( 'Amplitude')

fcut = BW;
ncut = floor(fcut / fs * N);
H = zeros(1, N);
H(1 : ncut) = 2 * ones(1, ncut);
H(N - ncut + 1 : N) = 2 * ones(1, ncut);
M1Reconstruct = R1 .* H;
M2Reconstruct = R2 .* H;

%% Recovering messages
figure(5)
subplot(211)
plot(fn, abs(fftshift(M1Reconstruct)),"LineWidth",2)
title('m_1(t) recovered by LPF'); xlabel('Frequency (Hz)'); ylabel('Amplitude')

subplot(212)
plot(fn, abs(fftshift(M2Reconstruct)),'r',"LineWidth",2)
title('m_2(t) recovered by LPF'); xlabel('Frequency(Hz)'); ylabel('Amplitude');
