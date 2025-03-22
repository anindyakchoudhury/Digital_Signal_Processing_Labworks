clc; 
close all; 
clear all;  

% Signal frequencies
[f1, f2, f3] = deal(10, 50, 100);  % Define three frequency components

% Generate original continuous-time signal
t = 0:0.001:5/f1;  % Time vector with high resolution (1ms)
x = sin(2*pi*f1*t) + sin(2*pi*f2*t) + sin(2*pi*f3*t);  % Original multi-frequency signal

% Plot the original signal
subplot(4,1,1); 
plot(t, x);
title('Original Signal');
xlabel('Time (s)');
ylabel('Amplitude');

% Sample the signal at 200Hz
fs = 200;  % Sampling frequency (200Hz - meets Nyquist criterion for highest frequency 100Hz)
n = 0:fs*max(t);  % Discrete time indices
xs = sin(2*pi*(f1/fs)*n) + sin(2*pi*(f2/fs)*n) + sin(2*pi*(f3/fs)*n);  % Sampled signal

% Plot the sampled signal
subplot(4,1,2); 
stem(n/fs, xs);
title('Sampled Signal (200 Hz)');
xlabel('Time (s)');
ylabel('Amplitude');

% Store the sampled signal before quantization
xsampled = xs;

% Quantization parameters
bits = 6;  % Number of bits for quantization
level = 2^bits;  % Number of quantization levels (64 levels for 6 bits)
[xmax, xmin] = deal(max(xs), min(xs));  % Find signal range
delta = (xmax - xmin)/(level-1);  % Calculate quantization step size

% Perform uniform quantization
for i = 1:length(xs)
   levelvalue = round((xs(i)-xmin)/delta);  % Find nearest quantization level
   xs(i) = (delta*levelvalue) + xmin;  % Adjust signal to that level
end

% Store the quantized signal
xquantized = xs;

% Plot the quantized signal
subplot(4,1,3); 
stem(n/fs, xs);
title(['Quantized Signal (', num2str(bits), ' bits)']);
xlabel('Time (s)');
ylabel('Amplitude');

% Calculate quantization error and SQNR
error = (xquantized - xsampled);  % Quantization error
sqnr = pow2db(mean(xsampled.^2)/mean(error.^2));  % Measured SQNR in dB
sqnr_theoretical = 1.76 + 6.02 * bits;  % Theoretical SQNR for sinusoidal signals

% Display SQNR results
fprintf('Measured SQNR: %.2f dB\n', sqnr);
fprintf('Theoretical SQNR: %.2f dB\n', sqnr_theoretical);

% Signal reconstruction from quantized samples
x_re_fromquantisation = interp1(n/fs, xquantized, t, 'spline');

% Encode quantized values to integers (0 to level-1)
for i = 1:length(xquantized)
   xquantized(i) = round((xquantized(i) - min(xquantized))/delta);
end
x_encoded = xquantized;

% Plot the encoded values
subplot(4,1,4);
stairs(n/fs, x_encoded);
title('Encoded Signal Values');
xlabel('Time (s)');
ylabel('Level Index (0 to 63)');
ylim([-1, level]);

% Convert encoded values to binary representation
x_encoded_binary = dec2bin(x_encoded);
x1 = x_encoded_binary';
x2 = x1(:)';  % Serialized binary data

% Display the first few binary values
fprintf('Sample of binary encoded values:\n');
disp(x_encoded_binary(1:min(10, size(x_encoded_binary, 1)), :));

% Add overall title
sgtitle('Signal Sampling, Quantization and Encoding Process');