%% a = 1; b = 1; c = 0.988; incline = 1.561;1.552;1.563;
clc;clear;
%% 输入参数
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
filename = 'x_SRO_incline_all' 
a = 3.905;                         
b = 3.905;                          
c = 3.964;                     
aa = 89*pi/180; bb = 90*pi/180;cc = pi/2; 
ss = [1 0 0;...
      cos(cc) sin(cc) 0;...
      cos(bb) (cos(aa)-cos(bb)*cos(cc))./sin(cc)...
      (1+2*cos(aa)*cos(bb)*cos(cc)-cos(aa).^2-cos(bb).^2-cos(cc).^2).^(0.5)./sin(cc)];
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
length = 9;                 

%% 获得晶格矢量

%%%% domain kind one
a1 = a*ss(1,1);a2 = 0;        a3 = 0;
b1 = b*ss(2,1);b2 = b*ss(2,2);b3 = 0;
c1 = c*ss(3,1);c2 = c*ss(3,2);c3 = c*ss(3,3);
L_0_1 = [a1 a2 a3;b1 b2 b3;c1 c2 c3];

%%%% domain kind two
L_0_2 = [a1 a2 a3;b1 -b2 b3;c1 -c2 c3];

%% rotation
th = pi/2;
% rotate = [clock_K_th,anticlock_K_th, clock_H_th, anticlock_H_th, clock_K_bt, anticlock_K_bt, clock_H_bt, anticlock_H_bt];
% domain = cell(1,8);
%    if     rotate(1)
       c = vpa(Euler(0,0,0));
       l = vpa(L_0_1*c);
       domain_1(:,:) = q_space(l,length);
%    end
%    if rotate(2)
       c = vpa(Euler(0,0,th));
       l = vpa(L_0_1*c);
       domain_2(:,:) = q_space(l,length);
%    end
%    if rotate(3)
       c = vpa(Euler(0,0,2*th));
       l = vpa(L_0_1*c);
       domain_3(:,:) = q_space(l,length);
%    end
%    if rotate(4)
       c = vpa(Euler(0,0,-th));
       l = vpa(L_0_1*c);
       domain_4(:,:) = q_space(l,length);
%    end
%    if rotate(5)
       c = vpa(Euler(0,0,0));
       l = vpa(L_0_2*c);
       domain_5(:,:) = q_space(l,length);
%    end
%    if rotate(6)
       c = vpa(Euler(0,0,th));
       l = vpa(L_0_2*c);
       domain_6(:,:) = q_space(l,length);
%    end
%    if rotate(7)
       c = vpa(Euler(0,0,2*th));
       l = vpa(L_0_2*c);
       domain_7(:,:) = q_space(l,length);
%    end
%    if rotate(8)
       c = vpa(Euler(0,0,-th));
       l = vpa(L_0_2*c);
       domain_8(:,:) = q_space(l,length);
%    end
       
%% 
Q_space = [domain_1;domain_2;domain_3;domain_4;domain_5;domain_6;domain_7;domain_8;];
save([filename,'.mat'],'Q_space');