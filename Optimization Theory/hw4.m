% Brian McIlwian
% Hw #4 Section 3.4A

% Prob 5
A = horzcat(eye(3), [3 -4 2 -1 17; 1 1 1 0 7; 2 -5 1 -1 10])

divorig = (A(:,length(A))./A(:,4))
A = swapCol(A, 3, 4);
A = rref(A)

divorig = (A(:,length(A))./A(:,5))
A = swapCol(A, 2, 5);
A = rref(A)

A = horzcat(eye(3), [50/7 1/7 102/7; 1/7 1/7 4/7; 6/7 -1/7 45/7])
divorig = (A(:,length(A))./A(:,4))
A = swapCol(A, 2, 4);
A = rref(A)

% Made up problem - phase 1 only
A = horzcat(eye(4), [1 0 -1 10; 1 1 0 5; 1 0 -1 10; 1 0 0 1])
divorig = (A(:,length(A))./A(:,5))
A = swapCol(A, 4, 5);
A = rref(A)

clc
% Prob 3.5B #2
A = horzcat(eye(3), [-2 1 -3 0; 1 -1 5 10; 2 -1 3 40])
divorig = (A(:,length(A))./A(:,6))
A = swapCol(A, 2, 6);
A = rref(A)

div = (A(:,length(A))./A(:,4))
A = swapCol(A, 2, 4);
A = rref(A)

div = (A(:,length(A))./A(:,5))
A = swapCol(A, 3, 5);
A = rref(A)

div = (A(:,length(A))./A(:,5))
A = swapCol(A, 3, 5);
A = rref(A)