clc;
clearvars;
close all;


wc = 2;
N = [21, 101];


for i = 1:size(N, 2)
    n = 0:N(i)-1;
    h = wc * sinc(wc*(n - (N(i)-1)/2)/pi)/pi;
    figure()
    subplot(2, 1, 1)
    stem(n, h, "LineWidth", 2);
    title(["Shifted and truncated version of LPF for N=", num2str(N(i))]);
    subplot(2, 1, 2)
    plot(linspace(-pi,pi, 512), (abs(fftshift(fft(h, 512)))), "LineWidth", 2);
    title(["DFT of Shifted and truncated version of LPF for N=", num2str(N(i))]);
end