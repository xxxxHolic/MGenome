%% 参照参考文献：a = 4.00; b = 4.00; c = 4.03; incline = 89.85;90;90;
clc;clear;
%% 输入参数
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
filename = 'PMNPT_R_all' 
a = 4.029;                         
belta = 0.05*pi/180; tt = 2.^(0.5);
a1 = a*cos(belta);   a2 = a*sin(belta)/tt;a3 = a*sin(belta)/tt;
b1 = a*sin(belta)/tt;b2 = a*cos(belta);   b3 = a*sin(belta)/tt;
c1 = a*sin(belta)/tt;c2 = a*sin(belta)/tt;c3 = a*cos(belta);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
length = 9;                 

%% 获得晶格矢量
%%%% domain kind one
L_0_1 = [a1 a2 a3;b1 b2 b3;c1 c2 c3];
%%%% domain kind two
% L_0_2 = [a1 a2 a3;b1 -b2 b3;c1 -c2 c3];

%% rotation
th = pi/2;
% rotate = [clock_K_th,anticlock_K_th, clock_H_th, anticlock_H_th, clock_K_bt, anticlock_K_bt, clock_H_bt, anticlock_H_bt];
% domain = cell(1,8);
%    if     rotate(1)
       c = vpa(Euler(0,0,0));
       l = vpa(L_0_1*c);
       R_domain_1(:,:) = q_space(l,length,c);
       save('R_domain_1.mat','R_domain_1');
%    end
%    if rotate(2)
       c = vpa(Euler(0,0,th));
       l = vpa(L_0_1*c);
       R_domain_2(:,:) = q_space(l,length,c);
       save('R_domain_2.mat','R_domain_2');
%    end
%    if rotate(3)
       c = vpa(Euler(0,0,2*th));
       l = vpa(L_0_1*c);
       R_domain_3(:,:) = q_space(l,length,c);
       save('R_domain_3.mat','R_domain_3');
%    end
%    if rotate(4)
       c = vpa(Euler(0,0,-th));
       l = vpa(L_0_1*c);
       R_domain_4(:,:) = q_space(l,length,c);
       save('R_domain_4.mat','R_domain_4');

       
%% 
% Q_space_1 = [domain_1;domain_2;domain_3;domain_4];

% ch = double(Euler(th,0,0));
% Ma_domain_a_1(:,:) = double(Ma_domain_c_1*ch);
% save('Ma_domain_a_1.mat','Ma_domain_a_1');
% Ma_domain_a_2(:,:) = double(Ma_domain_c_2*ch);
% save('Ma_domain_a_2.mat','Ma_domain_a_2');
% Ma_domain_a_3(:,:) = double(Ma_domain_c_3*ch);
% save('Ma_domain_a_3.mat','Ma_domain_a_3');
% Ma_domain_a_4(:,:) = double(Ma_domain_c_4*ch);
% save('Ma_domain_a_4.mat','Ma_domain_a_4');
% 
% ck = double(Euler(0,th,0));
% Ma_domain_b_1(:,:) = double(Ma_domain_c_1*ck);
% save('Ma_domain_b_1.mat','Ma_domain_b_1');
% Ma_domain_b_2(:,:) = double(Ma_domain_c_2*ck);
% save('Ma_domain_b_2.mat','Ma_domain_b_2');
% Ma_domain_b_3(:,:) = double(Ma_domain_c_3*ck);
% save('Ma_domain_b_3.mat','Ma_domain_b_3');
% Ma_domain_b_4(:,:) = double(Ma_domain_c_4*ck);
% save('Ma_domain_b_4.mat','Ma_domain_b_4');


% Q_space = [Q_space_1;Q_space_2;Q_space_3];
% save([filename,'.mat'],'Q_space');