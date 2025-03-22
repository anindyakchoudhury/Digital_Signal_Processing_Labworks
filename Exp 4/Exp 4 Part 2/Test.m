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

BW=200;
H1 = zeros(1, N);
H2 = zeros(1, N);
H1(((fn <= f1 + BW / 2) & (fn >= f1 - BW / 2))) = 1;
H1(((fn <= -f1 + BW / 2) & (fn >= -f1 - BW / 2))) = 1;
plot(fn, H1)
hold on
H2(((fn <= f2 + BW / 2) & (fn >= f2 - BW / 2))) = 1;
H2(((fn <= -f2 + BW / 2) & (fn >= -f2 - BW / 2))) = 1;
plot(fn, H2)
