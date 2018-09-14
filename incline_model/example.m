%%
clc;clear;
%%
load('x_SRO_incline_all.mat');

%%
figure;scatter3(Q_space(:,1),Q_space(:,2),Q_space(:,3),5,'r','filled');
daspect([1,1,1]);
xlabel('H');ylabel('K');zlabel('L');
%% mode 'slice'
inlimt = [1 0 0 0.5 -0.5];
data = incoor(Q_space,inlimt,'slice',1);
figure;scatter3(data(:,1),data(:,2),data(:,3),5,'r','filled');
daspect([1,1,1]);
xlabel('H');ylabel('K');zlabel('L');

%% mode 'ortho'
inlimt  = [-0.5 0.5 -0.5 0.5 1.5 2.5];
data = incoor(Q_space,inlimt,'ortho',1);
grid on;
box on;
