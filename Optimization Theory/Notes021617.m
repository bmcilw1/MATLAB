%Brian McIlwain
%Simplex tableau

% Store as rationals
format rat;

% Input matrix
    I5 = eye(5);
    A1 = [-5 -4 0; 6 4 24; 1 2 6; -1 1 1; 0 1 2];
    % Horizontal concactnate
    A = horzcat(I5, A1)

% Division for next step
Adiv = (A(:,8)./A(:,6))

% Show
b1 = rref(A)

% Next step
A = swapCol(A, 2, 6);
b2 = rref(A)