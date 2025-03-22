clc;
clearvars;

a = [1 0.6];
b = [1 0];

n = -10:20;

u = [(n)>=0];
r = n .* (n>=0);
s = 0.5 * sin(n);
i = [n==0];

x = 0.5 .* u;
impulse_response = filter(b,a,i);
step_response = filter(b,a,u);
sinusoidal_response = filter(b,a, s);

subplot(5,1,1)
stem(n,impulse_response);

subplot(5,1,2)
stem(n,step_response);
%verification 1
step_response_verified = conv(impulse_response, u);
subplot(5,1,3)
stem(step_response_verified)

subplot(5,1,4)
stem(n,sinusoidal_response);
%verification 2
sinusoidal_response_verified = conv(impulse_response, s);
subplot(5,1,5)
stem(sinusoidal_response_verified)

fig= gcf
WinOnTop(fig, true);

