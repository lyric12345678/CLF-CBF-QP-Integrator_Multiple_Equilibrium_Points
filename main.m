clear all
clc
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Objective: On the Undesired Equilibria Induced by Control Barrier Function Based
%Quadratic Programs")
%Author: Ming Li
%Date: March 15th. 2022
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% Initial Setup
Initial_position(1,:)=[4 4];
% Initial_position(2,:)=[4 6];
% Initial_position(3,:)=[2 7];
% Initial_position(4,:)=[0 8];
% Initial_position(5,:)=[-2 7];
% Initial_position(6,:)=[-4 6];
% Initial_position(7,:)=[-4 4];
% Initial_position(8,:)=[-2 3];
% Initial_position(9,:)=[2 3];
% t_span=[0:0.001:1];                                                        % Running time and interval
t_span=[0:0.1:1]
for i=1:size(Initial_position,1)
    i
    [T,x(:,:,i)] = ode45(@odefcn,t_span,Initial_position(i,:));
end
%% The obstacle
Obs_center=[0,3].';
radius=1.5;
theta=-pi:0.1:pi;
circle=repmat(Obs_center,1,length(theta)).'+radius*[sin(theta);cos(theta)].';
figure(1)
fill(circle(:,1),circle(:,2),'g')
hold on
for i=1:size(x,3)
    plot(x(:,1,i),x(:,2,i),'b--','linewidth',2)
    hold on
end
set(gca,'FontSize',23)
set(gcf,'Position',[200,200,1000,800], 'color','w')
xlabel('x1')
ylabel('x2')
grid on
axis equal






