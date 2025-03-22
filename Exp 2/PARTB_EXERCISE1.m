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
%scaling operation
y1 = [ zeros(1, (abs(k(1)-n1(1)))) x1 zeros(1, abs(k(end)-n1(end)))];
y2 = [ zeros(1, abs(k(1)-n2(1))) x2 zeros(1, abs(k(end)-n2(end)))];

subplot(3,1,1);
stem (k,y1); 
subplot(3,1,2);
stem(k,y2); 
subplot(3,1,3);
stem(k,y); 
fig= gcf;
WinOnTop(fig, true);