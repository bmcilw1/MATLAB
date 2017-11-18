% Group 1
% Brian McIlwain, Justin Guillory, Marshall Simien, Mike Cole, Taj Chauvin
% Project 2

% LMS

prompt = {'Give an equation for s(k): ', ...
    'Give an equation for v(k): ', ...
    'Give an equation for m(k): ', ...
    'Give training rate alpha: ', ...
    'Give acceptable error threshold: ', ...
    'Give max epocs: ', ... 
    'Give number of samples: '};
dlg_title = 'Input';
num_lines = 1;
defaultans = {'-.2 + .4*rand()', ...
    '1.2*sin(2*pi*k/3)', ...
    '.12*sin(2*pi*k/3+pi/2)', ...
    '.12', ...
    '10^-3', ...
    '10^3', ...
    '800'};
answer = inputdlg(prompt,dlg_title,num_lines,defaultans);

SK = answer{1,1};
VK = answer{2,1};
MK = answer{3,1};
alpha = answer{4,1};
alpha = eval(alpha);
e_limit = answer{5,1};
e_limit = eval(e_limit);
epoc_limit = answer{6,1};
epoc_limit = eval(epoc_limit);
i = eval(answer{7,1}); %time

s=zeros(1,i); % pure input signal
v=zeros(1,i); % raw input noise near noise source
m=zeros(1,i); % percieved noise near input signal
v_kMinus1 = v;
W=[0 0]; % Initial weights

for k = 1:i
    s(k) = eval(SK);
%     s(k) = -.2 + .4*rand();
    v(k) = eval(VK);
%     v(k) = 1.2*sin(2*pi*k/3);
    if (k > 1)
        v_kMinus1(k) = v(k-1);
    end
    m(k) = eval(MK);
%     m(k) = .12*sin(2*pi*k/3+pi/2);
end

for k=1:epoc_limit
    % Run lms algorythm
    [ W, e, r, X, Y] = lms( v, s, m, alpha, W);
    
    % Compute error
    error = norm(e);
    
    % If error under error limit terminate epocs
    if (error < e_limit)
        break;
    end
end

W
plot_lms(v, v_kMinus1, s, m, alpha, e, r, X, Y);

figure;
i = linspace(0, 5, 44100*5);
title('Audio Recording');
    btn = uicontrol('Style', 'pushbutton', 'String', 'Play',...
        'Position', [20 20 50 20],...
        'Callback', 'play');
plot(i, sound);