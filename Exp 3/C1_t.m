clc;
clearvars;

d1 = -1;
num = [1 0 0];
den1 = [1 -d1];
[h,t] = impz(num, den1);
subplot(2,1,1);
stem(t,h); title('First Order Oscillator')
d1 = 2^(-.5) + 2^(-.5)*1i; %created non decaying oscillation by putting the pole on the unit circle
d2 = conj(d1);

den2 = conv([1 -d1], [1 -d2]);
[h, t] = impz (num, den2, 20);
subplot(2,1,2);
stem(h); title('Second Order Oscillator');




