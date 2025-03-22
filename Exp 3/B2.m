
clc;
clear all;
clearvars;
close all;


 num = [1, 2];
 den = [1, 0.4 , -0.12];
 y = impz (num , den , 10);
 figure ();
 stem (y); xlabel ('n'); ylabel ('y');