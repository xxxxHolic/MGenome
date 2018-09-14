clc;clear;
close all;
figure = figure('color',[1 1 1]);
                r = 0.005;
                [x,y,z] = sphere;
                hold on;
                hiso = surf(r*x,r*y,r*z);
                set(hiso,'EdgeColor','none','FaceColor',[1 0 1],'FaceAlpha',0.99);
                lighting phong
                light('position',[ 1,-1,-1])
                light('position',[ -1,1,1])
                hold on;
            axis off;
            daspect([1,1,1]);