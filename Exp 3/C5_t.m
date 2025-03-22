clc;
clearvars;


num = [3 -4];
den = [ 1 -3.5 1.5];
subplot(4,1,1);
zplane(num, den); title('Pole Zero Plot')
[r,p,c] = residuez(num,den);
n = 0:10;
h1 = (r(1)*(p(1).^n) + r(2)*(p(2).^n));
subplot(4,1,2);
stem(n,h1, "Linewidth",1.5); title('Causal');

n = -10:-1;
h2 = (-r(1)*(p(1).^n))  -  (r(2)*(p(2).^n));
subplot(4,1,3); stem(n,h2, "Linewidth",1.5); title('Anti-Causal')

a = 1:10;
b = -10:-1;
h3 = r(2)*p(2).^a; h4 = r(1)*p(1).^b; h = zeros(1,21);
h(11:20) = h3; h(1:10) = h4;
subplot(4,1,4); n = -10:10;
stem(n, h, "Linewidth",1.5); title ('Non-causal')
