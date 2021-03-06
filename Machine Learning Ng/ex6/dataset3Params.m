function [C, sigma] = dataset3Params(X, y, Xval, yval)
%DATASET3PARAMS returns your choice of C and sigma for Part 3 of the exercise
%where you select the optimal (C, sigma) learning parameters to use for SVM
%with RBF kernel
%   [C, sigma] = DATASET3PARAMS(X, y, Xval, yval) returns your choice of C and 
%   sigma. You should complete this function to return the optimal C and 
%   sigma based on a cross-validation set.
%

% You need to return the following variables correctly.
C = 1;
sigma = 0.3;

% ====================== YOUR CODE HERE ======================
% Instructions: Fill in this function to return the optimal C and sigma
%               learning parameters found using the cross validation set.
%               You can use svmPredict to predict the labels on the cross
%               validation set. For example, 
%                   predictions = svmPredict(model, Xval);
%               will return the predictions on the cross validation set.
%
%  Note: You can compute the prediction error using 
%        mean(double(predictions ~= yval))
%


C_list = [.01 .03 .1 .3 1. 3 10 30];
sigma_list = C_list;
C_opt = 0;
sigma_opt = 0;
error_opt =1;

for i=1:length(C_list)
    for j=1:length(sigma_list)
        C = C_list(i);
        sigma = sigma_list(j);
        model = svmTrain(X, y, C, @(x1, x2) gaussianKernel(x1, x2, sigma));
        pred = svmPredict(model, Xval);
        error = mean(double(pred ~= yval));
        %fprintf('C is %f, sigma is %f, error is %f\n', C, sigma,error);
        if error < error_opt
            C_opt = C;
            sigma_opt = sigma;
            error_opt = error;
        end 
    end
end

C = C_opt;
sigma = sigma_opt;

% =========================================================================

end
