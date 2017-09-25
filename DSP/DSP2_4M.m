%Brian McIlwain
%DSP Text M2.4

t = 0:1:40;
%a)

figure
% 2.4a(a)
subplot(4,2,1);
x = sinusoidal(1.5, 0, pi/2, 40);
stem(t, x);
axis([0 40 -2 2]);
xlabel('Time index n');
title('Omega = 0');

% 2.4a(b)
subplot(4,2,2);
x = sinusoidal(1.5, .1*pi, pi/2, 40);
stem(t, x);
axis([0 40 -2 2]);
xlabel('Time index n');
title('Omega = 0.1pi');

% 2.4a(c)
subplot(4,2,3);
x = sinusoidal(1.5, .2*pi, pi/2, 40);
stem(t, x);
axis([0 40 -2 2]);
xlabel('Time index n');
title('Omega = 0.2pi');

% 2.4a(d)
subplot(4,2,4);
x = sinusoidal(1.5, .8*pi, pi/2, 40);
stem(t, x);
axis([0 40 -2 2]);
xlabel('Time index n');
title('Omega = 0.8pi');

% 2.4a(e)
subplot(4,2,5);
x = sinusoidal(1.5, .9*pi, pi/2, 40);
stem(t, x);
axis([0 40 -2 2]);
xlabel('Time index n');
title('Omega = 0.9pi');

% 2.4a(f)
subplot(4,2,6);
x = sinusoidal(1.5, pi, pi/2, 40);
stem(t, x);
axis([0 40 -2 2]);
xlabel('Time index n');
title('Omega = pi');

% 2.4a(g)
subplot(4,2,7);
x = sinusoidal(1.5, 1.1*pi, pi/2, 40);
stem(t, x);
axis([0 40 -2 2]);
xlabel('Time index n');
title('Omega = 1.1pi');

% 2.4a(h)
subplot(4,2,8);
x = sinusoidal(1.5, 1.2*pi, pi/2, 40);
stem(t, x);
axis([0 40 -2 2]);
xlabel('Time index n');
title('Omega = 1.2pi');

figure
%b

% 2.4b(a)
subplot(3,2,1);
x = sinusoidal(1, .3*pi, 0, 40);
stem(t, x);
axis([0 10 -2 2]);
xlabel('Time index n');
title('Omega = .3pi');

% 2.4b(b)
subplot(3,2,2);
x = sinusoidal(1, .48*pi, 0, 40);
stem(t, x);
axis([0 10 -2 2]);
xlabel('Time index n');
title('Omega = .48pi');

% 2.4b(c)
subplot(3,2,3);
x = sinusoidal(1, .45*pi, 0, 40);
stem(t, x);
axis([0 10 -2 2]);
xlabel('Time index n');
title('Omega = .45pi');

% 2.4b(d)
subplot(3,2,4);
x = sinusoidal(1, .525*pi, 0, 40);
stem(t, x);
axis([0 10 -2 2]);
xlabel('Time index n');
title('Omega = .525pi');

% 2.4b(e)
subplot(3,2,5);
x = sinusoidal(1, .75*pi, 0, 40);
stem(t, x);
axis([0 10 -2 2]);
xlabel('Time index n');
title('Omega = .75pi');

% 2.4b(f)
subplot(3,2,6);
x = sinusoidal(1, .75*pi, 0, 40);
stem(t, x);
axis([0 10 -2 2]);
xlabel('Time index n');
title('Omega = .75pi');