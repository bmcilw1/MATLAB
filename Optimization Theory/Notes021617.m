%Brian McIlwain
%Simplex tableau

% Store as rationals
format rat;

% Input matrix
A = [1 -5 -4 0 0 0 0 0; 0 6 4 1 0 0 0 24; 0 1 2 0 1 0 0 6; 0 -1 1 0 0 1 0 1; 0 0 1 0 0 0 1 2]

rref(A)

% Format given matrix
A = swapCol(A, 2, 6);
A = swapCol(A, 3, 7);

% Division for next step
Adiv = (A(:,8)./A(:,2))

% Specify piviots for rref
A = swapCol(A, 6, 4);

% Show
b1 = rref(A)

%A = swapCol(A, )
