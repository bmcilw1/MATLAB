function [ y ] = my_hardlim( n )
%MY_HARDLIM hardlim function
    y = all(n(:) > 0);
end

