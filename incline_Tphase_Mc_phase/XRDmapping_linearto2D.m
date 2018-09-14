%% Copyright USTC Han Xu 2015/4/22
clc;clear;close all;
%%
% % specfile = 'STO-BWO-RSM-0018_2-Theta.txt';
specfile = '#23 HH-PMNPT _dual_miscut RSM(113) 90V _2-Theta.txt';
% % specfile = 'STO-BWO-RSM-2_2-Theta.txt';
[dir,filename,ext]=fileparts(specfile);

fid =fopen(specfile,'r');
data =fscanf(fid,'%c'); %load the whole datafile as a long string
fclose(fid);

h1=['#Collected Data'];
st1=findstr(h1,data);
h2=['#Attenuator_coefficient=1.000000'];
st2=findstr(h2,data);

%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%5
% % omega_central = 57.6605  ;
omega_central = 12.3 ;
% % omega_central = 44.8767 - 0.35 ;
num_scan = 101;
step = 60;
top = 0.25;
down = 0.3; 
suba = 1;
subc = 1;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
Omega = linspace(omega_central-top,omega_central+down,step);

for i = 1:step-1
    line(:,i) = sscanf(data(st2(i)+34:st1(i+1)-1)','%f');
    for j = 1:num_scan
        two_th(j,i) = line(2*j-1,i);       
        Intensity(j,i) = line(2*j,i); 
    end
    omega = ones(num_scan,1).*Omega(1,i);
    Q_x(:,i) = suba / 1.5406 * ( cos(pi /180 * (two_th(:,i)-omega)) - cos(pi /180 * (omega)));
    Q_z(:,i) = subc / 1.5406 * ( sin(pi /180 * (two_th(:,i)-omega)) + sin(pi /180 * (omega)));
    q_x((1+num_scan*(i-1)):num_scan*i,:) = Q_x(:,i);
    q_z((1+num_scan*(i-1)):num_scan*i,:) = Q_z(:,i);
    Inten((1+num_scan*(i-1)):num_scan*i,:) = Intensity(:,i);
end
% Q(:,1) = q_x(:,:);
Q(:,1) = q_x(:,:);
Q(:,2) = q_z(:,:);
Q(:,3) = Inten(:,:);
data = Q;
% % save('STO-BWO-RSM-0018_2-Theta_2.dat','Q','-ascii');
figure;imagesc(log(max(Intensity,0)));
save([filename,'.dat'],'Q','-ascii');
% % save('STO-BWO-RSM-2_2-Theta_2.dat','Q','-ascii');

%% Interpolant Q_space

th_max = max(max(Omega));th_min = min(min(Omega));
tth_max = max(max(two_th(:,2)));tth_min = min(min(two_th(:,2)));
th_vertex(:,1) = [th_max ,th_max ,th_min, th_min];
th_vertex(:,2) = [tth_max, tth_min, tth_max, tth_min];
Q_vertex(:,1) = suba / 1.5406 * (cos(pi /180 * (th_vertex(:,2)-th_vertex(:,1))) - cos(pi /180 * (th_vertex(:,1))));
Q_vertex(:,2) = subc / 1.5406 * (sin(pi /180 * (th_vertex(:,2)-th_vertex(:,1))) + sin(pi /180 * (th_vertex(:,1))));
[Q_vertex(:,1), idx] = sort(Q_vertex(:,1),'ascend')
A = Q_vertex(:,2);
Q_vertex(:,2) = A(idx);
Left_vector_1 = Q_vertex(2,:)-Q_vertex(1,:);  Left_vector_2 = Q_vertex(3,:)-Q_vertex(1,:);
Right_vector_1 = Q_vertex(2,:)-Q_vertex(4,:); Right_vector_2 = Q_vertex(3,:)-Q_vertex(4,:);
angle_Left = dot(Left_vector_1,Left_vector_2)./((norm(Left_vector_1)).*(norm(Left_vector_2)));
angle_Right = dot(Right_vector_1,Right_vector_2)./((norm(Right_vector_1)).*(norm(Right_vector_2)));

%%
Inter_num = 200;
Qx = data(:,1);
Qz = data(:,2);
Inten = data(:,3);
F = scatteredInterpolant(Qx,Qz,Inten);
x = linspace(min(Qx),max(Qx),Inter_num);
y = linspace(min(Qz),max(Qz),Inter_num);
Q_space = nan(Inter_num,Inter_num);
for i = 1:Inter_num
    for j = 1:Inter_num
        point = [x(j) y(i)];
        Left_vector   = point - Q_vertex(1,:); 
        Right_vector  = point - Q_vertex(4,:);
        angle_Left_1  = dot(Left_vector,Left_vector_1)./((norm(Left_vector)).*(norm(Left_vector_1)));
        angle_Left_2  = dot(Left_vector,Left_vector_2)./((norm(Left_vector)).*(norm(Left_vector_2)));
        angle_Right_1 = dot(Right_vector,Right_vector_1)./((norm(Right_vector)).*(norm(Right_vector_1)));
        angle_Right_2 = dot(Right_vector,Right_vector_2)./((norm(Right_vector)).*(norm(Right_vector_2)));  
        
        if (angle_Left_1>=angle_Left)&(angle_Left_2>=angle_Left)&(angle_Right_1>=angle_Right)&(angle_Right_2>=angle_Right)
           Q_space(i,j) = F(x(j),y(i));
        end
    end
end
Q_space = flipud(Q_space);
figure;imagesc(log(max(Q_space,0)));

% % save('STO-BWO-RSM-0018_2-Theta_Q_2.mat','Q_space','x','y');
% % save('STO-BWO-RSM_2-Theta_Q_2.mat','Q_space','x','y');
% % save('STO-BWO-RSM-2_2-Theta_Q_2.mat','Q_space','x','y');
