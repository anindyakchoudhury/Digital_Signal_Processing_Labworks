clc;
clearvars;
close all;

% Set the number of points for DFT computation
DFT_PTS = 512;

% Filter design specifications
dp = 0.05;          % Passband ripple
ds = 0.005;         % Stopband ripple
f = [1000 1400 2200 2600];  % Band edge frequencies in Hz
                           % [stopband1_end passband_start passband_end stopband2_start]
ripple = [ds dp ds];        % Ripple specifications for each band
m = [0 1 0];                % Desired magnitude response for each band
                           % 0 for stopbands, 1 for passband
                           
% Calculate filter order and parameters using Remez exchange algorithm
[N, fo, mo, wo] = remezord(f, m, ripple, 8000);  % 8000 Hz is the sampling frequency
h = remez(N, fo, mo, wo);   % Design the optimal filter with calculated parameters

% Generate frequency vector for plotting
n = 0:N;            % Time indices for the filter coefficients
fn = linspace(-3000, 3000, DFT_PTS);  % Frequency vector for visualization

% Compute the filter's frequency response
H = fft(h, DFT_PTS);  % Calculate DFT of the filter
H = fftshift(H);      % Shift zero frequency to center

% Create visualization plots
figure(1)
subplot(311)
plot(fn, abs(H))
title('Magnitude Response of FIR Filter')
xlabel('Frequency (Hz)')
ylabel('Magnitude')
grid on

subplot(312)
stem(n, h)
title('Filter Coefficients (Impulse Response)')
xlabel('Sample Index')
ylabel('Amplitude')
grid on

subplot(313)
plot(fn, 20*log10(abs(H)/max(abs(H))))  % Normalized magnitude response in dB
title('Magnitude Response (dB)')
xlabel('Frequency (Hz)')
ylabel('Magnitude (dB)')
ylim([-100, 5])  % Limit y-axis for better visibility of stopband attenuation
grid on


text_str = sprintf('Filter Order = %d\nPassband Ripple = %.3f\nStopband Attenuation = %.3f', ...
   N, dp, ds);
annotation('textbox', [0.15, 0.02, 0.3, 0.1], 'String', text_str, 'FitBoxToText', 'on', ...
   'BackgroundColor', 'white');