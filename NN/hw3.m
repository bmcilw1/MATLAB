% Brian McIlwain
% HW #3 Hebb / Pseudoinverse

% Load in input
p = zeros(30, 7);
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
three = [ 1  1  1  1 -1;
         -1 -1 -1 -1  1;
         -1 -1 -1 -1  1;
         -1 -1  1  1  1;
         -1 -1 -1 -1  1;
          1  1  1  1 -1;];
p(:,4) = three(:);
four =  [ 1 -1 -1 -1  1;
          1 -1 -1 -1  1;
          1 -1 -1 -1  1;
          1  1  1  1  1;
         -1 -1 -1 -1  1;
         -1 -1 -1 -1  1;];
p(:,5) = four(:);
five =  [-1  1  1  1  1;
         -1  1 -1 -1 -1;
         -1  1  1  1 -1;
         -1 -1 -1 -1  1;
         -1 -1 -1 -1  1;
         -1  1  1  1 -1;];
p(:,6) = five(:);
six =   [ 1  1  1  1  1;
          1 -1 -1 -1 -1;
          1 -1 -1 -1 -1;
          1  1  1  1 -1;
          1 -1 -1  1 -1;
          1  1  1  1 -1;];
p(:,7) = six(:);

% Test numbers 0-1, 0-2, ..., 0-6
for maxNum = 2:7 
    % Will go from 0 to maxNum - 1
    % Hebb rule W: sum of all PnPn'
    WHebb = zeros(30,30);
    for i=1:maxNum
        WHebb = WHebb + p(:,i)*p(:,i)';
    end

    %Test network
    for numFlips = [2, 4, 6]
        recallHebb = test_hw3( WHebb, p, maxNum, numFlips );
        fprintf('Hebb rule network has accuracy of %i%% for numbers 0-%i with %i noise flips.\n', recallHebb/maxNum*100, maxNum-1, numFlips);
    end
end