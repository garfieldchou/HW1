clear
trainData = dlmread('hw1_18_train.dat');
testData = dlmread('hw1_18_test.dat');
m = size(trainData, 1);
iter = 2000;
total_testErr = 0;

yt = testData(:, 5);
Xt = [ones(size(yt), 1) , testData(:, [1: 4])];

for i = 1 : iter

	rand_indices = randperm(m);
	trainData_i = trainData(rand_indices, :);

	y = trainData_i(:, 5);
	X = [ones(m, 1) , trainData_i(:, [1: 4])];
	w = zeros(size(X, 2), 1);
    w_pkt = zeros(size(X, 2), 1);

	n = 1;
    update = 0;

	while update < 100

		y_pred = sign(X(n, :)* w);
        % fprintf('y_pred = %f, y(n) = %f\r\n', y_pred, y(n));

		if y(n) != y_pred
			w = w + y(n)* X(n, :)';
            % fprintf('w = [%f, %f, %f, %f, %f]\r\n', w');
            % fprintf('w error = %f, w pocket error = %f\r\n', sum(sign(X * w) != y), sum(sign(X * w_pkt) != y));

			if sum(sign(X * w) != y) < sum(sign(X * w_pkt) != y)
				w_pkt = w;
			end
            update++;
		end
        
        % fprintf('w_pkt = [%f, %f, %f, %f, %f]\r\n\n', w_pkt');
			
	    if n == m
	       	n = 1;
	    else
	      	n++;
	    end
        
	end
    
    testErr = sum(sign(Xt * w_pkt) != yt);
    total_testErr += testErr;

	err_rate = testErr / size(yt, 1);
	fprintf('error rate of %4d iteration is %f \r\n', i, err_rate);
    fflush(stdout);

end

fprintf('average error rate of %d iterations is %f \r\n', iter, total_testErr / (size(yt, 1) * iter));