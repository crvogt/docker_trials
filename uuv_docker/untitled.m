psi = 30;
phi = 15;
theta = 25;

Rx = [1 0 0;
0 cosd(theta) -sind(theta);
0 sind(theta) cosd(theta)];

Ry = [cosd(phi) 0 sind(phi);
0 1 0;
-sind(phi) 0 cosd(phi)];

Rz = [cosd(psi) -sind(psi) 0;
sind(psi) cosd(psi) 0;
0 0 1];
ABR = eye(3) * Rz*Ry*Rx

qx = quaternion(cosd(theta/2), sind(theta/2), 0, 0);
qy = quaternion(cosd(phi/2), 0, sind(phi/2), 0);
qz = quaternion(cosd(psi/2), 0, 0, sind(psi/2));
ABq = qz * qy * qx

u1 = [1 0 0]';
u2 = [0 1 0]';
u3 = [0 0 1]';

q1 = [cosd(theta/2); u1*sind(theta/2)]
q2 = [cosd(phi/2); u2*sind(phi/2)]
q3 = [cosd(psi/2); u3*sind(psi/2)]

q = quatmultiply(quatmultiply(q3',q2'),q1');

% Carlson
% R_B2_A = [cosd(psi), -sind(psi), 0;...
% sind(psi), cosd(psi), 0;...
% 0, 0, 1];
% R_B1_B2 = [cosd(phi), 0, sind(phi);...
% 0, 1, 0;...
% -sind(phi), 0, cosd(phi)];
% R_B_B1 = [1,0,0;...
% 0, cosd(theta), -sind(theta);...
% 0, sind(theta),cosd(theta)];
% RAB = R_B2_A * R_B1_B2 * R_B_B1;

ux = [1,0,0];
qx = quaternion([cosd(theta/2),ux*sind(theta/2)]);
uy = [0,1,0];
qy = quaternion([cosd(phi/2),uy*sind(phi/2)]);
uz = [0,0,1];
qz = quaternion([cosd(psi/2),uz*sind(psi/2)]);
q_A_C = qz * qy * qx
% q_A_C = quatmultiply(quatmultiply(qy,qz), qx)