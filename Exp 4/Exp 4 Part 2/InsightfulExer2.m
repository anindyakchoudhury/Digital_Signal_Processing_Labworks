clc;
clearvars;

x=[1 2 0 1];
y=[2 2 2 1];
n=[0 1 2 3];

D=dftmtx(length(n));
z=x+1i*y;
Z=D*transpose(z);

X=fft(x) %Verification
Y=fft(y) %Verification

Xp=[real(Z(1)) 0.5*(Z(2)-Z(4)) real(Z(3)) 0.5*(conj(Z(2))+Z(4))]
Yp=[imag(Z(1)) 0.5*(Z(2)-conj(Z(4)))/1i imag(Z(3)) 0.5*(-conj(Z(2))-conj(Z(4)))/1i]