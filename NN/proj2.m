% Group 1
% Brian McIlwain, Justin Guillory, Marshall Simien, Mike Cole, Taj Chauvin
% Project 2

% LMS
i=80; %time
v=zeros(1,i); % input noise
m=zeros(1,i); % actual noise vector
s=zeros(1,i); % input pure signal

for k = 1:i
    m(k) = .12*sin(2*pi*k/3+pi/2); % Actual noise
    v(k) = 1.2*sin(2*k*pi/3); % Noise vector
    s(k) = -2 + 4*rand(); % signal
end

alpha = 0.12; % Given in problem
e_limit = 10^-3; % Given

[ W, e, r ] = lms( v, s, m, alpha, e_limit);

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
plot(W(1),W(2));
title('Contour plot');