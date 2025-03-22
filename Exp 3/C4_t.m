clc;
clearvars;

a = [ 1 -.5];
b = [ 1 1/3];

n = 0:10;
x1 = (n==0); %unit response
y1 = filter(b,a,x1);

subplot(2,1,1);
stem(n,y1, "Linewidth",1.5); title('Impulse Response');
subplot(2,1,2);
zplane(b,a); title('Pole Zero Plot')

