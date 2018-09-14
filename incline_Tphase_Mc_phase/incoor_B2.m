function indata = incoor_B2(data,inlimt,mode,draw)
    if strcmp(mode,'ortho')
        H = inlimt(1); K = inlimt(2);  L = inlimt(3);
        h = data(:,4);
        k = data(:,5);
        l = data(:,6);
        id_x = find(h == H);
        id_y = find(k == K);
        id_z = find(l == L);
        id = intersect(intersect(id_x,id_y),id_z);
        indata = data(id,:);
        if draw
            xin = indata(:,1); yin = indata(:,2); zin = indata(:,3);
            figure;
            xlabel('H_x');ylabel('K_y');zlabel('L_z');
            for ii = 1:numel(xin)
                x0 = xin(ii);y0 = yin(ii);z0 = zin(ii);r = 0.00003;
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
