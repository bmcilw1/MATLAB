% Group 1
% Brian McIlwain, Justin Guillory, Marshall Simien, Mike Cole, Taj Chauvin
% Project 2

% LMS
i=80000; %time
s=zeros(1,i); % pure input signal
v=zeros(1,i); % raw input noise near noise source
m=zeros(1,i); % percieved noise near input signal
v_kMinus1 = v;
%{
x = inputdlg('Enter a training rate (alpha)');% Learning rate, given in problem
recorder1 = audiorecorder(44100,16,1);
disp('Start speaking.')
recordblocking(recorder1, 5);
disp('End of Recording. Playing Back')
play(recorder1);
sound = getaudiodata(recorder1);
%}

SKin = input('Give an equation for s(k): ')
VKin = input('Give an equation for v(k): ')
MKin = input('Give an equation for m(k): ')

SK = SKin;
VK = VKin;


for k = 1:i
    s(k) = SK  ;
%     s(k) = -.2 + .4*rand();
    v(k) = VK;
%     v(k) = 1.2*sin(2*pi*k/3);
    if (k > 1)
        v_kMinus1(k) = v(k-1);
    end
    m(k) = MK;
%     m(k) = .12*sin(2*pi*k/3+pi/2);
end
alpha = .12
%alpha = str2double(x{:});

e_limit = 10^-3; % Given TODO: how to use this??

[ W, e, r, X, Y] = lms( v, s, m, alpha);
W
plot_lms(v, vMinus1, s, m, alpha, e, r, X, Y);

figure;
i = linspace(0, 5, 44100*5);
title('Audio Recording');
plot(i, sound);