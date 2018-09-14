function indata = incoor(data,inlimt,mode,draw)
    if strcmp(mode,'ortho')
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
        if draw
            xin = indata(:,1); yin = indata(:,2); zin = indata(:,3);
            figure;
            xlabel('H_x');ylabel('K_y');zlabel('L_z');
            for ii = 1:numel(xin)
                x0 = xin(ii);y0 = yin(ii);z0 = zin(ii);r = 0.0015;
                [x,y,z] = sphere;
                hold on;
                hiso = surf(r*x+x0,r*y+y0,r*z+z0);
                set(hiso,'EdgeColor','none','FaceColor',[0.9 0.1 0.1],'FaceAlpha',0.99);
                lighting phong
                light('position',[ 1,-1,-1])
                light('position',[ -1,1,1])
                hold on;
            end
            daspect([1,1,1]);
        end
    end
    if strcmp(mode,'slice')
        a = inlimt(1);b = inlimt(2);c = inlimt(3);
        d1 = inlimt(4);d2 = inlimt(5);
% %         x = data(:,1);
% %         y = data(:,2);
% %         z = data(:,3);
        num = 1;
        for i = 1:numel(data(:,1))
                    x = data(i,1);
                    y = data(i,2);
                    z = data(i,3);
        if find(((a*x+b*y+c*z-d1)<0)&((a*x+b*y+c*z-d2)>0));
           indata(num,1) = x;
           indata(num,2) = y;
           indata(num,3) = z;
           num = num + 1;
        end
        end
    end
%    if strcmp(mode,'cross')
%        a1 = inlimt(1);b1 = inlimt(2);c1 = inlimt(3);d1 = inlimt(4);
%        a2 = inlimt(5);b2 = inlimt(6);c2 = inlimt(7);d2 = inlimt(8);
       
end
