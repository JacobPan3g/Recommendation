function res = test( X, theta, indexs )

[m, n] = size(indexs);
res = zeros(m, 1);
for i = 1:m
	%indexs(i,1) indexs(i,2)
	res(i) = theta( :,indexs(i,2) )' * X( :, indexs(i,1) );
end

end
