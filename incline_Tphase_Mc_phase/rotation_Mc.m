%% 参照参考文献：a = 4.00; b = 4.00; c = 4.03; incline = 89.85;90;90;
clc;clear;
%% 输入参数
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
filename = 'PMNPT_incline_all' 
a = 4.00;                         
b = 4.01;                          
c = 4.03;                     
aa = 90.05*pi/180; bb = pi/2;cc = pi/2; 
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
% L_0_2 = [a1 a2 a3;b1 -b2 b3;c1 -c2 c3];

%% rotation
th = pi/2;
% rotate = [clock_K_th,anticlock_K_th, clock_H_th, anticlock_H_th, clock_K_bt, anticlock_K_bt, clock_H_bt, anticlock_H_bt];
% domain = cell(1,8);
%    if     rotate(1)
       c = vpa(Euler(0,0,0));
       l = vpa(L_0_1*c);
       Mc_domain_c_1(:,:) = q_space(l,length,c);
       save('Mc_domain_c_1.mat','Mc_domain_c_1');
%    end
%    if rotate(2)
       c = vpa(Euler(0,0,th));
       l = vpa(L_0_1*c);
       Mc_domain_c_2(:,:) = q_space(l,length,c);
       save('Mc_domain_c_2.mat','Mc_domain_c_2');
%    end
%    if rotate(3)
       c = vpa(Euler(0,0,2*th));
       l = vpa(L_0_1*c);
       Mc_domain_c_3(:,:) = q_space(l,length,c);
       save('Mc_domain_c_3.mat','Mc_domain_c_3');
%    end
%    if rotate(4)
       c = vpa(Euler(0,0,-th));
       l = vpa(L_0_1*c);
       Mc_domain_c_4(:,:) = q_space(l,length,c);
       save('Mc_domain_c_4.mat','Mc_domain_c_4');
%    end
% % %    if rotate(5)
%        C_H = vpa(Euler(th,0,0));
% %        l = vpa(L_0_2*c);
%        domain_5(:,1:3) = domain_1(:,1:3)*C_H;
%        domain_5(:,4:6) = round(domain_1(:,4:6)*C_H);
%        domain_6(:,1:3) = domain_2(:,1:3)*C_H;
%        domain_6(:,4:6) = round(domain_2(:,4:6)*C_H);
%        domain_7(:,1:3) = domain_3(:,1:3)*C_H;
%        domain_7(:,4:6) = round(domain_3(:,4:6)*C_H);
%        domain_8(:,1:3) = domain_4(:,1:3)*C_H;
%        domain_8(:,4:6) = round(domain_4(:,4:6)*C_H);
%        
%        C_K = vpa(Euler(0,th,0));
%        
%         domain_9(:,1:3) = domain_1(:,1:3)*C_K;
%         domain_9(:,4:6) = round(domain_1(:,4:6)*C_K);
%        domain_10(:,1:3) = domain_2(:,1:3)*C_K;
%        domain_10(:,4:6) = round(domain_2(:,4:6)*C_K);
%        domain_11(:,1:3) = domain_3(:,1:3)*C_K;
%        domain_11(:,4:6) = round(domain_3(:,4:6)*C_K);
%        domain_12(:,1:3) = domain_4(:,1:3)*C_K;
%        domain_12(:,4:6) = round(domain_4(:,4:6)*C_K);
% % %    end
% % %    if rotate(6)
% %        c = vpa(Euler(0,0,th));
% %        l = vpa(L_0_2*c);
% %        domain_6(:,:) = q_space(l,length);
% % %    end
% % %    if rotate(7)
% %        c = vpa(Euler(0,0,2*th));
% %        l = vpa(L_0_2*c);
% %        domain_7(:,:) = q_space(l,length);
% % %    end
% % %    if rotate(8)
% %        c = vpa(Euler(0,0,-th));
% %        l = vpa(L_0_2*c);
% %        domain_8(:,:) = q_space(l,length);
% % %    end
       
%% 
% Q_space_1 = [domain_1;domain_2;domain_3;domain_4];


ch = double(Euler(th,0,0));
Mc_domain_a_1(:,:) = double(Mc_domain_c_1*ch);
save('Mc_domain_a_1.mat','Mc_domain_a_1');
Mc_domain_a_2(:,:) = double(Mc_domain_c_2*ch);
save('Mc_domain_a_2.mat','Mc_domain_a_2');
Mc_domain_a_3(:,:) = double(Mc_domain_c_3*ch);
save('Mc_domain_a_3.mat','Mc_domain_a_3');
Mc_domain_a_4(:,:) = double(Mc_domain_c_4*ch);
save('Mc_domain_a_4.mat','Mc_domain_a_4');

ck = double(Euler(0,th,0));
Mc_domain_b_1(:,:) = double(Mc_domain_c_1*ck);
save('Mc_domain_b_1.mat','Mc_domain_b_1');
Mc_domain_b_2(:,:) = double(Mc_domain_c_2*ck);
save('Mc_domain_b_2.mat','Mc_domain_b_2');
Mc_domain_b_3(:,:) = double(Mc_domain_c_3*ck);
save('Mc_domain_b_3.mat','Mc_domain_b_3');
Mc_domain_b_4(:,:) = double(Mc_domain_c_4*ck);
save('Mc_domain_b_4.mat','Mc_domain_b_4');


% Q_space = [Q_space_1;Q_space_2;Q_space_3];
% save([filename,'.mat'],'Q_space');