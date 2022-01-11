
%plotting for the S shape 4 fold anisotropy case
clc, clear, close all;
tic  

gpi=13; dti=9;

% Initial setup for Numerical result    
N=2^gpi; L=10; dx = L/N;
x = -L/2:dx:L/2-dx; y = x; [X, Y]= meshgrid(x,y);

%;load front tracking
load('X_F3.mat'); load('Y_F3.mat');

%Inital shape
    U=zeros(N,N); area_in=0;
     for i=1:N
         for j=1:N
              if  X(i,j)>= 0 %right side of domain
                  if Y(i,j) <= 0 %  down-right side of domain (4th quadrant)
                       if  (X(i,j))^2 + (Y(i,j)+2)^2 <= 4 && ...
                                (X(i,j))^2 + (Y(i,j)+2)^2 >= 1
                            U(i,j) =1; area_in=area_in+1;
                       end
                  else  %up-right side quarter circle
                       if  (X(i,j))^2 + (Y(i,j)-1)^2 <= 4 && ...
                               (X(i,j))^2 + (Y(i,j)-1)^2 >= 1 && Y(i,j) >= 1
                            U(i,j) =1; area_in=area_in+1;
                       end
                  end        
              else
                  if Y(i,j) >= -1 %  up-left side of domain (2nd quadrant)
                       if  (X(i,j))^2 + (Y(i,j)-1)^2 <= 4 && ...
                                (X(i,j))^2 + (Y(i,j)-1)^2 >= 1
                            U(i,j) =1; area_in=area_in+1;
                       end
                  else  %down-left side : quarter circle
                       if  (X(i,j))^2 + (Y(i,j)+2)^2 <= 4 && ...
                               (X(i,j))^2 + (Y(i,j)+2)^2 >= 1 && Y(i,j) <= -2
                            U(i,j) =1; area_in=area_in+1;
                       end
                  end
              end

         end
     end


     
%first plot at time 0.25
TT=0.25;
figure()

%Intialshape
contour(X,Y,U,[0.5 0.5],'Color', [0.5 0.5 0.5],'displayname','I','linewidth',3.5), hold on

%Bon
load(sprintf('%s_%d %d %d','BON_U_gpi_dti_TT',gpi,dti,TT*10000),'U');
contour(X,Y,U,[0.5 0.5],'--','Color', 'r','DisplayName','A','linewidth',3), hold on
%EJZ PD
load(sprintf('%s_%d %d %d','EJZPD_U_gpi_dti_TT',gpi,dti,TT*10000),'U')
contour(X,Y,U,[0.5 0.5],'-.','Color', 'b','DisplayName','F','linewidth',3),


%EJZ FD
load(sprintf('%s_%d %d %d','EJZFD_U_gpi_dti_TT',gpi,dti,TT*10000),'U')
contour(X,Y,U,[0.5 0.5],':','Color',[0 0.4 0],'DisplayName','E','linewidth',3),

%front tracking
 XX_F=X_F(1,:); %copy perticular row 
 XX_F(1)=[];%exclude time entry
 YY_F=Y_F(1,:);
 YY_F(1)=[];%exclude time entry
plot(XX_F,YY_F,'k','DisplayName','G','linewidth',3); axis equal, box on
axis([-3 4 -4.5 3.5]), set(gca,'FontSize',40)
set(gca,'LineWidth',2,'TickLength',[0.025 0.025]);
lgd = legend('Location','southeast');
lgd.FontSize = 60;  title('\fontsize{40} Time=0.25');
hold off


%Second plot at time 0.75
TT=0.75;
figure()

%Bon
load(sprintf('%s_%d %d %d','BON_U_gpi_dti_TT',gpi,dti,TT*10000),'U'); hold on
contour(X,Y,U,[0.5 0.5],'--','Color', 'r','DisplayName','A','linewidth',3),

%EJZ PD
load(sprintf('%s_%d %d %d','EJZPD_U_gpi_dti_TT',gpi,dti,TT*10000),'U')
contour(X,Y,U,[0.5 0.5],'-.','Color', 'b','DisplayName','F','linewidth',3),


%EJZ FD
 load(sprintf('%s_%d %d %d','EJZFD_U_gpi_dti_TT',gpi,dti,TT*10000),'U')
contour(X,Y,U,[0.5 0.5],':','Color',[0 0.4 0],'DisplayName','E','linewidth',3)
 

%front tracking
 XX_F=X_F(2,:); %copy perticular row 
 XX_F(1)=[];%exclude time entry
 YY_F=Y_F(2,:);
 YY_F(1)=[];%exclude time entry
plot(XX_F,YY_F,'k','DisplayName','G','linewidth',3); axis equal 
axis([-3 4 -4.5 3.5]), box on, set(gca,'FontSize',40)
set(gca,'LineWidth',2,'TickLength',[0.025 0.025]);
lgd = legend('Location','southeast'); lgd.FontSize = 60; 
title('\fontsize{40} Time=0.75');
hold off


%Third plot at time 1.25
TT=1.25;
figure()

%Bon
load(sprintf('%s_%d %d %d','BON_U_gpi_dti_TT',gpi,dti,TT*10000),'U'); hold on
contour(X,Y,U,[0.5 0.5],'--','Color', 'r','DisplayName','A','linewidth',3), hold on

%EJZ PD
load(sprintf('%s_%d %d %d','EJZPD_U_gpi_dti_TT',gpi,dti,TT*10000),'U')
contour(X,Y,U,[0.5 0.5],'-.','Color', 'b','DisplayName','F','linewidth',3),

%EJZ FD
load(sprintf('%s_%d %d %d','EJZFD_U_gpi_dti_TT',gpi,dti,TT*10000),'U')
contour(X,Y,U,[0.5 0.5],':','Color',[0 0.4 0],'DisplayName','E','linewidth',3),
 

%front tracking
 XX_F=X_F(3,:); %copy perticular row 
 XX_F(1)=[];%exclude time entry
 YY_F=Y_F(3,:);
 YY_F(1)=[];%exclude time entry
plot(XX_F,YY_F,'k','DisplayName','G','linewidth',3); axis equal 


axis([-3 4 -4.5 3.5]), set(gca,'FontSize',40), box on
set(gca,'LineWidth',2,'TickLength',[0.025 0.025]);
lgd = legend('Location','southeast'); lgd.FontSize = 60; 
title('\fontsize{40} Time=1.25');

hold off
toc





 
 
 
 
 
 
 






