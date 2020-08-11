m = size(X,1);
[theta] = trainLinearReg([ones(m, 1) X_poly], y, 3);
mtest = size(Xtest,1);
[J, grad] = linearRegCostFunction([ones(mtest, 1) X_poly_test], ytest, theta, 0);
J