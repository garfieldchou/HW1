data = dlmread('hw1_15_train.dat');
X = data(:, [1: 4]);
y = data(:, 5);
m = length(y);
w = zeros(size(X, 2), 1);