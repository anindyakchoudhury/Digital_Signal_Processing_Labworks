clc;
clearvars;
close all;
M = 21;
n = 0:M-1;
beta = [0, 1, 5, 7];
w_kaiser = zeros(size(beta, 2), M);
N = 512;
w = linspace(-1, 1, N);
for i = 1:size(beta, 2) %size (beta, 2) means how many cols are there in beta matrix
    w_kaiser(i, :) = besseli(0, beta(i)*sqrt(1-(1-2*n/(M-1)).^2))/ besseli(0, beta(i)); %writes the data in i'th colummn of matrix kaiser
    subplot(size(beta, 2), 1, i), plot(n, w_kaiser(i, :));
    title(["Kiaser window for beta=", num2str(beta(i))]);
end

figure

for i = 1:size(beta, 2)
    subplot(size(beta, 2), 1, i), plot(w, 20*log10(abs(fftshift(fft(w_kaiser(i, :), N)))));
    title(["DFT of Kiaser window for beta=", num2str(beta(i))]);
end