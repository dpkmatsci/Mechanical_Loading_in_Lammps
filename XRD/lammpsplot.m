%This script plots the result xrd file from lammps
%Two plots will be there one will be intensity vs 2theta and another is intensity vs 1/d
clear all;
fid=fopen('deg2th.1.erht_alb.12.xrd','r');
%fid=fopen('deg2th.1.13.001.xrd','r');
b=fgetl(fid);
i=1;
while ~feof(fid)
    b=fgetl(fid);
    i=i+1;
    if i>=5
        c=str2num(b);
        nw(i-4,1:4)=c;
    end
end
fclose(fid);
stp=nw(:,2);
for i=1:size(stp,1)
    stpn(i,1)=2*sind(0.5*stp(i,1))/1.541838;
end
intns=nw(:,3);
mx=max(intns(:,1));
k=1;
for i=1:size(intns,1)
    scints(i,1)=intns(i,1)/mx*100;
    if scints(i,1)>=1
        dpks(k,1)=k;
        dpks(k,2)=stp(i,1);
        dpks(k,3)=scints(i,1);
        k=k+1;
    end
end
plot(stp,scints,'b','LineWidth',4,'MarkerEdgeColor','b',...
                'MarkerFaceColor','b','MarkerSize',5);
set(gca,'LineWidth',2,'FontSize',24,'FontWeight','normal','FontName','Times')
set(get(gca,'XLabel'),'String','2\theta(degree)','FontSize',20,'FontWeight','bold','FontName','Times')
set(get(gca,'YLabel'),'String','Intensity','FontSize',20,'FontWeight','bold','FontName','Times')
set(gcf,'Position',[1 1 round(1000) round(1000)])
xlim([20 130]);
figure(2);
plot(stpn,scints,'r','LineWidth',4,'MarkerEdgeColor','r',...
                'MarkerFaceColor','r','MarkerSize',5);
set(gca,'LineWidth',2,'FontSize',24,'FontWeight','normal','FontName','Times')
set(get(gca,'XLabel'),'String','1/d(A^{o}^{-1})','FontSize',20,'FontWeight','bold','FontName','Times')
set(get(gca,'YLabel'),'String','Intensity','FontSize',20,'FontWeight','bold','FontName','Times')
set(gcf,'Position',[1 1 round(1000) round(1000)])  
xlim([0.25 1.18]);