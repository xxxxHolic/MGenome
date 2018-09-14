%% 参照参考文献：a = 4.00; b = 4.00; c = 4.03; incline = 90;90;90;
clc;clear;
%% 输入参数
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
filename = 'PMNPT_T_a_c'; 

a = 3.99;                         
b = 3.99;                          
c = 4.04;


% a = 4.00;                         
% b = 4.00;                          
% c = 4.03;                     
aa = pi/2; bb = pi/2;cc = pi/2; 
% ss = [1 0 0;...
%       cos(cc) sin(cc) 0;...
%       cos(bb) (cos(aa)-cos(bb)*cos(cc))./sin(cc)...
%       (1+2*cos(aa)*cos(bb)*cos(cc)-cos(aa).^2-cos(bb).^2-cos(cc).^2).^(0.5)./sin(cc)];
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
length = 9;                 

%% 获得晶格矢量

%%%% domain kind one
% a1 = a*ss(1,1);a2 = 0;        a3 = 0;
% b1 = b*ss(2,1);b2 = b*ss(2,2);b3 = 0;
% c1 = c*ss(3,1);c2 = c*ss(3,2);c3 = c*ss(3,3);
L_0_1 = [a 0 0;0 b 0;0 0 c];
L_0_2 = [a 0 0;0 -c 0;0 0 b];
%%%% domain kind two
th = pi/2;
c = double(Euler(th,0,0));
L_0_2 = double(L_0_1*c);
c = double(Euler(0,th,0));
L_0_3 = double(L_0_2*c);
%% rotation

th_c = 0.4*pi/180;
th_a = 0.2*pi/180;
% rotate = [clock_K_th,anticlock_K_th, clock_H_th, anticlock_H_th, clock_K_bt, anticlock_K_bt, clock_H_bt, anticlock_H_bt];
% domain = cell(1,8);
%    if     rotate(1)
       c = vpa(Euler(th_a,0,0));
       l_c_1 = vpa(L_0_1*c);
       T_c_domain_1(:,:) = q_space(l_c_1,length,c);
       save('T_c_domain_1.mat','T_c_domain_1');
       
       c = vpa(Euler(-th_a,0,0));
       l_c_2 = vpa(L_0_1*c);
       T_c_domain_2(:,:) = q_space(l_c_2,length,c);
       save('T_c_domain_2.mat','T_c_domain_2');
       
%        c = vpa(Euler(th_a,0,0));
%        l = vpa(L_0_1*c);
%        T_c_domain_1(:,:) = q_space(l,length,c);
%        save('T_c_domain_3.mat','T_c_domain_1');
%    end
%    if rotate(2)
       c = vpa(Euler(0,pi/2,0));
       l = vpa(l_c_1*c);
       T_b_domain_1(:,:) = q_space(l,length,c);
       save('T_b_domain_1.mat','T_b_domain_1');
%%% 
       c = vpa(Euler(0,pi/2,0));
       l = vpa(l_c_2*c);
       T_b_domain_2(:,:) = q_space(l,length,c);
       save('T_b_domain_2.mat','T_b_domain_2');
% %    end
% %    if rotate(4)


       c = vpa(Euler(pi/2-th_c,0,0));
       l = vpa(L_0_1*c);
       T_a_domain_4(:,:) = q_space(l,length,c);
       save('T_a_domain_4.mat','T_a_domain_4');
%    end

       c = vpa(Euler(pi/2+th_c,0,0));
       l = vpa(L_0_1*c);
       T_a_domain_3(:,:) = q_space(l,length,c);
       save('T_a_domain_3.mat','T_a_domain_3');
             
       c = vpa(Euler(0,0,th_c));
       l = vpa(L_0_2*c);
       T_a_domain_2(:,:) = q_space(l,length,c);
       save('T_a_domain_2.mat','T_a_domain_2');
       
       c = vpa(Euler(0,0,-th_c));
       l = vpa(L_0_2*c);
       T_a_domain_1(:,:) = q_space(l,length,c);
       save('T_a_domain_1.mat','T_a_domain_1');
%        c = vpa(Euler(pi/2,0,0));
%        l_2 = vpa(L_0_1*c);
%        c = vpa(Euler(0,0,th_c))
%        l_2 = vpa(L_0_1*c);
%        T_a_domain_2(:,:) = q_space(l_2,length,c);
%        save('T_a_domain_2.mat','T_a_domain_2');
%        
%        c = vpa(Euler(pi/2,0,0));
%        l_3 = vpa(L_0_1*c);
%        c = vpa(Euler(0,0,-th_c))
%        l_3 = vpa(L_0_1*c);
%        T_a_domain_1(:,:) = q_space(l_3,length,c);
%        save('T_a_domain_1.mat','T_a_domain_1');
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
% Q_space = [domain_1;domain_2;domain_3;domain_4;domain_5;domain_6];
% ch = double(Euler(th,0,0));
% Q_space_2(:,:) = double(Q_space_1*ch);
% ck = double(Euler(0,th,0));
% Q_space_3(:,:) = double(Q_space_1*ck);
% 
% Q_space = [Q_space_1;Q_space_2;Q_space_3];
% save([filename,'.mat'],'Q_space');