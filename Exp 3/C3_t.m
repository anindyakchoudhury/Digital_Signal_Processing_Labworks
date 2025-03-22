clc;
clearvars;
clear all;

t = 0: 0.5 : 5;
a = [1 -1];
b = [1];

n = 0:10;
x1 = (n==0);
x2 = (n>=0);

y1 = filter(b,a,x1);
y2 = filter(b,a,x2);

subplot(4,1,1);
stem(n,y1, "Linewidth",1.5); title('Impulse Response using Filter')
subplot(4,1,2);
stem(n,y2, "Linewidth",1.5); title('Unit Step Response');
subplot(4,1,3);
zplane(b,a); title('Pole Zero Plot')
subplot(4,1,4);
impz(b,a,t); 

