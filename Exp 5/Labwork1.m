clc;
clearvars;
close all;

M = 21;
% rectangular
n = 0:(M-1);
w_rect = ones(1, M);
%barlett
w_bartlett = zeros(1, M);
for i = 1:length(w_bartlett)
    if i >= 0 && i <= (M-1)/2
        w_bartlett(i) = 2*i/(M-1);
    else
        w_bartlett(i) = 2 - (2*i/(M-1));
    end
end
%hanning
w_hann = 0.5*(1-cos(2*pi*n/(M-1)));
%hamming
w_hamm = 0.54 - 0.46*cos(2*pi*n/(M-1));
%blackman
w_black = 0.42 - 0.5*cos(2*pi*n/(M-1)) + 0.08*cos(4*pi*n/(M-1));

%plotting in time domain
subplot(511), plot(n, w_rect), title("Rectangular window");
subplot(512), plot(n, w_bartlett), title("Bartlett window");
subplot(513), plot(n, w_hann), title("Hanning window");
subplot(514), plot(n, w_hamm), title("Hamming window");
subplot(515), plot(n, w_black), title("Blackman window");

figure
N = 512;
w = linspace(-pi, pi, N);
subplot(511), plot(w, 20*log10(abs(fftshift(fft(w_rect, N))))), title("DFT of Rectangular window");
subplot(512), plot(w, 20*log10(abs(fftshift(fft(w_bartlett, N))))), title("DFT of Bartlett window");
subplot(513), plot(w, 20*log10(abs(fftshift(fft(w_hann, N))))), title("DFT of Hanning window");
subplot(514), plot(w, 20*log10(abs(fftshift(fft(w_hamm, N))))), title("DFT of Hamming window");
subplot(515), plot(w, 20*log10(abs(fftshift(fft(w_black, N))))), title("DFT of Blackman window");