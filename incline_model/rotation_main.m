%% a = 1; b = 1; c = 0.988; rotate 5. clock about K
clc;clear;
%% 输入参数
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
filename = 'x_PTO_rotation_all' %%%%%
a = 1;                          %%%%%
b = 1;                          %%%%%
c = 0.998;                      %%%%%
th = 0.0071; bt = 0.0035;       %%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clock_K_th = 1;             %%%%%
anticlock_K_th = 1;         %%%%%
clock_H_th = 1;             %%%%%
anticlock_H_th = 1;         %%%%%
clock_K_bt = 1;             %%%%%
anticlock_K_bt = 1;         %%%%%
clock_H_bt = 1;             %%%%%
anticlock_H_bt = 1;         %%%%%
length = 5;                 %%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%% 获得晶格矢量
a1 = a;a2 = 0;a3 = 0;
b1 = 0;b2 = b;b3 = 0;
c1 = 0;c2 = 0;c3 = c;
L_0 = [a1 a2 a3;b1 b2 b3;c1 c2 c3];


%% rotation
bt = bt + pi/2 
rotate = [clock_K_th,anticlock_K_th, clock_H_th, anticlock_H_th, clock_K_bt, anticlock_K_bt, clock_H_bt, anticlock_H_bt];
% domain = cell(1,8);
   if     rotate(1)
       c = vpa(Euler(0,-th,0));
       l = vpa(L_0*c);
       domain_1(:,:) = q_space(l,length);
   end
   if rotate(2)
       c = vpa(Euler(0, th,0));
       l = vpa(L_0*c);
       domain_2(:,:) = q_space(l,length);
   end
   if rotate(3)
       c = vpa(Euler(-th,0,0));
       l = vpa(L_0*c);
       domain_3(:,:) = q_space(l,length);
   end
   if rotate(4)
       c = vpa(Euler( th,0,0));
       l = vpa(L_0*c);
       domain_4(:,:) = q_space(l,length);
   end
   if rotate(5)
       c = vpa(Euler(0,-bt,0));
       l = vpa(L_0*c);
       domain_5(:,:) = q_space(l,length);
   end
   if rotate(6)
       c = vpa(Euler(0, bt,0));
       l = vpa(L_0*c);
       domain_6(:,:) = q_space(l,length);
   end
   if rotate(7)
       c = vpa(Euler(-bt,0,0));
       l = vpa(L_0*c);
       domain_7(:,:) = q_space(l,length);
   end
   if rotate(8)
       c = vpa(Euler( bt,0,0));
       l = vpa(L_0*c);
       domain_8(:,:) = q_space(l,length);
   end
       
%% 
Q_space = [domain_1;domain_2;domain_3;domain_4;domain_5;domain_6;domain_7;domain_8;];
save([filename,'.mat'],'Q_space');