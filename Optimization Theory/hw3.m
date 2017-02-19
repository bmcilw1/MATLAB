% Brian McIlwian
% Hw #3 Section 3.3B

% Prob 2e
A = horzcat(eye(4), [4 -6 2 -4 0; 1 2 -2 4 40; 2 -1 1 2 8; 4 -2 1 -1 10])

divorig = (A(:,length(A))./A(:,5))
A = swapCol(A, 4, 5);
A = rref(A)

div = (A(:,length(A))./A(:,7))
A = swapCol(A, 3, 7);
A = rref(A)

% Prob 3
A = horzcat(eye(4), [1 2 -3 5 4; 5 -2 0 6 8; 2 3 -2 3 3; 1 0 1 -2 0])
divorig = (A(:,length(A))./A(:,8))
A = swapCol(A, 4, 8);
A = rref(A)

% Prob 8a
A = horzcat(eye(4), [-16 -15 0; 40 31 124; -1 1 1; 1 0 3])
divorig = (A(:,length(A))./A(:,5))
A = swapCol(A, 4, 5);
A = rref(A)

div = (A(:,length(A))./A(:,6))
A = swapCol(A, 2, 6);
A = rref(A)

div = (A(:,length(A))./A(:,5))
A = swapCol(A, 3, 5);
A = rref(A)

% Prob 8b
A = horzcat(eye(4), [-16 -15 0; 40 31 124; -1 1 1; 1 0 3])
divorig = (A(:,length(A))./A(:,6))

A = swapCol(A, 3, 6);
A = rref(A)

div = (A(:,length(A))./A(:,5))
A = swapCol(A, 2, 5);
A = rref(A)