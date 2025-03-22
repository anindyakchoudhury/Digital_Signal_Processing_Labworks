clc;
clearvars;
close all;

 % 2nd order low pass filter
 p1 = 0.7 + 0.1j; p2 = conj (p1);
 z1 = -.85 ; z2 = conj (z1);
 num = conv ([1 , -z1] , [ 1, -z2 ]);
 den = conv ([1 , -p1] , [ 1, -p2 ]);
 [h,w] = freqz (num , den);
 dB = mag2db ( abs(h));
figure ();
zplane(num, den);
 figure ();
 subplot (211) ; plot (w/pi ,dB); title ('2nd order lowpass filter ');
 xlabel ('\ omega / \pi '); ylabel ('Magnitude (dB)')

 % 2nd order high pass filter
 [h,w] = freqz (den , num);
 dB = mag2db ( abs(h));

 subplot (212) ; plot (w/pi ,dB); title ('2nd order highpass filter ');
 xlabel ('\ omega / \pi '); ylabel ('Magnitude (dB)')

