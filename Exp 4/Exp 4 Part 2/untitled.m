clc;
close all
clearvars;
% 
% x = [ 1 -.2 0 0.2 -1 1 -1 1 -.2 0 0.2];
% % x = [ 0 0 0 1 1 1 1 1 0 0 0 ];
% n = 0: length(x) -1;
% y = abs((fft(x, 11)));
% subplot(2,1,1);
% stem (n, x);
% subplot(2,1,2);
% stem(n,y);

n = -10:10;
y = filter (1, [1 -0.5], (n==0));
stem(n, (n==0));
% hold on
% stem(n, y);