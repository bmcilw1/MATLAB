% Group 1
% Brian McIlwain, Justin Guillory, Marshall Simien, Mike Cole, Taj Chauvin
% Project 2

% LMS
i=80; %time
W=[0 0];
e=zeros(1,i);
s=zeros(1,i);
v=zeros(1,i);
a=zeros(1,i);
r=zeros(1,i);
alpha = 0.12; % Given in problem
e_limit = 10^-3; % Given

for k = 1:i
    s(k) = -2 + 4*rand(); % Input Signal
    m = .12*sin(2*pi*k/3+pi/2); % Actual noise
    v(k) = 1.2*sin(2*k*pi/3); % Noise vector

    % Handle special case k = 1
    if (k == 1)
        a(k) = W*[v(1) 0]';
    else
        a(k) = W*[v(k) v(k-1)]'; % Reconstructed noise to remove
    end
    
    e(k) = m-a(k); % Error between actual noise and filter output
    r(k) = s(k) + e(k); % Reconstructed signal
   
    % Handle special case k = 1
    if (k == 1)
        W = W + 2*alpha*e(k)*[v(k) 0]; % update weight
    else
        W = W + 2*alpha*e(k)*[v(k) v(k-1)]; % update weight
    end
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