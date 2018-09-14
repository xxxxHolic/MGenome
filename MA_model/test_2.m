%% The purpose of this code is used to combine different domain
clc;clear;
% close all;
%% loading domain

a_1 = 1; a_2 = 1; a_3 = 1; a_4 = 1;
b_1 = 1; b_2 = 1; b_3 = 1; b_4 = 1;
c_1 = 1; c_2 = 1; c_3 = 1; c_4 = 1;

dd = [a_1 a_2 a_3 a_4 b_1 b_2 b_3 b_4 c_1 c_2 c_3 c_4];

color{1} = [1 0 0]; color{2} = [0 0 0]; color{3} = [0 0 1]; color{4} = [0 1 0];
color{5} = [0 1 1]; color{6} = [1 0 1]; color{7} = [1 1 0]; color{8} = [1 0.5 0]; color{9} = [0.6 0.2 0.2];
color{10} = [0.2 0.6 0.2]; color{11} = [0.2 0.2 0.6]; color{12} = [0.4 0.3 0.2];  

name{1} = 'Ma_domain_a_1';name{2} = 'Ma_domain_a_2'; name{3} = 'Ma_domain_a_3'; name{4} = 'Ma_domain_a_4';
name{5} = 'Ma_domain_b_1';name{6} = 'Ma_domain_b_2'; name{7} = 'Ma_domain_b_3'; name{8} = 'Ma_domain_b_4';
name{9} = 'Ma_domain_c_1';name{10} = 'Ma_domain_c_2';name{11} = 'Ma_domain_c_3';name{12} = 'Ma_domain_c_4';

%% inlimt

face = 135;

%%% MPB90
% inlimt = [-0.9 -0.6 -0.1 0.1 0.6 0.9]; % 对应 3-3 0 斑
% inlimt = [-0.9 -0.6 -0.4 -0.2 0.6 0.9]; % 对应 3-3-1 斑
% inlimt = [-0.9 -0.6 -0.6 -0.4 0.6 0.9]; % 对应 3-3-2 斑
% inlimt = [-0.9 -0.6 -0.9 -0.6 0.6 0.9]; % 对应 3-3-3 斑
% inlimt = [-0.9 -0.6 0.4 0.6 0.6 0.9]; % 对应 3-32 斑
%%% MPB135
inlimt = [-0.1 0.1 -0.1 0.1 0.9 1.2]; %对应 400 斑
% inlimt = [-0.1 0.1 -0.4 -0.2 0.9 1.2]; %对应 40-1 斑
% inlimt = [-0.1 0.1 -0.8 -0.6 0.9 1.2]; %对应 40-2 斑
% inlimt = [-0.1 0.1 -1.2 -0.9 0.6 0.8]; %对应 30-4 斑
% inlimt = [-0.1 0.1 0.4 0.6 0.9 1.2]; %对应 402 斑
% inlimt = [-0.1 0.1 0.6 0.8 0.9 1.2]; %对应 403 斑
% inlimt = [-0.1 0.1 0.9 1.2 0.9 1.2]; %对应 404 斑
% inlimt = [-0.1 0.1 0.6 0.8 0.6 0.8]; %对应 303 斑
% inlimt = [-0.1 0.1 0.1 0.3 0.6 0.8]; %对应 103 斑
% inlimt = [0.1 0.3 0.1 0.3 0.6 0.8]; %对应 113 斑
%%% MPB45
% inlimt = [0.8 1.2 0.4 0.6 -0.1 0.1];
%% 


figure = figure('color',[1 1 1]);
for jj =  1:12
    if dd(jj)
        load([name{jj},'.mat']);
        eval(['data = ',name{jj},';']);
        
        %% 测试纯 Mc_incline 中的旋转强度
   
%         th = 0.1*pi/180;  
%         if jj == 10     
%            data = data*Euler(-th,th,0);
%         elseif jj == 12
%            data = data*Euler(th,-th,0);
%         end

        %%
        xlimt(1) = inlimt(1);xlimt(2) = inlimt(2);
        ylimt(1) = inlimt(3);ylimt(2) = inlimt(4);
        zlimt(1) = inlimt(5);zlimt(2) = inlimt(6);
        x = data(:,1);
        y = data(:,2);
        z = data(:,3);
        id_x = find((x>xlimt(1))&(x<xlimt(2)));
        id_y = find((y>ylimt(1))&(y<ylimt(2)));
        id_z = find((z>zlimt(1))&(z<zlimt(2)));
        id = intersect(intersect(id_x,id_y),id_z);
        indata = data(id,:);
%         if draw
            xin = indata(:,1); yin = indata(:,2); zin = indata(:,3);
%         figure;
            xlabel('H_x');ylabel('K_y');zlabel('L_z');
            for ii = 1:numel(xin)
                x0 = xin(ii);y0 = yin(ii);z0 = zin(ii);r = 0.0005;
                [x,y,z] = sphere;
                hold on;
                hiso = surf(r*x+x0,r*y+y0,r*z+z0);
                set(hiso,'EdgeColor','none','FaceColor',color{jj},'FaceAlpha',0.99);
                lighting phong
                light('position',[ 1,-1,-1])
                light('position',[ -1,1,1])
                hold on;
            end
            daspect([1,1,1]);hold on;
    end
    hold on;
end

grid on;axis on;

if face == 135
       view(90,0);%% for [H0L]面的观测
elseif face == 90
       view(90,-45);%% for [HKH]面的观测
elseif face == 45
       view(90,-90);%% for [0KL]面的观测
end

box on;