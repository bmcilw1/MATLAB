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
numFlips = [2, 4, 6];
H = ones(3, 6);
Su = ones(3, 6);
for maxNum = 2:7
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
        H(i,maxNum-1) = recallHebb/maxNum*100;
        Su(i,maxNum-1) = recallSu/maxNum*100;
        %fprintf('Hebb rule network has accuracy of %i%% for numbers 0-%i with %i noise flips.\n', H(i,maxNum-1), maxNum-1, numFlips(i));
    end
end

I = 1:6;

figure;

subplot(2,3,1);
plot(I,H(1, :), '-o');
title('Hebb 2 Noise Bits')
xlabel('Max Number')
set(gca,'xtick',1:6)
ylabel('% Accuracy')
grid on

subplot(2,3,2);
plot(I,H(2, :), '-o');
title('Hebb 4 Noise Bits')
xlabel('Max Number')
set(gca,'xtick',1:6)
ylabel('% Accuracy')
grid on

subplot(2,3,3);
plot(I,H(3, :), '-o');
title('Hebb 6 Noise Bits')
xlabel('Max Number')
set(gca,'xtick',1:6)
ylabel('% Accuracy')
grid on

subplot(2,3,4);
plot(I,Su(1, :), '-o');
title('Pseudo 2 Noise Bits')
xlabel('Max Number')
set(gca,'xtick',1:6)
ylabel('% Accuracy')
grid on

subplot(2,3,5);
plot(I,Su(2, :), '-o');
title('Pseudo 4 Noise Bits')
xlabel('Max Number')
set(gca,'xtick',1:6)
ylabel('% Accuracy')
grid on

subplot(2,3,6);
plot(I,Su(3, :), '-o');
title('Pseudo 6 Noise Bits')
xlabel('Max Number')
set(gca,'xtick',1:6)
ylabel('% Accuracy')
grid on