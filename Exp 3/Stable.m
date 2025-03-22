clc;
clearvars;

clc
clear all
close all
num = [1 1];
den = [1 -.3 ];
zplane(num,den)
K = isStable(den);

function [K] = isStable(A)
  l = length(A);
 K = zeros(1,l);
 temp = 1;
for i = 1:l
    K(l-i+1)=A(end);
    if abs(K(l-i+1))>1
     disp('Unstabale System');
     temp = 0;
     break;
    end
    A = (A - K(l-i+1)*fliplr(A))/(1-K(l-i+1)^2);
    A(end)=[];
end
if temp == 1
    disp('Stable System');
end
end