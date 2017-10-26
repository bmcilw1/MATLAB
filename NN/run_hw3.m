function [ R ] = run_hw3(p)
%test_hw3 Run tests on given network
    numFlips = [2, 4, 6];
    R = ones(3, 6, 2);
    for maxNum = 2:size(p,2)
        % Will go from 0 to maxNum - 1
        % Hebb rule W: sum of all PnPn'
        WHebb = zeros(30,30);
        WSu = zeros(30,30);
        for i=1:maxNum
            WHebb = WHebb + p(:,i)*p(:,i)';
            WSu = WSu + p(:,i)*inv(p(:,i)'*p(:,i))*p(:,i)';
        end

        %Test network
        for i = 1:3
            recallHebb = test_hw3( WHebb, p, maxNum, numFlips(i));
            recallSu = test_hw3( WSu, p, maxNum, numFlips(i));
            R(i,maxNum-1, 1) = recallHebb/maxNum*100;
            R(i,maxNum-1, 2) = recallSu/maxNum*100;
            %fprintf('Hebb rule network has accuracy of %i%% for numbers 0-%i with %i noise flips.\n', H(i,maxNum-1), maxNum-1, numFlips(i));
        end
    end
end