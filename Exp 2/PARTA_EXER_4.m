clc;
clearvars;

[n1 n2] = deal(-3, 3);
n = n1:n2;
n0 = -1;
x1 = (n-n0).*((n-n0)>=0);


x2= fliplr(x1);

subplot(3,1,1)
stem(n,x1); %ramp signal
subplot(3,1,2)
stem(n, (x1+x2)/2); %even part
subplot(3,1,3)
stem(n, (x1-x2)/2); %odd part

fig= gcf
WinOnTop(fig, true);
