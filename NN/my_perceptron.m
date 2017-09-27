function [ W, B, epoc, converges ] = my_perceptron( P, T, W, B, alpha, maxEpocs )
%MY_PERCEPTRON An implementation of the Perceptron Learning Algorthym
% Inputs:
%   P: Sample inputs (cell list)
%   T: Targets to sample inputs P (cell list)
%   W: Initial weight matrix (vector)
%   B: Initial bias matrix (vector)
%   alpha: Training rate (0 < alpha <= 1)
%   maxEpocs: Maximum number of epocs to attempt the algorythym
% Outputs:
%   W: Final weight matrix (vector)
%   B: Finial bias matrix (vector)
%   epoc: Number of epocs run (integer)
%   converges: Did the network converge? (bit)

    % Does not yet converge
    converges = 0;
    
    for epoc=1:maxEpocs
        % iterate over full target cell array
        haserr = 0;
        for j=1:size(T,2)
            % Get initial input to hardlim
            n = sum(W.*cell2mat(P(j)),1) + B;
            
            % Run hardlim and get claimed output
            a = my_hardlim(n);
            
            % Check error of our output compared to target output
            Tj = cell2mat(T(j));
            err = Tj - a;
            
            % Is some error in the current output
            % OR has error prevously occured in this epoc?
            haserr = haserr || any(err);
            
            % Update weights and bias according to Perceptron algorthym
            W = W + alpha * err * cell2mat(P(j));
            B = B + alpha * err;
        end

        % if epoc was perfect, terminate loop
        if (~haserr)
           converges = 1;
           break; 
        end
    end
end