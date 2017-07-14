function ySigned = sign( Xw )

[m, n] = size(Xw);

for i = 1 : m
	for j = 1 : n

		if Xw(i, j) > 0
			ySigned(i, j) = 1;
		else
			ySigned(i, j) = -1;
		end

	end
end

return