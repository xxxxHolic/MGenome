%% The purpose of this code is used to combine different domain
clc;clear;
% close all;
%% loading domain
% 
T_a_1 = 1; T_a_2 = 1; T_a_3 = 0; T_a_4 = 0;
T_b_1 = 1; T_b_2 = 1; T_b_3 = 1; T_b_4 = 1; 
T_c_1 = 1; T_c_2 = 1; T_c_3 = 0; T_c_4 = 0;
% T_c_4 = 1;
% T_c_3 = 1;

%% The list
% dd = [T_c_3 T_c_4];
dd = [T_a_1 T_a_2 T_a_3 T_a_4 T_b_1 T_b_2 T_b_3 T_b_4 T_c_1 T_c_2 T_c_3 T_c_4];

%% colormap

color{1} = [1 0 0]; color{2} = [0 0 0]; color{3} = [0 0 1]; color{4} = [0 1 0];
color{5} = [0 1 1]; color{6} = [1 0 1]; color{7} = [1 1 0]; color{8} = [1 0.5 0]; 
color{9} = [0.6 0.2 0.2]; color{10} = [0.2 0.6 0.2]; color{11} = [0.2 0.2 0.6]; color{12} = [0.4 0.3 0.2];  

name{1} = 'T_a_domain_1'; name{2} = 'T_a_domain_2'; name{3} = 'T_a_domain_3'; name{4} = 'T_a_domain_4'; 
name{5} = 'T_b_domain_1'; name{6} = 'T_b_domain_2'; name{7} = 'T_b_domain_3'; name{8} = 'T_b_domain_4';
name{9} = 'T_c_domain_1'; name{10} = 'T_c_domain_2'; name{11} = 'T_c_domain_3'; name{12} = 'T_c_domain_4';

%% inlimt
%%% MPB90
% inlimt = [0.6 0.9 -0.1 0.1 0.6 0.9];  % 对应 330 斑
% inlimt = [0.6 0.9  -0.4 -0.2 0.6 0.9];% 对应 33-1 斑
% inlimt = [0.6 0.9 -0.6 -0.4 0.6 0.9]; % 对应 33-2 斑
% inlimt = [0.6 0.9 -0.9 -0.6 0.6 0.9]; % 对应 33-3 斑
% inlimt = [0.6 0.9 0.4 0.6 0.6 0.9];   % 对应 332 斑
% inlimt = [0.6 0.9 0.6 0.9 0.6 0.9];   % 对应 333 斑
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
% inlimt = [0.9 1.2 0.4  0.6 -0.1 0.1]; % 对应 042 斑
% inlimt = [0.9 1.2 -0.6 -0.4 -0.1 0.1]; % 对应 04-2 斑
%%

figure = figure('color',[1 1 1]);
%% specal trying to cal the domain
face = input('Which face will be observed:');
while 1

ss = input('Which mode will be rotated:','s');
if strcmp(ss,'N')
   rotat{1} = 0;
   rotatM(1,1:3) = 0;
   rotat{2} = 0;
   rotatM(2,1:3) = 0;
   rotat{3} = 0;
   rotatM(3,1:3) = 0;
   rotat{4} = 0;
   rotatM(4,1:3) = 0;
else
   sss = input('The rotation matrix is:');
   rotat{1} = ss;
   rotatM(1,1:3) = sss;
end
ss = input('Is there any mode else:','s');
if strcmp(ss,'N')
   rotat{2} = 0;
   rotatM(2,1:3) = 0;
   rotat{3} = 0;
   rotatM(3,1:3) = 0;
   rotat{4} = 0;
   rotatM(4,1:3) = 0;
else
   rotat{2} = ss;
   sss = input('The rotation matrix is:');
   rotatM(2,:) = sss;
   ss = input('Is there any mode else:','s');
   if strcmp(ss,'N')
      rotat{3} = 0;
      rotatM(3,:) = 0;
      rotat{4} = 0;
      rotatM(4,:) = 0;
   else
      rotat{3} = ss;
      sss = input('The rotation matrix is:');
      rotatM(3,:) = sss;
      ss = input('Is there any mode else:','s');
      if strcmp(ss,'N')
          rotat{4} = 0;
          rotatM(4,:) = 0;
      else
          rotat{4} = ss;
          sss = input('The rotation matrix is:');
          rotatM(4,:) = sss;
      end
   end
end
%%

for jj = 1:12
    if dd(jj)
        load([name{jj},'.mat']);
        eval(['data = ',name{jj},';']);
        
        for ii = 1:4
            if strcmp(name{jj},rotat{ii})
                cc = double(Euler(rotatM(ii,1),rotatM(ii,2),rotatM(ii,3)));
                data = double(data*cc); 
            end
        end
             
%           th = 0.2*pi/180;       
%           if jj == 8
%             data = data*Euler(th,0,0);
%           end
%           
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
clf;
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
end