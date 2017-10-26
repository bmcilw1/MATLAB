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
R = run_hw3(p);

I = 1:6;
figure('name', 'Part I and II - Reconizing Numbers');

subplot(1,3,1);
plot(I, R(1, :, 1), '-o', I, R(1, :, 2), '-o');
title('2 Noise Bits')
xlabel('Max Number')
set(gca,'xtick',1:6)
ylabel('% Accuracy')
ylim([20 100])
grid on
legend('Hebb', 'Psuedo')

subplot(1,3,2);
plot(I,R(2,:,1), '-o', I, R(2,:,2), '-o');
title('4 Noise Bits')
xlabel('Max Number')
set(gca,'xtick',1:6)
ylabel('% Accuracy')
ylim([20 100])
grid on
legend('Hebb', 'Psuedo')

subplot(1,3,3);
plot(I,R(3,:,1), '-o', I, R(3,:,2), '-o');
title('6 Noise Bits')
xlabel('Max Number')
set(gca,'xtick',1:6)
ylabel('% Accuracy')
ylim([20 100])
grid on
legend('Hebb', 'Psuedo')