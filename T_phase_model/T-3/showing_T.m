%% The purpose of this code is used to combine different domain
clc;clear;
close all;
%% loading domain
% 
% T_a_1 = 1; T_a_2 = 0; T_a_3 = 0; T_a_4 = 0;
% T_b_1 = 1; T_b_2 = 1; T_b_3 = 0; T_b_4 = 0; 
% T_c_1 = 1; T_c_2 = 1; T_c_3 = 1; T_c_4 = 1;
% T_c_4 = 1;
% T_c_3 = 1;
T_a_1 = 1; T_a_2 = 0; T_a_3 = 0; T_a_4 = 0;
T_b_1 = 1; T_b_2 = 1; T_b_3 = 0; T_b_4 = 0; 
T_c_1 = 1; T_c_2 = 1; T_c_3 = 1; T_c_4 = 1;
%% The list
% dd = [T_c_3 T_c_4];
% dd = [T_a_1 T_a_2 T_a_3 T_a_4 T_b_1 T_b_2 T_b_3 T_b_4 T_c_1 T_c_2 T_c_3 T_c_4];
dd = [T_a_1 T_c_1 T_c_2 T_c_3 T_b_1 T_b_2];
%% colormap

color{1} = [1 0 0]; color{2} = [0 0 0]; color{3} = [0 0 1]; color{4} = [0 1 0];
color{5} = [0 1 1]; color{6} = [1 0 1]; 
color{7} = [1 1 0]; color{8} = [1 0.5 0]; 
color{9} = [0.6 0.2 0.2]; color{10} = [0.2 0.6 0.2]; color{11} = [0.2 0.2 0.6]; color{12} = [0.4 0.3 0.2];  

% name{1} = 'T_a_domain_1'; name{2} = 'T_a_domain_2'; name{3} = 'T_a_domain_3'; name{4} = 'T_a_domain_4'; 
% name{5} = 'T_b_domain_1'; name{6} = 'T_b_domain_2'; name{7} = 'T_b_domain_3'; name{8} = 'T_b_domain_4';
% name{9} = 'T_c_domain_1'; name{10} = 'T_c_domain_2'; name{11} = 'T_c_domain_3'; name{12} = 'T_c_domain_4';


name{1} = 'T_a_domain_1_T_2'; name{2} = 'T_c_domain_1_T_2'; 
name{3} = 'T_c_domain_2_T_2'; name{4} = 'T_c_domain_3_T_2'; 
name{5} = 'T_b_domain_1_T_2'; name{6} = 'T_b_domain_2_T_2'; 
% name{7} = 'T_b_domain_3'; name{8} = 'T_b_domain_4';
% name{9} = 'T_c_domain_1'; name{10} = 'T_c_domain_2'; name{11} = 'T_c_domain_3'; name{12} = 'T_c_domain_4';

%% inlimt
face = 45;
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
% inlimt = [-0.1 0.1 -0.1 0.1 0.9 1.2]; %对应 400 斑
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
inlimt = [0.9 1.2 -0.1 0.1 -0.1 0.1]; % 对应 040 斑
% inlimt = [-0.1 0.1 -0.1 0.1 0.9 1.2]; % 对应 004 斑
% inlimt = [0.9 1.2 0.2 0.4 -0.1 0.1]; % 对应 041 斑
% inlimt = [0.9 1.2 -0.4 -0.2 -0.1 0.1]; % 对应 04-1 斑
% inlimt = [0.6 0.8 -0.8 -0.6 -0.1 0.1]; % 对应 03-3 斑
% inlimt = [0.9 1.2 0.4  0.6 -0.1 0.1]; % 对应 042 斑
% inlimt = [0.9 1.2 -0.6 -0.4 -0.1 0.1]; % 对应 04-2 斑
%%

figure = figure('color',[1 1 1]);

%% specal trying to cal the domain
% th = 0.473*180./pi;
for jj = 1:6

    if dd(jj)
        load([name{jj},'.mat']);
%         eval(['data = ',name{jj},';']);
        
%           th = 0.2*pi/180;       
%           if jj == 5
%             data = data*Euler(th,0,0);
%           end
% %           
%           if jj == 6
%             data = data*Euler(-th,0,0);
%           end
          
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
% grid off;axis off;
% axis([inlimt(1) inlimt(2) inlimt(3) inlimt(4) inlimt(5) inlimt(6)]);

grid on;axis on;
if face == 135
      view(90,0);%% for [H0L]面的观测
elseif face == 90
       view(90,-45);%% for [HKH]面的观测
elseif face == 45
       view(90,-90);%% for [0KL]面的观测
end
box on;

% % % % % % figure;
% % % % % % for kk = 1:18
% % % % % %     if dd(kk)
% % % % % %         eval(['data = ',name{kk},';']);
% % % % % % %         'shit!'
% % % % % %         scatter3(data(:,1),data(:,2),data(:,3),5,'r','filled');hold on;
% % % % % %     end
% % % % % %     hold on;
% % % % % % end
% % % % % % hold on;
% % % % % % daspect([1,1,1]);
% % % % % % xlabel('H');ylabel('K');zlabel('L');
% % % % % % grid on;box on;


