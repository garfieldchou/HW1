clear
data = dlmread('hw1_15_train-small.dat');
X = data(:, [1: 4]);
y = data(:, 5);
m = length(y);
w = zeros(size(X, 2), 1);

completed = 0;
update = 0;
idx = 0;

while (completed < m) || (update < 250)
	
		if X(mod(idx + completed, m)+ 1, :)* w > 0
			y_pred = 1;
		else
			y_pred = -1;
		end

		if y(mod(idx + completed, m)+ 1) != y_pred
			update += 1;
			w = w + y(mod(idx + completed, m)+ 1)* X(mod(idx + completed, m)+ 1, :)' ;
			fprintf('i=%3d, w = [%f %f %f %f]\r\n', mod(idx + completed, m)+ 1, w);
            idx += completed;
			completed = 0;
			continue;
		end
		completed++;
	
end