%% 参照参考文献：a = 4.00; b = 4.00; c = 4.03; incline = 89.85;90;90;
clc;clear;
%% 输入参数
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
filename = 'PMNPT_MA_all' 
a = 4.02;                         
b = 4.02;                          
c = 4.03; 
belta = 89.95*pi/180;
aa = acos(cos(belta)/(2.^(0.5)));bb = acos(cos(belta)/(2.^(0.5)));
     cc = pi/2; %% 认为底面的夹角为 pi/2
ss = [1 0 0;...
      cos(cc) sin(cc) 0;...
      cos(bb) (cos(aa)-cos(bb)*cos(cc))./sin(cc)...
      (1+2*cos(aa)*cos(bb)*cos(cc)-cos(aa).^2-cos(bb).^2-cos(cc).^2).^(0.5)./sin(cc)];
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
length = 9;                 

%% 获得晶格矢量

%%%% domain kind one
a1 = a*ss(1,1);a2 = 0;        a3 = 0;
b1 = b*ss(2,1);b2 = b*ss(2,2);b3 = 0;
c1 = c*ss(3,1);c2 = c*ss(3,2);c3 = c*ss(3,3);
L_0_1 = [a1 a2 a3;b1 b2 b3;c1 c2 c3];

%%%% domain kind two
% L_0_2 = [a1 a2 a3;b1 -b2 b3;c1 -c2 c3];

%% rotation
th = pi/2;
% rotate = [clock_K_th, anticlock_K_th, clock_H_th, anticlock_H_th, clock_K_bt, anticlock_K_bt, clock_H_bt, anticlock_H_bt];
% domain = cell(1,8);
%    if rotate(1)
       c = vpa(Euler(0,0,0));
       l = vpa(L_0_1*c);
       Ma_domain_c_1(:,:) = q_space(l,length,c);
       save('Ma_domain_c_1.mat','Ma_domain_c_1');
%    end
%    if rotate(2)
       c = vpa(Euler(0,0,th));
       l = vpa(L_0_1*c);
       Ma_domain_c_2(:,:) = q_space(l,length,c);
       save('Ma_domain_c_2.mat','Ma_domain_c_2');
%    end
%    if rotate(3)
       c = vpa(Euler(0,0,2*th));
       l = vpa(L_0_1*c);
       Ma_domain_c_3(:,:) = q_space(l,length,c);
       save('Ma_domain_c_3.mat','Ma_domain_c_3');
%    end
%    if rotate(4)
       c = vpa(Euler(0,0,-th));
       l = vpa(L_0_1*c);
       Ma_domain_c_4(:,:) = q_space(l,length,c);
       save('Ma_domain_c_4.mat','Ma_domain_c_4');

       
%% 
% Q_space_1 = [domain_1;domain_2;domain_3;domain_4];
ch = double(Euler(th,0,0));
Ma_domain_a_1(:,:) = double(Ma_domain_c_1*ch);
save('Ma_domain_a_1.mat','Ma_domain_a_1');
Ma_domain_a_2(:,:) = double(Ma_domain_c_2*ch);
save('Ma_domain_a_2.mat','Ma_domain_a_2');
Ma_domain_a_3(:,:) = double(Ma_domain_c_3*ch);
save('Ma_domain_a_3.mat','Ma_domain_a_3');
Ma_domain_a_4(:,:) = double(Ma_domain_c_4*ch);
save('Ma_domain_a_4.mat','Ma_domain_a_4');

ck = double(Euler(0,th,0));
Ma_domain_b_1(:,:) = double(Ma_domain_c_1*ck);
save('Ma_domain_b_1.mat','Ma_domain_b_1');
Ma_domain_b_2(:,:) = double(Ma_domain_c_2*ck);
save('Ma_domain_b_2.mat','Ma_domain_b_2');
Ma_domain_b_3(:,:) = double(Ma_domain_c_3*ck);
save('Ma_domain_b_3.mat','Ma_domain_b_3');
Ma_domain_b_4(:,:) = double(Ma_domain_c_4*ck);
save('Ma_domain_b_4.mat','Ma_domain_b_4');


% Q_space = [Q_space_1;Q_space_2;Q_space_3];
% save([filename,'.mat'],'Q_space');