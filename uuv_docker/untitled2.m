clc;
clear all;
phi = deg2rad(15);
psi = deg2rad(30);
theta = deg2rad(25);
Tp = eye(4);
R_x = [1 0 0 0; 0 cos(theta) -sin(theta) 0; 0 sin(theta) cos(theta) 0; 0 0 0 1];
R_y = [cos(phi) 0 sin(phi) 0; 0 1 0 0; -sin(phi) 0 cos(phi) 0; 0 0 0 1];
R_z = [cos(psi) -sin(psi) 0 0; sin(psi) cos(psi) 0 0; 0 0 1 0; 0 0 0 1];
T_A_B = Tp*R_z*R_y*R_x
Rmat_A_B = (T_A_B(1:3,1:3))
% Compute {B} expressed
q0 = 0.5*sqrt(Rmat_A_B(1,1)+Rmat_A_B(2,2)+Rmat_A_B(3,3)+1)
q1 = (Rmat_A_B(3,2) - Rmat_A_B(2,3))/(4*q0)
q1 = (Rmat_A_B(1,3) - Rmat_A_B(3,1))/(4*q0)