function [] = inClass( )
%Brian McIlwain in class import and export from csv

in = csvread('randata.csv');
x = in(:,1);
y = in(:,2);
stem(x,y);
title('Brian McIlwain random data csv import');
end

