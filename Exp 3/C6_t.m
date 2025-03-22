clc;
clearvars;

num = [ 2 16 44 56 32];
den = [ 3 3 -15 18 -12];

[r, p, c] = residuez(num,den);
zplane(num, den); title('Pole Zero Plane');

disp('Residues ='); disp(r);
disp('Poles ='); disp(p);
disp('Constant Direct Terms ='); disp(c);

