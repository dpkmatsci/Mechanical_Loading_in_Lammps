% Plot the various responses
clear all;
close all;
tst=0;
filename = 'runmst.0.5.0.02.40.comout';
% Get data
A = importdata(filename);
A=A.data;
step= A(:,1);
step=step/1000000; % Convert steps to ns
dev = A(:,10:16);
dev(:,4)=dev(:,4)/10000;
dev(:,6)=dev(:,6)/10000;
dev(:,5)=dev(:,5)/10;
chk1=mean(dev(1000:size(dev,1),3));
chk2=mean(dev(1000:size(dev,1),4));
chk3=mean(dev(1000:size(dev,1),5));
chk4=mean(dev(1000:size(dev,1),1));
chk5=mean(dev(1000:size(dev,1),6));
% Generate plot
figure(1);
plot(step,dev(:,1),'-or','LineWidth',2,'MarkerEdgeColor','r',...
           'MarkerFaceColor','r','MarkerSize',5);
set(gca,'LineWidth',2,'FontSize',24,'FontWeight','normal','FontName','Times')
set(get(gca,'XLabel'),'String','Step(ns)','FontSize',32,'FontWeight','bold','FontName','Times')
set(get(gca,'YLabel'),'String','Temperature(K)','FontSize',32,'FontWeight','bold','FontName','Times')
set(gcf,'Position',[1 1 round(1000) round(1000)])
figure(2)
plot(step,dev(:,6),'-or','LineWidth',2,'MarkerEdgeColor','r',...
           'MarkerFaceColor','r','MarkerSize',5);
set(gca,'LineWidth',2,'FontSize',24,'FontWeight','normal','FontName','Times')
set(get(gca,'XLabel'),'String','Step(ns)','FontSize',32,'FontWeight','bold','FontName','Times')
set(get(gca,'YLabel'),'String','pressure(GPa)','FontSize',32,'FontWeight','bold','FontName','Times')
set(gcf,'Position',[1 1 round(1000) round(1000)])
figure(3);
plot(step,dev(:,3),'-or','LineWidth',2,'MarkerEdgeColor','r',...
           'MarkerFaceColor','r','MarkerSize',5);
set(gca,'LineWidth',2,'FontSize',24,'FontWeight','normal','FontName','Times')
set(get(gca,'XLabel'),'String','Step(ns)','FontSize',32,'FontWeight','bold','FontName','Times')
set(get(gca,'YLabel'),'String','dhug(K)','FontSize',32,'FontWeight','bold','FontName','Times')
set(gcf,'Position',[1 1 round(1000) round(1000)])
figure(4);
plot(step,dev(:,4),'-or','LineWidth',2,'MarkerEdgeColor','r',...
           'MarkerFaceColor','r','MarkerSize',5);
set(gca,'LineWidth',2,'FontSize',24,'FontWeight','normal','FontName','Times')
set(get(gca,'XLabel'),'String','Step(ns)','FontSize',32,'FontWeight','bold','FontName','Times')
set(get(gca,'YLabel'),'String','dray(GPa)','FontSize',32,'FontWeight','bold','FontName','Times')
set(gcf,'Position',[1 1 round(1000) round(1000)])
figure(5);
plot(step,dev(:,5),'-or','LineWidth',2,'MarkerEdgeColor','r',...
           'MarkerFaceColor','r','MarkerSize',5);
set(gca,'LineWidth',2,'FontSize',24,'FontWeight','normal','FontName','Times')
set(get(gca,'XLabel'),'String','Step(ns)','FontSize',32,'FontWeight','bold','FontName','Times')
set(get(gca,'YLabel'),'String','lgrvel(km/s)','FontSize',32,'FontWeight','bold','FontName','Times')
set(gcf,'Position',[1 1 round(1000) round(1000)])
figure(6);
plot(step,dev(:,7),'-or','LineWidth',2,'MarkerEdgeColor','r',...
           'MarkerFaceColor','r','MarkerSize',5);
set(gca,'LineWidth',2,'FontSize',24,'FontWeight','normal','FontName','Times')
set(get(gca,'XLabel'),'String','Step(ns)','FontSize',32,'FontWeight','bold','FontName','Times')
set(get(gca,'YLabel'),'String','delE(ev)','FontSize',32,'FontWeight','bold','FontName','Times')
set(gcf,'Position',[1 1 round(1000) round(1000)])
fprintf('Mean deviation of temperature from Hugoniot is %g K\n', chk1);
fprintf('Mean deviation of pressure from rayleigh is %g GPa\n', chk2);
fprintf('At pressure of %g GPa and temperature of %g K Particle velocity is %g Km/s\n', chk5,chk4,chk3);
