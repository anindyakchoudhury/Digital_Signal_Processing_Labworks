clc; 
close all; 
clear all;  

% Signal frequencies
[f1, f2, f3] = deal(10, 50, 100);  % 10Hz, 50Hz, 100Hz components

% Generate original multi-frequency signal
t = 0:0.001:5/f1;  % Time vector with 1ms resolution
x = sin(2*pi*f1*t) + sin(2*pi*f2*t) + sin(2*pi*f3*t);  % Original signal

% Plot original signal
subplot(3,1,1); 
plot(t, x);
title('Original Multi-Frequency Signal');
xlabel('Time (s)');
ylabel('Amplitude');

% Sample the signal at 200Hz
fs = 200;  % Sampling frequency (200Hz, satisfies Nyquist criterion for highest frequency f3=100Hz)
n = 0:fs*max(t);  % Discrete time indices
xs = sin(2*pi*(f1/fs)*n) + sin(2*pi*(f2/fs)*n) + sin(2*pi*(f3/fs)*n);  % Sampled signal

% Plot sampled signal
subplot(3,1,2); 
stem(n/fs, xs);  % Plot in time domain
title(['Sampled Signal at ', num2str(fs), ' Hz']);
xlabel('Time (s)');
ylabel('Amplitude');

% Reconstruct the signal using spline interpolation
xr = interp1(n/fs, xs, t, 'spline');  % Interpolate at original time points

% Plot reconstructed signal
subplot(3,1,3); 
plot(t, xr);
title('Reconstructed Signal using Spline Interpolation');
xlabel('Time (s)');
ylabel('Amplitude');

% Add overall title
sgtitle('Signal Sampling and Reconstruction of Multi-Frequency Signal');