%% The purpose of this code is used to combine different domain
clc;clear;
close all;
%% loading domain
% a_1 = 1; a_2 = 1; a_3 = 1; a_4 = 1;
% b_1 = 1; b_2 = 1; b_3 = 1; b_4 = 1;
% c_1 = 1; c_2 = 1; c_3 = 1; c_4 = 1;

R_1 = 1; R_2 = 1; R_3 = 1; R_4 = 1;

% T_a_1 = 0; T_a_2 = 0; T_a_4 = 0;
% T_b_1 = 0; T_b_2 = 0; T_c_1 = 0;

dd = [R_1 R_2 R_3 R_4];
color{1} = [1 0 0]; color{2} = [0 0 0]; color{3} = [0 0 1]; color{4} = [0 1 0];
% color{5} = [0 1 1]; color{6} = [1 0 1]; color{7} = [1 1 0]; color{8} = [1 0.5 0]; color{9} = [0.6 0.2 0.2];
% color{10} = [0.2 0.6 0.2]; color{11} = [0.2 0.2 0.6]; color{12} = [0.4 0.3 0.2];  
% color{13} = [0.3 0.4 0.2]; color{14} = [0.3 0.2 0.4]; color{15} = [0.9 0.3 0.4];
% color{16} = [0.9 0.7 0.6]; color{17} = [0.7 0.9 0.6]; color{18} = [0.7 0.6 0.9];   
% name = cell(18);
name{1} = 'R_domain_1';name{2} = 'R_domain_2'; name{3} = 'R_domain_3'; name{4} = 'R_domain_4';
% name{5} = 'Ma_domain_b_1';name{6} = 'Ma_domain_b_2'; name{7} = 'Ma_domain_b_3'; name{8} = 'Ma_domain_b_4';
% name{9} = 'Ma_domain_c_1';name{10} = 'Ma_domain_c_2';name{11} = 'Ma_domain_c_3';name{12} = 'Ma_domain_c_4';
% name{13} = 'T_a_domain_1';name{14} = 'T_a_domain_2'; name{15} = 'T_a_domain_4'; name{16} = 'T_b_domain_1';
% name{17} = 'T_b_domain_2';name{18} = 'T_c_domain_1';

%% inlimt
%%% MPB90
inlimt = [-0.9 -0.6 -0.1 0.1 0.6 0.9]; % 对应 3-3 0 斑
% inlimt = [-0.9 -0.6 -0.4 -0.2 0.6 0.9]; % 对应 3-3-1 斑
% inlimt = [-0.9 -0.6 -0.6 -0.4 0.6 0.9]; % 对应 3-3-2 斑
% inlimt = [-0.9 -0.6 -0.9 -0.6 0.6 0.9]; % 对应 3-3-3 斑
% inlimt = [-0.9 -0.6 0.4 0.6 0.6 0.9]; % 对应 3-32斑
%%% MPB135
% inlimt = [-0.1 0.1 -0.1 0.1 0.9 1.2]; %对应 400 斑
% inlimt = [-0.1 0.1 -0.4 -0.2 0.9 1.2]; %对应 40-1 斑
% inlimt = [-0.1 0.1 -0.8 -0.6 0.9 1.2]; %对应 40-2 斑
% inlimt = [-0.1 0.1 -1.2 -0.9 0.6 0.8]; %对应 30-4 斑
% inlimt = [-0.1 0.1 0.4 0.6 0.9 1.2]; %对应 402 斑
% inlimt = [-0.1 0.1 0.2 0.4 0.9 1.2]; %对应 401 斑
% inlimt = [-0.1 0.1 0.6 0.8 0.9 1.2]; %对应 403 斑
% inlimt = [-0.1 0.1 0.9 1.2 0.9 1.2]; %对应 404 斑
% inlimt = [-0.1 0.1 0.6 0.8 0.6 0.8]; %对应 303 斑
% inlimt = [-0.1 0.1 0.1 0.3 0.6 0.8]; %对应 103 斑
% inlimt = [0.1 0.3 0.1 0.3 0.6 0.8]; %对应 113 斑
%%% MPB45
% inlimt = [0.8 1.2 0.4 0.6 -0.1 0.1];
%% 


figure = figure('color',[1 1 1]);
for jj =  1:4
    if dd(jj)
        load([name{jj},'.mat']);
        eval(['data = ',name{jj},';']);
        
        %% 测试纯 Mc_incline 中的旋转强度
% %        th = 0.1*pi/180;       
% %           if jj == 1
% %             data = data*Euler(-th,0,0);
% %           elseif jj == 11
% %             data = data*Euler(th,0,0);
% %           end
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
                x0 = xin(ii);y0 = yin(ii);z0 = zin(ii);r = 0.001;
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
% grid off;axis off;
grid on;axis on;
view(90,45);%% 
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
    
