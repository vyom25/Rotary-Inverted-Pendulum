clc;
clear all;
close all;

r = 0.109;

mp = 3.3*10^-3;

lp = 0.1832;

g = 9.81;

%T = 2*3.14*sqrt(lp/g);

%f = ;

jp = 1.1*10^-4; %mp*g*lp/4*3.14^2*f^2;

jeq = 1.23*10^-4;

kt = 0.02797;

km = 0.02797;

rm = 3.3;

den = jp*jeq + mp*lp^2*jeq + jp*mp*r^2;

rden = den*rm;

a32 = r*mp^2*lp^2*g/den;

a33 = -kt*km*(jp + mp*lp^2)/rden;

a42 = -mp*lp*g*(jeq + mp*r^2)/den;

a43 = mp*lp*kt*r*km/rden;

b31 = kt*(jp + mp*lp^2)/rden;

b41 = -mp*lp*kt*r/rden;

A = [0, 0, 1, 0;
     0, 0, 0, 1;
     0 ,a32, a33, 0;
     0, a42, a43, 0];

B = [0; 0; b31; b41];

C = eye(4);

Q = [50, 0, 0, 0;
     0, 130, 0, 0;
     0, 0, 0, 2;
     0, 0, 0, 8];

R = 1;

N = 0;

[k,s,e] = lqr(A, B, Q, R, N);

y = A-B*k;

sys = ss(y,B,C,0);

eig(A)

eig(y)

k
k1 = k(1,1)
k2 = k(1,2)
k3 = k(1,3)
k4 = k(1,4)