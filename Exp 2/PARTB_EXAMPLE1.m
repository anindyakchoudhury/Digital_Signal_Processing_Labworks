clc;
clearvars;


x1 = [ 4 2 6 3 8 1 5];
x2 = [3 8 6 9 6 7];

n1 = -2:4;
n2 = -4:1;

kmin = n1(1)+n2(1);
kmax = n1(end)+n2(end);
y = conv(x1,x2);

k = kmin:kmax;

subplot(3,1,1);
stem (n1,x1); 
subplot(3,1,2);
stem(n2,x2); 
subplot(3,1,3);
stem(k,y); 
fig= gcf;
WinOnTop(fig, true);