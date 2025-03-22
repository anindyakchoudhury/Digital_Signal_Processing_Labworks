clc;
clear all;
clearvars;
close all;

 syms a r w n f m;

 ztrans ( kroneckerDelta (n)) % for d[n]
 ztrans (n/n) % for u[n]
 ztrans ( kroneckerDelta (n -1) )
 ztrans (a^n)
 ztrans (n*a^n)
 ztrans (cos (w*n))
 ztrans (sin (w*n))
 ztrans (r^n*cos (w*n))
 ztrans (r^n*sin (w*n))