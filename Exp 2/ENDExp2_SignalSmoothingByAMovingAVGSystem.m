clc;
clearvars;

M=3;
temp = 0;
n = 0:49;
x = 2.*n.*(0.9.^(n));
subplot(2,2,1)
plot(n,x,'-o');
hold on
noise = rand(1,50)-.5; %rand usually gives random numbers from 0 to 1
%now it will give random numbers of 0.5 to -0.5
y = x + noise;
plot(y);
hold off

z = zeros(1,length(n));
%for initial values
for i = 1:M-1
    z(i) = y(i)/M + temp;
    temp = z(i);
end
temp = 0;
for i = M:length(n)
    for j = 0:M-1
    z(i) = y(i-j)/M + temp;
    temp = z(i);
    end
    temp = 0;
end

   

subplot(2,2,2)
plot(n,x,'-o');
hold on
plot(z)
hold off