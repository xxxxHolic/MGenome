%% The purpose of this code is used to combine different domain
clc;clear;
close all;
%% loading domain

M_a_1 = 1; M_a_2 = 1; M_a_3 = 1; M_a_4 = 1;
M_b_1 = 0; M_b_2 = 0; M_b_3 = 0; M_b_4 = 0; 
M_c_1 = 1; M_c_2 = 1; M_c_3 = 0; M_c_4 = 0;
%
%% The list

dd = [M_a_1 M_a_2 M_a_3 M_a_4 M_b_1 M_b_2 M_b_3 M_b_4 M_c_1 M_c_2 M_c_3 M_c_4];

%% colormap

color{1} = [1 0 0]; color{2} = [0 0 0]; color{3} = [0 0 1]; color{4} = [0 1 0];
color{5} = [0 1 1]; color{6} = [1 0 1]; color{7} = [1 1 0]; color{8} = [1 0.5 0]; 
color{9} = [0.6 0.2 0.2];  color{10} = [0.2 0.6 0.2]; 
color{11} = [0.2 0.2 0.6]; color{12} = [0.4 0.3 0.2]; 
% color{13} = [0.9 0.4 0.2];

% color = [0 0 1];
% 
% name{1} = 'T_a_domain_1';   name{2} = 'T_a_domain_2';    name{3} = 'T_a_domain_3';    name{4} = 'T_a_domain_4'; 
% name{5} = 'T_b_domain_1';   name{6} = 'T_b_domain_2';    name{7} = 'T_b_domain_3';    name{8} = 'T_b_domain_4';
% name{9} = 'T_c_domain_1';   name{10} = 'T_c_domain_2';   name{11} = 'T_c_domain_3';   name{12} = 'T_c_domain_4';
% name{13} = 'Mc_domain_a_1'; name{14} = 'Mc_domain_a_2';  name{15} = 'Mc_domain_a_3';  name{16} = 'Mc_domain_a_4'; 
% name{17} = 'Mc_domain_b_1'; name{18} = 'Mc_domain_b_2';  name{19} = 'Mc_domain_b_3';  name{20} = 'Mc_domain_b_4';
% name{21} = 'Mc_domain_c_1'; name{22} = 'Mc_domain_c_2';  name{23} = 'Mc_domain_c_3';  name{24} = 'Mc_domain_c_4';

name{1} = 'Mc_domain_a_1'; name{2} = 'Mc_domain_a_2';  name{3} = 'Mc_domain_a_3';  name{4} = 'Mc_domain_a_4'; 
name{5} = 'Mc_domain_b_1'; name{6} = 'Mc_domain_b_2';  name{7} = 'Mc_domain_b_3';  name{8} = 'Mc_domain_b_4';
name{9} = 'Mc_domain_c_1'; name{10} = 'Mc_domain_c_2'; name{11} = 'Mc_domain_c_3'; name{12} = 'Mc_domain_c_4';

