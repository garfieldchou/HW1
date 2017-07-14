clear
data = dlmread('hw1_15_train.dat');
y = data(:, 5);
m = length(y);
X = [ones(m, 1) , data(:, [1: 4])];
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
fprintf('It took %d updates to complete PLA\r\n', update);