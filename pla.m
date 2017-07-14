clear
data = dlmread('hw1_15_train.dat');
m = size(data, 1);
iter = 2000;
total_updates = 0;

for i = 1 : iter

	rand_indices = randperm(m);
	data_i = data(rand_indices, :);

	y = data_i(:, 5);
	X = [ones(m, 1) , data_i(:, [1: 4])];
	w = zeros(size(X, 2), 1);

	completed = 0;
	update = 0;
	n = 1;

	while completed < m

			if X(n, :)* w > 0
				y_pred = 1;
			else
				y_pred = -1;
			end

			if y(n) != y_pred
				update++;
				w = w + y(n)* X(n, :)' ;
				completed = 0;
			else
				completed += 1;			
			end
			
	        if n == m
	        	n = 1;
	        else
	        	n++;
	        end
		
	end
	% fprintf('Iteration %d took %d updates to complete PLA\r\n', i, update);
	total_updates += update;

end

fprintf('It took %d updates in average for %d iterations to complete PLA\r\n', total_updates / iter, iter);