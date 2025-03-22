clc;
clear all;
clearvars;
close all;

num = [ 0 1];
den = [3 -4 1];
[R, p, C] = residuez(num, den)
syms z f;
f = z/ (3*z^2 - 4*z + 1);
iztrans(f)
zplane(num, den)
