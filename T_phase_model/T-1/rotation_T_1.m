%% ���ղο����ף�a = 4.00; b = 4.00; c = 4.03; incline = 90;90;90;
clc;clear;
%% �������
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
filename = 'PMNPT_T_a_c'; 

a = 4.002;                         
b = 4.002;                          
c = 4.043;


% a = 4.00;                         
% b = 4.00;                          
% c = 4.03;                     
% aa = pi/2; bb = pi/2;cc = pi/2; 
% ss = [1 0 0;...
%       cos(cc) sin(cc) 0;...
%       cos(bb) (cos(aa)-cos(bb)*cos(cc))./sin(cc)...
%       (1+2*cos(aa)*cos(bb)*cos(cc)-cos(aa).^2-cos(bb).^2-cos(cc).^2).^(0.5)./sin(cc)];
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
length = 9;                 

%% ��þ���ʸ��

%%%% domain kind one
% a1 = a*ss(1,1);a2 = 0;        a3 = 0;
% b1 = b*ss(2,1);b2 = b*ss(2,2);b3 = 0;
% c1 = c*ss(3,1);c2 = c*ss(3,2);c3 = c*ss(3,3);
L_0_1 = [a 0 0;0 b 0;0 0 c];
L_0_2 = [c 0 0;0 a 0;0 0 b];
L_0_3 = [a 0 0;0 c 0;0 0 b];
%%%% domain kind two
% th = pi/2;
% cc = double(Euler(th,0,0));
% L_0_2 = double(L_0_1*cc);
% cc = double(Euler(0,th,0));
% L_0_3 = double(L_0_2*cc);
%% rotation

th_a = 0.473*pi/180;
th_c = 0.200*pi/180;
% rotate = [clock_K_th,anticlock_K_th, clock_H_th, anticlock_H_th, clock_K_bt, anticlock_K_bt, clock_H_bt, anticlock_H_bt];
% domain = cell(1,8);
%    if     rotate(1)
       cc = vpa(Euler(th_c,0,0));
       l_c_1 = vpa(L_0_1*cc);
       T_c_domain_1(:,:) = q_space(l_c_1,length,cc);
       save('T_c_domain_1.mat','T_c_domain_1');
       
       cc = vpa(Euler(-th_c,0,0));
       l_c_2 = vpa(L_0_1*cc);
       T_c_domain_2(:,:) = q_space(l_c_2,length,cc);
       save('T_c_domain_2.mat','T_c_domain_2');
       
       cc = vpa(Euler(0,-th_c,0));
       l_c_3 = vpa(L_0_1*cc);
       T_c_domain_3(:,:) = q_space(l_c_3,length,cc);
       save('T_c_domain_3.mat','T_c_domain_3');
       
       cc = vpa(Euler(0,th_c,0));
       l_c_4 = vpa(L_0_1*cc);
       T_c_domain_4(:,:) = q_space(l_c_4,length,cc);
       save('T_c_domain_4.mat','T_c_domain_4');
%    end
%    if rotate(2)
       cc = vpa(Euler(0,0,-th_a));
       l_a_1 = vpa(L_0_2*cc);
       T_a_domain_1(:,:) = q_space(l_a_1,length,cc);
       save('T_a_domain_1.mat','T_a_domain_1');
%%% 
       cc = vpa(Euler(0,0,th_a));
       l_a_2 = vpa(L_0_2*cc);
       T_a_domain_2(:,:) = q_space(l_a_2,length,cc);
       save('T_a_domain_2.mat','T_a_domain_2');
       
       cc = vpa(Euler(0,th_a,0));
       l_a_3 = vpa(L_0_2*cc);
       T_a_domain_3(:,:) = q_space(l_a_3,length,cc);
       save('T_a_domain_3.mat','T_a_domain_3');
       
       cc = vpa(Euler(0,-th_a,0));
       l_a_4 = vpa(L_0_2*cc);
       T_a_domain_4(:,:) = q_space(l_a_4,length,cc);
       save('T_a_domain_4.mat','T_a_domain_4');
% %    end
% %    if rotate(4)


       cc = vpa(Euler(0,0,th_a));
       l_b_4 = vpa(L_0_3*cc);
       T_b_domain_4(:,:) = q_space(l_b_4,length,cc);
       save('T_b_domain_4.mat','T_b_domain_4');
%    end

       cc = vpa(Euler(0,0,-th_a));
       l_b_3 = vpa(L_0_3*cc);
       T_b_domain_3(:,:) = q_space(l_b_3,length,cc);
       save('T_b_domain_3.mat','T_b_domain_3');
             
       cc = vpa(Euler(-th_a,0,0));
       l_b_2 = vpa(L_0_3*cc);
       T_b_domain_2(:,:) = q_space(l_b_2,length,cc);
       save('T_b_domain_2.mat','T_b_domain_2');
       
       cc = vpa(Euler(th_a,0,0));
       l_b_1 = vpa(L_0_3*cc);
       T_b_domain_1(:,:) = q_space(l_b_1,length,cc);
       save('T_b_domain_1.mat','T_b_domain_1');
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