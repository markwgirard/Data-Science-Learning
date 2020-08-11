function [J, grad] = costFunctionReg(theta, X, y, lambda)
%COSTFUNCTIONREG Compute cost and gradient for logistic regression with regularization
%   J = COSTFUNCTIONREG(theta, X, y, lambda) computes the cost of using
%   theta as the parameter for regularized logistic regression and the
%   gradient of the cost w.r.t. to the parameters. 

% Initialize some useful values
m = length(y); % number of training examples

% You need to return the following variables correctly 
J = 0;
grad = zeros(size(theta));

% ====================== YOUR CODE HERE ======================
% Instructions: Compute the cost of a particular choice of theta.
%               You should set J to the cost.
%               Compute the partial derivatives and set grad to the partial
%               derivatives of the cost w.r.t. each parameter in theta

J1 = (-log(sigmoid(X*theta))'*y - log(1-sigmoid(X*theta))'*(1-y))/m;
J2 = lambda/(2*m)*sum(theta(2:end).^2);
J = J1 + J2;


grad1 = X'*(sigmoid(X*theta)-y)/m;
grad2 = lambda/m*[zeros(1) theta(2:end)']';
grad = grad1 + grad2;



% =============================================================

end
