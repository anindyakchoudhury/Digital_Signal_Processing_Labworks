clc;
clearvars;

%implementing a unit impulse sequence

[n1 n2] = deal(-3, 3);
n = n1:n2;
n0 = 2;
x = [(n-n0)>=0];
stem(n,x);

fig= gcf
WinOnTop(fig, true);