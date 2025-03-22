clc;

clearvars;

%%liton way

n1 = 0:3;
x1 = [0 1 2 3];
n2 = -1:2;
x2 = [ 0 1 2 3 ];

n = min (n1(1), n2(1)): max(n1(end), n2(end));

y1 = [ zeros(1, (abs(n(1)-n1(1)))) x1 zeros(1, abs(n(end)-n1(end)))];
y2 = [ zeros(1, abs(n(1)-n2(1))) x2 zeros(1, abs(n(end)-n2(end)))];

stem(n,y1+y2);

 fig=gcf;
 WinOnTop(fig, true);
 