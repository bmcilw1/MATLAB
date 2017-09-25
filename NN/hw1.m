% Brian McIlwian
% Hw #1 Perceptron Learning

% (a) Write a program to implement perceptron learning algorithm. 
% Assume there are R inputs and S neurons in the neural network.  
% Verify the learning using data given below.

P = { [1 4]' [1 5]' [2 4]' [2 5]' [3 1]' [3 2]' [4 1]' [4 2]'};
T = {0 0 0 0 1 1 1 1};

% Create correct size W and B array
W = zeros(size(cell2mat(P(1))))
B = zeros(size(cell2mat(T(1))))

% intialize training rate and max iterations
alpha = .5;
maxiterations = 10000;

% Begin algorythim
err = zeros(size(cell2mat(T(1))));
for epoc=1:maxiterations
    % iterate over full array
    haserr = 0;
    for j=1:size(T,2)
        n = sum(W.*cell2mat(P(j)),1) + B;
        a = my_hardlim(n);
        Tj = cell2mat(T(j));
        err = Tj - a;
        haserr = haserr || any(err);
        W = W + alpha * err * cell2mat(P(j))
        B = B + alpha * err
    end
    
    % if epoc was perfect, terminate loop
    if (~haserr)
       fprintf('Network converges epoc = %i\n', i);
       break; 
    end
end

if (haserr)
   fprintf('Network does not converge after %i epocs\n', maxiterations); 
end

% (b) Also, verify your algorithm for any multi-neuron classification problem.