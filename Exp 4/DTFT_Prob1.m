%CALCULATION OF FOURIER TRANSFORM FROM FIRST PRINCIPLE
clc;
clearvars;

%GENERATING A SINC PULSE
f_c = 1/8; %DEFINING FREQUENCY VARIABLE FOR SINC PULSE
n = -40:40; %DEFINING THE INDEX FOR SINC PULSE
x = sinc(2*f_c*n);
%END OF SINC PULSE
figure(1), stem(n, x, '.k');xlabel('n', 'fontsize', 14), ylabel('x(n)', 'fontsize', 14), title('Discrete time signal', 'fontsize', 14);
M = 101; %NUMBER OF POINTS IN DIGITAL FREQUENCY GRID
w = linspace(-pi, pi, M); %DEFINING THE DIGITAL FREQUENCY GRID
dw = w(2)-w(1); %RESOLUTION OF DIGITAL FREQUENCY
X = zeros(1,M); %INITIALIZING THE DTFT OF x(n)
for i1 = 1:M
    for i2 = 1:length(x)
        X(i1)= X(i1)+x(i2)*exp(-1i*w(i1)*n(i2));
    end
end
figure(2)
plot(w,abs(X), 'k', 'linewidth', 2); xlabel('Frequency (rad/sec)', 'fontsize', 14); ylabel('X(w)', 'fontsize', 14); title('FREQUENCY SPECTRA', 'fontsize', 14);
%RECONSTRUCTION OF SIGNAL
n_re = -80:80;
x_re = zeros(1,length(n_re)); %INITIALIZING RECONSTRUCTED SIGNAL
for i1 = 1:M
    for i2 = 1:length(x_re)
    x_re(i2) = x_re(i2)+1/(2*pi)*X(i1)*exp(-1i*w(i1)*n_re(i2))*dw;
    end
end
figure(3)
stem(n_re, x_re,'.k', 'linewidth',1); xlabel('t', 'fontsize', 14);  ylabel('x_{reconstructed}', 'fontsize', 14); title('Reconstructed signal', 'fontsize', 14);