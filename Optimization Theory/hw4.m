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