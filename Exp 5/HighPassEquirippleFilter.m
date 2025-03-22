clc;
clearvars;
close all;

% Filter design specifications
wp = 2.2;       % Passband edge frequency in radians/sample
wc = 2;         % Cutoff frequency in radians/sample
ws = 1.8;       % Stopband edge frequency in radians/sample
delp = 0.01;    % Passband ripple (delta_p)
dels = 0.001;   % Stopband ripple (delta_s)

% Input parameters for remezord
f = [ws wp];    % Band edge frequencies [stopband_edge passband_edge]
m = [0 1];      % Desired magnitude response for each band (0 for stopband, 1 for passband)
ripple = [delp dels];  % Ripple specifications for each band

% Design FIR filter using Parks-McClellan algorithm
[n, fo, mo, w] = remezord(f, m, ripple, 2*pi);  % Calculate filter order and parameters
h = remez(n, fo, mo, w);  % Generate filter coefficients

% Calculate filter frequency response
fn = linspace(-pi, pi, 512);  % Frequency vector for visualization
H = fft(h, 512);              % Compute DFT
H = fftshift(H);              % Shift zero frequency to center

%visualization
figure;
plot(fn, abs(H));
title('Magnitude Response of FIR Filter');
xlabel('Frequency (radians/sample)');
ylabel('Magnitude');
grid on;


hold on;
plot([-ws -ws], [0 1.1], 'r--', 'LineWidth', 1);
plot([ws ws], [0 1.1], 'r--', 'LineWidth', 1);
plot([-wp -wp], [0 1.1], 'g--', 'LineWidth', 1);
plot([wp wp], [0 1.1], 'g--', 'LineWidth', 1);
hold off;


legend('Magnitude Response', 'Stopband Edge', '', 'Passband Edge', '');
filter_info = sprintf('Filter Order: %d\nPassband Ripple: %.4f\nStopband Attenuation: %.4f', n, delp, dels);
annotation('textbox', [0.15, 0.7, 0.2, 0.2], 'String', filter_info, 'FitBoxToText', 'on', 'BackgroundColor', 'white');