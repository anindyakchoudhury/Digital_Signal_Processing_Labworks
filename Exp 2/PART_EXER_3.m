clc;
clearvars;


n = 1: 52;
L = 3;
x = sin(0.36*n);
y = sin(0.36*n/L);
y1 = y;
for i= 1:52
    if mod(i, L) ~= 0
        y1(i)= 0;
    end
end

subplot(3,1,1);
stem (n,x); %original signal
subplot(3,1,2);
stem(n,y); %not up sampled yet
subplot(3,1,3);
stem(n,y1); %up sampled signal
fig= gcf;
WinOnTop(fig, true);