% % % % figure;
% % % if a_1;load('Mc_domain_a_1.mat');end;
% % % % scatter3(Mc_domain_a_1(:,1),Mc_domain_a_1(:,2),Mc_domain_a_1(:,3),5,'MarkerFaceColor',[0 0 0],'filled');
% % % % hold on;
% % % if a_2;load('Mc_domain_a_2.mat');end;
% % % % scatter3(Mc_domain_a_2(:,1),Mc_domain_a_2(:,2),Mc_domain_a_2(:,3),5,'MarkerFaceColor',[0 0 1],'filled');
% % % % hold on;
% % % if a_3;load('Mc_domain_a_3.mat');end;
% % % % scatter3(Mc_domain_a_3(:,1),Mc_domain_a_3(:,2),Mc_domain_a_3(:,3),5,'MarkerFaceColor',[0 1 0],'filled');
% % % % hold on;
% % % if a_4;load('Mc_domain_a_4.mat');end;
% % % % scatter3(Mc_domain_a_4(:,1),Mc_domain_a_4(:,2),Mc_domain_a_4(:,3),5,'MarkerFaceColor',[0 0 1],'filled');
% % % % hold on;
% % % if b_1;load('Mc_domain_b_1.mat');end;
% % % % scatter3(Mc_domain_b_1(:,1),Mc_domain_b_1(:,2),Mc_domain_b_1(:,3),5,'MarkerFaceColor',[0 0 1],'filled');
% % % % hold on;
% % % if b_2;load('Mc_domain_b_2.mat');end;
% % % % scatter3(Mc_domain_b_2(:,1),Mc_domain_b_2(:,2),Mc_domain_b_2(:,3),5,'MarkerFaceColor',[0 1 1],'filled');
% % % % hold on;
% % % if b_3;load('Mc_domain_b_3.mat');end;
% % % % scatter3(Mc_domain_b_3(:,1),Mc_domain_b_3(:,2),Mc_domain_b_3(:,3),5,'MarkerFaceColor',[0 0 1],'filled');
% % % % hold on;
% % % if b_4;load('Mc_domain_b_4.mat');end;
% % % % scatter3(Mc_domain_b_4(:,1),Mc_domain_b_4(:,2),Mc_domain_b_4(:,3),5,'MarkerFaceColor',[1 0 0],'filled');
% % % % hold on;
% % % if c_1;load('Mc_domain_c_1.mat');end;
% % % % scatter3(Mc_domain_c_1(:,1),Mc_domain_c_1(:,2),Mc_domain_c_1(:,3),5,'MarkerFaceColor',[1 1 0],'filled');
% % % % hold on;
% % % if c_1;load('Mc_domain_c_2.mat');end;
% % % % scatter3(Mc_domain_c_2(:,1),Mc_domain_c_2(:,2),Mc_domain_c_2(:,3),5,'MarkerFaceColor',[1 1 0],'filled');
% % % % hold on;
% % % if c_1;load('Mc_domain_c_3.mat');end;
% % % % scatter3(Mc_domain_c_3(:,1),Mc_domain_c_3(:,2),Mc_domain_c_3(:,3),5,'MarkerFaceColor',[1 1 0],'filled');
% % % % hold on;
% % % if c_1;load('Mc_domain_c_4.mat');end;
% % % % scatter3(Mc_domain_c_4(:,1),Mc_domain_c_4(:,2),Mc_domain_c_4(:,3),5,'MarkerFaceColor',[1 1 0],'filled');
% % % % hold on;
% % % %%%%%%%%%%%%%%%
% % % if T_a_1;load('T_a_domain_1.mat');end;
% % % % scatter3(T_a_domain_1(:,1),T_a_domain_1(:,2),T_a_domain_1(:,3),5,'MarkerFaceColor',[1 1 0],'filled');
% % % % hold on;
% % % if T_a_2;load('T_a_domain_2.mat');end;
% % % % scatter3(T_a_domain_2(:,1),T_a_domain_2(:,2),T_a_domain_2(:,3),5,'MarkerFaceColor',[1 1 0],'filled');
% % % % hold on;
% % % % load('T_a_domain_3.mat');
% % % if T_a_4;load('T_a_domain_4.mat');end;
% % % % scatter3(T_a_domain_4(:,1),T_a_domain_4(:,2),T_a_domain_4(:,3),5,'MarkerFaceColor',[1 0.5 0],'filled');
% % % % hold on;
% % % if T_b_1;load('T_b_domain_1.mat');end;
% % % % scatter3(T_b_domain_1(:,1),T_b_domain_1(:,2),T_b_domain_1(:,3),5,'MarkerFaceColor',[1 1 0],'filled');
% % % % hold on;
% % % if T_b_2;load('T_b_domain_2.mat');end;
% % % % scatter3(T_b_domain_2(:,1),T_b_domain_2(:,2),T_b_domain_2(:,3),5,'MarkerFaceColor',[1 1 0],'filled');
% % % % hold on;
% % % if T_c_1;load('T_c_domain_1.mat');end;
% % % % scatter3(T_c_domain_1(:,1),T_c_domain_1(:,2),T_c_domain_1(:,3),5,'MarkerFaceColor',[0.5 1 0],'filled');
% % % % hold on;
% % % % load('T_c_domain_2.mat');
% % % % % daspect([1,1,1]);
% % % % % xlabel('H');ylabel('K');zlabel('L');
% % % %% Plot domain
% % % for ii = 1:18
% % %     if 
    
