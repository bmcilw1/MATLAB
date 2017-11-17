% Group 1
% Brian McIlwain, Justin Guillory, Marshall Simien, Mike Cole, Taj Chauvin
% Project 2

% LMS
i=80; %time
s=zeros(1,i); % pure input signal
v=zeros(1,i); % raw input noise near noise source
m=zeros(1,i); % percieved noise near input signal
v_kMinus1 = v;

for k = 1:i
    s(k) = -2 + 4*rand();
    v(k) = 1.2*sin(2*pi*k/3);
    if (k > 1)
        v_kMinus1(k) = v(k-1);
    end
    m(k) = .12*sin(2*pi*k/3+pi/2);
end

alpha = 0.12; % Learning rate, given in problem
e_limit = 10^-3; % Given TODO: how to use this??

[ W, e, R, X, Y] = lms( v, s, m, alpha);

W
subplot(3,1,1);

plot(s, '- red');

hold on;
plot(R, '-- green');
title('Original and restored signal (alpha=0.12)');
subplot(3,1,2);
plot(e,'blue');
title('Original minus restored signal');

%% Countor Plot
R=[.72 -.36; -.36 .72];
%R=cov(v,v_kMinus1);
%h = xcorr([(s+m) (s+m)]', [v v_kMinus1]')
%h=[mean((s+m)'*v) mean((s+m)'*v_kMinus1)]'
h=[0; -.06234];
c=.0205;
[x,y] = meshgrid(-1:.01:1,-1:.01:1);
[j,k]=size(x);
z=zeros(j,k);
for m=1:j
    for n=1:k
        z(m,n) = c-2*[x(m,n);y(m,n)]'*h+[x(m,n);y(m,n)]'*R*[x(m,n);y(m,n)];
    end
end
subplot(3,1,3);
contour(x,y,z);
hold on;
plot(X,Y);
title('Contour plot');