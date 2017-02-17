%Brian McIlwain
%Simplex tableau
% Freddy Miiks problem from text
format rat

% Input matrix
A = horzcat(eye(5), [-5 -4 0; 6 4 24; 1 2 6; -1 1 1; 0 1 2]);

% Show
A = rref(A)

% Division for next step
Adiv = A(:,length(A))./A(:,6)

% Next step
A = swapCol(A, 2, 6);
A = rref(A)

Adiv = A(:,length(A))./A(:,7)

A = swapCol(A, 3, 7);
A = rref(A)