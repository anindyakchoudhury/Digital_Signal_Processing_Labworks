clc; 
close all; 

%% Signal Generation
% Creating a multi-frequency signal with components at 10Hz, 50Hz, and 100Hz
F1 = 10;   % First frequency component (10 Hz)
F2 = 50;   % Second frequency component (50 Hz)
F3 = 100;  % Third frequency component (100 Hz)
t = 0:0.0001:0.5;  % Time vector with 0.0001s resolution (sampling at 10kHz)
x = sin(2*pi*F1*t) + sin(2*pi*F2*t) + sin(2*pi*F3*t);  % Combined signal

% Plot the original continuous-time signal
subplot(4,1,1);
plot(t, x);
title('Original signal');
xlabel('Time (s)');
ylabel('Amplitude');

%% Sampling
% Sampling the signal at 200Hz (note: according to Nyquist, we need at least 2*100Hz = 200Hz)
Fs = 200;  % Sampling frequency in Hz
n = 0:Fs*max(t);  % Discrete time index
% Generate sampled signal directly using discrete-time formula
Xs = sin(2*pi*F1/Fs*n) + sin(2*pi*F2/Fs*n) + sin(2*pi*F3/Fs*n);

% Plot the sampled signal
subplot(4,1,2);
stem(n/Fs, Xs);  % Plotting against time for better comparison
title(['Sampled Signal at ', num2str(Fs), ' Samples/sec']);
xlabel('Time (s)');
ylabel('Amplitude');

%% Quantization
% Implementing uniform quantization with b bits
b = 3;  % Number of bits for quantization
L = 2^b;  % Number of quantization levels (8 levels for 3 bits)
del = (max(Xs) - min(Xs))/(L-1);  % Quantization step size

% Generate quantization levels
l = zeros(1, L);
for i = 1:L
   l(i) = min(Xs) + del*(i-1);
end

% Quantize the signal using nearest level (rounding)
Xq = Xs;
for i = 1:length(Xs)
   for j = 1:length(l)-1
       if Xs(i) > l(j) && Xs(i) < l(j+1)
           u = Xs(i) - l(j);      % Distance to lower level
           v = l(j+1) - Xs(i);    % Distance to upper level
           if u > v
               Xq(i) = l(j+1);    % Choose upper level if closer
           else
               Xq(i) = l(j);      % Choose lower level if closer
           end
       end
   end
end

% Plot the quantized signal
subplot(4,1,3);
stem(n/Fs, Xq);
title(['Quantized Signal With ', num2str(b), ' bits']);
xlabel('Time (s)');
ylabel('Amplitude');

% Plot the quantization error
subplot(4,1,4);
err = Xq - Xs;  % Quantization error
stem(n/Fs, err);
title('Quantization Error');
xlabel('Time (s)');
ylabel('Error Amplitude');

%% SQNR Calculation
% Calculate the quantization noise power
noise_power = mean(err.^2);
% Calculate the signal power
signal_power = mean(Xs.^2);  % Using sampled signal power
% Calculate SQNR (Signal to Quantization Noise Ratio)
SQNR = signal_power/noise_power;
SQNRdb1 = 10*log10(SQNR);  % SQNR in decibels (measured)
SQNRdb = 1.76 + 6*b;        % SQNR in decibels (theoretical for sinusoidal signals)

% Display SQNR values
fprintf('Measured SQNR: %.2f dB\n', SQNRdb1);
fprintf('Theoretical SQNR: %.2f dB\n', SQNRdb);
fprintf('Difference: %.2f dB\n', SQNRdb1 - SQNRdb);