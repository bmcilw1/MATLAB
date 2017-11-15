% Group 1
% Brian McIlwain, Justin Guillory, Marshall Simien, Mike Cole, Taj Chauvin
% Project 2

% LMS
i=80; %time
W=[0 0];
X=zeros(1,i);
Y=zeros(1,i);
e=zeros(1,i);
s=zeros(1,i);
v=zeros(1,i);
a=zeros(1,i);
r=zeros(1,i);
alpha = 0.12; % Given in problem

v(1) = 1.2*sin(2*1*pi/3);
a(1) = W*[v(1) 0]';
s(1) = -2 + 4*rand();
m = 1.2*sin(2*pi/3-3*pi/2);
e(1) = m-a(1);
r(1) = s(1)+ e(1);
W = W + 2*alpha*e(1)*[v(1), 0];