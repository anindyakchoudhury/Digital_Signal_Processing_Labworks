clc;
clearvars;

%consider a system y(n) + 0.6 y(n-1) = x(n)
%now estimate the impulse response of the system using noise autocorr


N = 500;
nr = 0:499;
ny = nr;

r = randn(1,N);
y = zeros(size(r));
for n = 2:N
    y(n) = r(n) - 0.6* y(n-1);
end

[rr nrr] = sigfold(r,nr);

[Ryr k] = conv_m(y, ny, rr, nrr);

subplot(2,1,1)
stem(k, Ryr/max(Ryr)); %max(Ryr)= Ryr(N)
xlim([0 70]); %limiting the values of X axis

%verification
impulse = [nr==0];
a = [1 0.6];
b = [1 0];

impulse_response = filter(b, a, impulse);
subplot(2,1,2)
stem(nr, impulse_response);
xlim([0 70]); %limiting the values of X axis
