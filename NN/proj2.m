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
s(1) = -2 + 4*rand(); % Input Signal
m = 1.2*sin(2*pi/3-3*pi/2);
e(1) = m-a(1);
r(1) = s(1)+ e(1);
W = W + 2*alpha*e(1)*[v(1), 0];

for k = 2:i
    s(k) = -2 + 4*rand(); % Input Signal
    m = 1.2*sin(2*pi*k/3-3*pi/3);
    v(k) = 1.2*sin(2*k*pi/3);
    a(k) = W*[v(k) v(k-1)]';
    
    e(k) = m-a(k); % error
    r(k) = s(k) + m-a(k); % resistance
    X(k) = W(1);
    Y(k) = W(2);
    W = W + 2*alpha*e(k)*[v(k) v(k-1)];
end

W
subplot(3,1,1);

plot(s, '- red');

hold on;
plot(r, '-- green');
title('Original and restored signal (alpha=0.12)');
subplot(3,1,2);
plot(e,'blue');
title('Original minus restored signal');

%% Countor Plot
r=[.72 -.36; -.36 .72];
h=[0; -.06235];
[x,y] = meshgrid(-2:.1:2,-2:.1:3);
[j,k]=size(x);
z=zeros(j,k);
for m=1:j
    for n=1:k
        z(m,n) = 1.4-2*[x(m,n);y(m,n)]'*h+([x(m,n);y(m,n)]'*r)*[x(m,n);y(m,n)];
    end
end
subplot(3,1,3);
contour(x,y,z);
hold on;
plot(X,Y);
title('Contour plot');