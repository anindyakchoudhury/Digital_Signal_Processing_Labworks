clc;
clearvars;


%generating unit ramp sequence

[n1 n2] = deal(-3, 3);
n = n1:n2;
n0 = -1;
x = (n-n0).*((n-n0)>=0);
stem(n,x);
fig= gcf
WinOnTop(fig, true);