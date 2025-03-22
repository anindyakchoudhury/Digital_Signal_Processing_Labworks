clc;
clearvars;

clc;
clearvars;

a = [1 0.6 0];
b = [1 0 1];

n = -10:15;
y1 = zeros(1, length(n));
y2 = y1;

u = [n>=0];
%itierative approad
%understand better
for i = 3:length(n)
    y1(i) = u(i) - 0.6 * y1(i-1);
    y2(i) = u(i-2)- 0.6 * y2(i-1);
end

y = y1+y2;
y_verification = filter(b,a,u);
subplot(2,1,1);
stem(n, y);
subplot(2,1,2)
stem(n, y_verification);
fig = gcf;
WinOnTop(fig, true);
