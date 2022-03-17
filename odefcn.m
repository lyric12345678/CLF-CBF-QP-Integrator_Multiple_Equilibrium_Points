function dxdt = odefcn(t,x)
dxdt = zeros(2,1);
% % time
% t
%% Lyapunov Function
V=3*x(1)^2+1/2*x(2)^2;
h=1/2*(x-[0,3].').'*(x-[0,3].')-9/8;

%% Formulate and Solve the QPs
%% Use function quadprog
Lf_V=0;
Lg_V=[6*x(1),x(2)].';
Lf_h =0;
Lg_h =[x(1),x(2)-3].';
A=[Lg_V.',-1;-Lg_h.',0];
b=[-Lf_V-10*V,Lf_h+10*h].';
[z]=quadprog(eye(3),zeros(3,1),A,b);

% %% We use CVX function
% n=3;
% cvx_begin quiet
% variable z(n,1)
% minimize(1/2*z(1:2).'*z(1:2)+1/2*100*z(3)^2)
% subject to
% Lg_V*z(1:2).'+V-z(3)<=0;
% Lg_h*z(1:2).'+h>=0;
% cvx_end

%% Dynamics of the system
dxdt(1)=z(1);
dxdt(2)=z(2);
end