%Brian McIlwian
%Matlab final project

function [] = matlab_project()
% Declare vars, get user input
t = 0:.001:4;
V = Vc(t);
len = length(V);
A = input('Please enter amplitude of the noise: ');
n = input('Please enter the value of random noise filter n: ');
%wc = input('Please enter the value of deterministic noise filter wc: ');

% A = .4;
% n = 150;
wc = 2*pi*17;

% Plot Vc(t)
figure
Vorig = V;
subplot(3,1,1)
plot(t,V);
title('Vc(t)');

% Add deterministic noise
V = V + 0.5*cos(2*pi*60*t) + 0.2*cos(2*pi*100000*t);
subplot(3,1,2)
plot(t,V);
title('Vc(t) + deterministic noise');

% Add random noise
V = V + randomNoise(1,len,A);
subplot(3,1,3)
plot(t,V);
title('Vc(t) + random noise');

% Filter function H(s)
num = 1/10;
den = [1 wc];

% First order filter h(t)
[r,p]=residue(num,den);
ht=r(1,1).*exp(p(1,1).*t);
Vf = conv(ht,V);
V(1:len) = Vf(1:len);
figure
subplot(2,1,1)
plot(t,V);
title('First order filter');

% Average filter
Vn = conv(randFilter(n),V);
V(1:len) = Vn(1:len);
subplot(2,1,2)
plot(t,V);
title('Random Noise Filtering');

%Comparison
figure
subplot(2,1,1)
plot(t,Vorig);
title('Vin')
subplot(2,1,2)
plot(t,V);
title('Vout')
end

function y = randFilter(n)
y = (1/n)*ones(1,n);
end

function y = randomNoise(m,n,A)
y = A*rand(m,n);
end

function y = Vc(t)
y(0<=t&t<1.021) = 6 - 6*exp((-1*t(0<=t&t<=1.021))/.57);
y(1.021<=t&t<1.1303) = -22.5 + 27.5*exp((-1*(t(1.021<=t&t<1.1303)-1.021))/.57);
y(1.1303<=t&t<2.142) = 6 - 6*exp((-1*(t(1.1303<=t&t<2.142)-1.1303))/.57);
y(2.142<=t&t<2.2413) = -22.5 + 27.5*exp((-1*(t(2.142<=t&t<2.2413)-2.142))/.57);
y(2.2413<=t&t<3.2533) = 6 - 6*exp((-1*(t(2.2413<=t&t<3.2533)-2.2413))/.57);
y(3.2533<=t&t<3.3526) = -22.5 + 27.5*exp((-1*(t(3.2533<=t&t<3.3526)-3.2533))/.57);
y(3.3526<=t&t<4.3546) = 6 - 6*exp((-1*(t(3.3526<=t&t<4.3546)-3.3526))/.57);
y(t>=4.3546) = 0;
end
