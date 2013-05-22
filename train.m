format long
load main

% some settings
alpha = 0.0001;
lamda = 5;
iter_time = 1e9;
err = 1e-3;
n = 20;

[nm, nu] = size( data );

% initial
X = rand( n, nm );
X(1,:) = 1;
theta = rand( n, nu );

% gradientDescent
y = data;
reg1 = ones( n, nm ) * ( 1 - alpha * lamda );
reg1(1,:) = 0;
reg2 = ones( n, nu ) * ( 1 - alpha * lamda );
reg2(1,:) = 0;

for iter = 1 : iter_time
	old_X = X;
	old_0 = theta;
	
	tmp = X' * theta - y;
	dJx = theta * tmp';
	dJ0 = X * tmp;
	X = X .* reg1 - alpha * dJx;
	theta = theta .* reg2 - alpha * dJ0;
	
	dX = norm( X - old_X );
	d0 = norm( theta - old_0 )

	if dX < err && d0 <  err
		disp( iter )
		break
	end
end