%% inlimt
face = 135;
%%% MPB90
% inlimt = [0.6 0.9 -0.1 0.1 0.6 0.9]; % 对应 330 斑
% inlimt = [0.6 0.9  -0.4 -0.2 0.6 0.9]; % 对应 33-1 斑
% inlimt = [0.6 0.9 -0.6 -0.4 0.6 0.9]; % 对应 33-2 斑
% inlimt = [0.6 0.9 -0.9 -0.6 0.6 0.9]; % 对应 33-3 斑
% inlimt = [0.6 0.9 0.4 0.6 0.6 0.9]; % 对应 332斑
% inlimt = [0.4 0.6 0.4 0.6 0.4 0.6]; % 对应 222斑
% inlimt = [0.6 0.9 0.6 0.9 0.6 0.9]; % 对应 333 斑
% inlimt = [0.2 0.4 0.2 0.4 0.6 0.9]; % 对应 113 斑
%%% MPB135
inlimt = [-0.1 0.1 -0.1 0.1 0.9 1.2]; %对应 400 斑
%  inlimt = [-0.1 0.1 -0.4 -0.2 0.9 1.2]; %对应 40-1 斑
% inlimt = [-0.1 0.1 -0.8 -0.6 0.9 1.2]; %对应 40-2 斑
% % inlimt = [-0.1 0.1 -1.2 -0.9 0.6 0.8]; %对应 30-4 斑
% inlimt = [-0.1 0.1 0.4 0.6 0.9 1.2]; %对应 402 斑
% inlimt = [-0.1 0.1 0.6 0.8 0.9 1.2]; %对应 403 斑
% % inlimt = [-0.1 0.1 0.9 1.2 0.9 1.2]; %对应 404 斑
% inlimt = [-0.1 0.1 0.6 0.8 0.6 0.8]; %对应 303 斑
% inlimt = [-0.1 0.1 0.1 0.3 0.6 0.8]; %对应 103 斑
% inlimt = [-0.1 0.1 -0.3 -0.1 0.6 0.8]; %对应 -103 斑
% inlimt = [0.1 0.3 0.1 0.3 0.6 0.8]; %对应 113 斑
% inlimt = [-0.3 -0.1 -0.3 -0.1 0.6 0.8]; %对应 -1-13 斑
%%% MPB45
% inlimt = [0.9 1.2 -0.1 0.1 -0.1 0.1]; % 对应 040 斑
% inlimt = [-0.1 0.1 -0.1 0.1 0.9 1.2]; % 对应 004 斑
% inlimt = [0.9 1.2 0.2 0.4 -0.1 0.1]; % 对应 041 斑
% inlimt = [0.9 1.2 -0.4 -0.2 -0.1 0.1]; % 对应 04-1 斑
% inlimt = [0.6 0.8 -0.8 -0.6 -0.1 0.1]; % 对应 03-3 斑
% inlimt = [0.9 1.2 0.4  0.6 -0.1 0.1]; % 对应 042 斑
% inlimt = [0.9 1.2 -0.6 -0.4 -0.1 0.1]; % 对应 04-2 斑
%%

figure = figure('color',[1 1 1]);

% beta = 0*pi/180;
% % 
% rotatM(21,1:3) = [-beta 0 0];
% rotatM(22,1:3) = [0 -beta 0];
% rotatM(23,1:3) = [beta 0 0];
% rotatM(24,1:3) = [0 beta 0];
% rotatM(13,1:3) = [-beta 0 0];
% rotatM(14,1:3) = [0 0 -beta];
% rotatM(15,1:3) = [beta 0 0];
% rotatM(16,1:3) = [0 0 beta];
% rotatM(17,1:3) = [0 0 beta];
% rotatM(18,1:3) = [0 -beta 0];
% rotatM(19,1:3) = [0 0 -beta];
% rotatM(20,1:3) = [0 beta 0];

%% specal trying to cal the domain

th_1 = 0.15*pi./180;
th_2 = 0.05*pi./180;

for jj = 1:12

    if dd(jj)
        load([name{jj},'.mat']);
        eval(['data = ',name{jj},';']);
        

        if jj == 3 || jj == 4
           rotat = Euler(0,th_1,0);
           data = data*rotat;
        elseif jj == 5 || jj == 6
           rotat = Euler(0,-th_1,0);
           data = data*rotat;
        end
        
%         if jj == 5 
%             rotat = Euler(0,0,th_2);
%             data = data*rotat;
%         elseif jj == 6
%             rotat = Euler(0,0,-th_2);
%             data = data*rotat;
%         end
            

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
                x0 = xin(ii);y0 = yin(ii);z0 = zin(ii);r = 0.001;
                [x,y,z] = sphere;
                hold on;
                hiso = surf(r*x+x0,r*y+y0,r*z+z0);
%                 set(hiso,'EdgeColor','none','FaceColor',color,'FaceAlpha',0.8);
                set(hiso,'EdgeColor','none','FaceColor',color{jj},'FaceAlpha',0.8);
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
