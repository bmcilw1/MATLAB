% Brian McIlwian
% Hw #1 Perceptron Learning

% (a) Write a program to implement perceptron learning algorithm. 
% Assume there are R inputs and S neurons in the neural network.  
% Verify the learning using data given below.

P = { [1 4]' [1 5]' [2 4]' [2 5]' [3 1]' [3 2]' [4 1]' [4 2]'};
T = {0 0 0 0 1 1 1 1};

% Create correct size W and B array
W = zeros(size(cell2mat(P(1))));
B = zeros(size(cell2mat(T(1))));

% intialize training rate and max iterations
alpha = .5;
maxiterations = 10000;

% Begin algorythim
err = zeros(size(cell2mat(T(1))));
for i=1:maxiterations
    for j=1:size(T)
        err = cell2mat(T(j)) - a;
        a = 1; 
        W = W + alpha * err * cell2mat(P(j));
        B = B + alpha * err;
    end
    err = 0;
end

% (b) Also, verify your algorithm for any multi-neuron classification problem.