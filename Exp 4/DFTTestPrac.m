clc;
clearvars;
close all;

BW = 200
%fs=4*BW
to=.1;
fs= 1.5*BW;
ts=1/fs;

nup=round(to/ts);
nlo=-nup;% generate time index
n=nlo:nup;
t=n*ts;
m=(sinc(BW*t)).^2;
N=1024;% FFT bin size ,after zero padding
fn = [0:1/N:5-1/N]*fs-5*fs/2;
k=0:5*N-1;
WN=exp(-j*2*pi/N);
nk=n'*k;
W=WN.^nk;
M=m*W;
%  M=fft(m,1024);
subplot(211),plot(fn, abs(fftshift(M))); title("fs = 4BW")
subplot(212), plot(fn/5, abs(fftshift(fft(m,1024))));
