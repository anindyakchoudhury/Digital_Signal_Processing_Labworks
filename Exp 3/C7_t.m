clc;
clearvars;
%c7
a = [1 -5/6 1/6];
b = [1];

subplot(4,1,1);
zplane(b,a); title('Pole Zero Plot')
n = 0:10;
x1 = [1 -1/3 0 0 0 0 0 0 0 0 0];
y1 = filter(b,a,x1);
subplot(4,1,2);
stem(n,x1, "Linewidth",1.5); title('System Input');
subplot(4,1,3);
stem(n,y1, "Linewidth",1.5); title('System Output');
% here we have assumed that the system response is stable
imp = zeros(1, length(n));
imp(1) = y1(1);
for i = 2:length(n)
    imp(i) = y1(i) + 1/3 * imp(i-1); %iterative approach
end

subplot(4,1,4)
stem(n,imp, "Linewidth",1.5); title('System Response from Output Response');


