clc;
clearvars;

 T = 2*10^(-3); % period =2 ms
 N = 100; % number of points
 tstep = T/N; % time step

 t = tstep : tstep :3*T; % taking time index upto 3 periods
 x = 2* sin (2* pi*t/T); % Input signal
 ACF_x = normalize ( xcorr (x)); % Normalizing the peak to 1

 Px = sum(x .^2) / length (x); % Input power
 SNR = [0, 5, -30]; % in dB

 figure (1) ;
 for i = 1: length (SNR)
 Py = Px /10^( SNR (i) /10) ; % Noise power
 n = sqrt (Py)* randn (1, length (t)); % generating white noise
 %general randn function creates values with zero mean and 1 Standard
 %Deviation
 %however power denotes variance, so we multiplied sqrt(py)
 y = x + n; % Corrupted input
 
 ACF_x = normalize ( xcorr (x));
 ACF_n = normalize ( xcorr (n));
 ACF_y = normalize ( xcorr (y));
 ACF_y ( length (x)) = 0.4* max( ACF_y ); 
 %You can enable this line for  -better
 % understanding . Scaling value  -should
 %be decreased for lower SNR

 subplot (2 ,2 ,i)

 plot ( tstep *(1: length ( ACF_y )),ACF_y ) % showing ACF w.r.t. time
 title ( sprintf ('SNR = %d dB ', SNR(i))); xlabel ('t(s)');
 end

 %for higher snr, you can understand the value of periodicity from checking
 %the peaks of the ACF graph, however, if the noise power is too large, you
 %actually cant 
 
 subplot (2 ,2 ,4);
 plot ( tstep *(1: length ( ACF_x )),ACF_x ) % showing ACF w.r.t. time
 title ('ACF of input wave '); xlabel ('t(s)');

 figure (2)
 subplot (211) ,plot (x), title ('Input periodic wave '); xlabel ('n');
 subplot (212) ,plot (n), title ('Input Corrupted by AWGN '); xlabel ('n');
 
 
 
 