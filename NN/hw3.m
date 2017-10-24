% Brian McIlwain
% HW #3 Hebb / Pseudoinverse

% Load in input
p = zeros(30, 10);
zero = [-1  1  1  1 -1;
         1 -1 -1 -1  1;
         1 -1 -1 -1  1;
         1 -1 -1 -1  1;
         1 -1 -1 -1  1;
        -1  1  1  1 -1;];
%I = imcomplement(mat2gray(zero));
%imshow(I);
p(:,1) = zero(:);
one = [-1  1  1 -1 -1;
       -1 -1  1 -1 -1;
       -1 -1  1 -1 -1;
       -1 -1  1 -1 -1;
       -1 -1  1 -1 -1;
       -1 -1  1 -1 -1;];
p(:,2) = one(:);
two = [ 1  1  1 -1 -1;
       -1 -1 -1  1 -1;
       -1 -1 -1  1 -1;
       -1  1  1 -1 -1;
       -1  1 -1 -1 -1;
       -1  1  1  1  1;];
p(:,3) = two(:);

maxNum = 2;
% Hebb rule W: sum of all PnPn'
WHebb = zeros(30,30);
for i=1:maxNum
    WHebb = WHebb + p(:,i)*p(:,i)';
end

%Test network
recallHebb = 0;
numFlips = 2;
for k=1:10
    % Add random noise
    Test = p(:, :);
    for i=1:maxNum
        for j=1:numFlips
            % Get random index
            r = randperm(30);
            r = r(1);
            % Flip the bit
            Test(r, i) = Test(r, i)*-1;
        end
    end

    for i=1:maxNum
        aHebb = my_hardlims(WHebb*Test(:,i));
        err = any(aHebb-p(:,i) ~= 0);
        recallHebb = recallHebb + 1 - err;
    end
end

fprintf('Hebb rule network has accuracy of %i%% for numbers 0-%i with %i noise flips.\n', recallHebb/(k*maxNum)*100, maxNum-1, numFlips);