function y = swapCol(A, i, j )
%SWAPCOL swaps cols i j in matrix
A(:,[i j]) = A(:,[j i]);

y = A;
end

