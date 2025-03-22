clc; 
close all; 
clear all;  

% Signal generation
f = 10;                   % Signal frequency (10 Hz)
t = 0:0.01/f:5/f;         % Time vector with high resolution for smooth plotting
x = sin(2*pi*f*t);        % Generate original sinusoidal signal

% Plot original continuous signal
subplot(3,1,1); 
plot(t, x);
title('Original Continuous Signal');
xlabel('Time (s)');
ylabel('Amplitude');

% Sampling the signal
fs = 50;                  % Sampling frequency (50 Hz)
n = 0:fs*max(t);          % Discrete time indices
xs = sin(2*pi*(f/fs)*n);  % Sampled signal

% Plot sampled signal
subplot(3,1,2); 
stem(n/fs, xs);           % Convert indices to time for better comparison
title(['Sampled Signal at ', num2str(fs), ' Hz']);
xlabel('Time (s)');
ylabel('Amplitude');

% Signal reconstruction using spline interpolation
xinterpolation = interp1(n/fs, xs, t, 'spline'); % Interpolate sampled signal at original time points

% Plot reconstructed signal
subplot(3,1,3); 
plot(t, xinterpolation);
title('Reconstructed Signal (Spline Interpolation)');
xlabel('Time (s)');
ylabel('Amplitude');

% Add a figure title
sgtitle('Signal Sampling and Reconstruction');