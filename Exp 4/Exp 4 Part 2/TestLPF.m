clc;
close all
clearvars
%BPF Filter Code testing
to = 0.1;
fs = 2000;
ts = 1 / fs;
f1 = 250;
f2 = 750;
t = -to : ts : to ;
N = length(t);
fn = (0 : N - 1) / (N / fs) - fs / 2; %what is this
BW = 200;
fcut = BW;
ncut = floor(fcut /fs * N);
H = zeros(1, N);
H(1 : ncut) = 2 * ones(1, ncut);
H(N - ncut + 1 : N) = 2 * ones(1, ncut);

plot(fn,H)