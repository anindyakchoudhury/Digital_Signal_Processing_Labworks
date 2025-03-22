clc;
clearvars;


T = 2*10^(-3); % period = 2 ms
N = 100; % number of points
tstep = T/N; % time step

t = tstep:tstep:3*T;
x = 2*sin(2*pi*t/T);

Px = sum(x.^2)/length(x);
SNR = -10; %dB scale
P_noise = Px/10^(SNR/10);
noise_sig = sqrt(P_noise) * randn(1, length(t)); %final Noise Signal

noise_added_sig = x + noise_sig; %corrupted input

[ACF_x lag_x] = xcorr(x);
ACF_x = normalize(ACF_x);


[ACF_noise_added_sig lag_noise_added_sig] = xcorr(noise_added_sig);
ACF_noise_added_sig = normalize(ACF_noise_added_sig);

[peaks locs] = findpeaks(ACF_noise_added_sig, 'MinPeakProminence', 0.2);
time_period = tstep * mean(diff(locs));

subplot(4,1,1)
plot(x);
subplot(4,1,2) 
plot(noise_added_sig);
subplot(4,1,3) 
plot(lag_noise_added_sig, ACF_noise_added_sig);
subplot(4,1,4)
plot(sin(2*pi*t/time_period));

%However, we cannot
%find the amplitude of the original signal using this method.
%Additionally, if there was a phase shift in the original signal, it would not be possible to detect it
%just by finding the period of ACF. Theoretically, auto-correlation destroys the phase information
%of a signal.
%Matlab
