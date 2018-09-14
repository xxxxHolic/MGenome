% This function is used to get the Euler matrix
% from the path of Euler rotation 
function M_rotate = Euler(th_1,th_2,th_3)
%% Origin lattice para
th_1 = th_1.*pi/180;
th_2 = th_2.*pi/180;
th_3 = th_3.*pi/180;
% L_0 = [a1 a2 a3;b1 b2 b3;c1 c2 c3];

%% Euler angle and rotation matrix : before transposition

% Rotation of th_1 about x

% Rx = [1 0 0;0 cos(th_1) -sin(th_1);0 sin(th_1) cos(th_1)];
% 
% % Rotation of th_2 about y
% 
% Ry = [cos(th_2) 0 sin(th_2);0 1 0;-sin(th_2) 0 cos(th_2)];
% 
% % Rotation of th_3 about z
% 
% Rz = [cos(th_3) -sin(th_3) 0;sin(th_3) cos(th_3) 0;0 0 1];

%% Euler angle and rotation matrix : after transposition

% Rotation of th_1 about H

RH = [1 0 0;0 cos(th_1) sin(th_1);0 -sin(th_1) cos(th_1)];

% Rotation of th_2 about K

RK = [cos(th_2) 0 -sin(th_2);0 1 0;sin(th_2) 0 cos(th_2)];

% Rotation of th_3 about L

RL = [cos(th_3) sin(th_3) 0;-sin(th_3) cos(th_3) 0;0 0 1];

M_rotate = RH*RK*RL;

end