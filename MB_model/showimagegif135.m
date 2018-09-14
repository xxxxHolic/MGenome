clc;clear;

posi_402_ = [510 170];
posi_401_ = [725 170];
posi_400 = [938 170];
posi_401 = [1151 170];
posi_402 = [1364 170];

% % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % 

ii = 407
    %:4:550;
    x = (ii-391)*0.072/160+0.3;
   dd = double(imread(['MPB135-',num2str(ii,'%.5d') ,'.tif']));  
   
   figure;imagesc(log10(max(dd,0.01)),[3.2 5]);axis equal;
   posi = posi_402_;
   imagesc(log10(max(dd(150:190,posi(1,1)-20:posi(1,1)+20),0.01)),[3.2 5]);
   text(6,6,['(4 0 -2)','  x=',num2str(x)],'Color','w','fontsize',20,'fontweight','bold','fontname','Times New Roman') ;
   axis equal;hold on;set(gca,'XTick',[]);set(gca,'YTick',[]);
   set(gca,'Position',[-0.03 -0.01 1.04 1.015]);
   saveas(gcf,['(4 0 -2)','  x=',num2str(x),'.png']);



