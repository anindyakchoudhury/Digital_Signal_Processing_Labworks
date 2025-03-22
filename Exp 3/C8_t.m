clc;
clearvars;

num = [1];
den = [ 1 -2.5 1];
figure(1);
zplane(num,den);
title("Pole Zero Plot");

num1 = [1 -2];
num2 = [1 -.5];

figure(2)
subplot(3,2,1)
zplane(num,den);
title('Given System');

subplot(3,2,2)
x = impz(num,den);
stem(x); title('Impulse Response');

subplot(3,2,3);
zplane(num1,den); title('Causal Stable System');

subplot(3,2,4)
y = impz(num1, den);
stem(y); title('Impulse Response for Causal Stable System');

subplot(3,2,5);
zplane(num2,den); title('Anti-Causal Stable System');

subplot(3,2,6)
z = impz(num2, den);
stem(z); title('Impulse Response for Anti-Causal Stable System');




