clear
data = dlmread('hw1_15_train-small.dat');
X = data(:, [1: 4]);
y = data(:, 5);
m = length(y);
w = zeros(size(X, 2), 1);

completed = false;
update = 0;

while !completed
	for i = 1: m
		if X(i, :)* w > 0
			y_pred = 1;
		else
			y_pred = -1;
		end

		if y(i) != y_pred
			update += 1;
			w = w + y(i)* X(i, :)' ;
			fprintf('i=%3d, w = [%f %f %f %f]\r\n', i, w);
			completed = false;
			break;
		end
		completed = true;
	end
end