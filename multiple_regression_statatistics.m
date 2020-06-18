clc;clear all;close all;
x = [35.3 29.7 30.8 58.8 61.4 71.3 74.4 76.7 70.7 57.5 46.4 28.9 28.1 39.1...
    46.8 48.5 59.3 70.0 70.0 74.5 72.1 58.1 44.6 33.4 28.6]';
y = [10.98 11.13 12.51 8.40 9.27 8.73 6.36 8.50 7.82 9.14 8.24 12.19 11.88...
    9.57 10.94 9.58 10.09 8.11 6.83 8.88 7.68 8.47 8.86 10.36 11.08]';
z = [20 20 23 20 21 22 11 23 21 20 20 21 21 19 23 20 22 22 11 23 20 21 ...
     20 20 22]';
% y = [2256 2295 2426 2364 2440]';
% x = [80 82 100 95 97]';
% z = [8 12 10 11 13]';
format long
X = [ones(size(x)) x z x.*x z.*z x.*z];
% X = [ones(size(x)) x z ];
c = ((X'*X)^(-1));
beta_cap = ((X'*X)^(-1))*X'*y;
covariance_beta = cov(beta_cap)
y_cap = X*beta_cap;
e = y - y_cap;
p = 2;
n = 25;
Ym = mean(y);
SSr = (beta_cap)'*X'*y-n*(Ym^2);
SSe = y'*y-(beta_cap)'*X'*y;
MSr = SSr / p ;
MSe = SSe / (n-p-1);
Syy = y'*y - n*(Ym^2);
f = MSr / MSe ;
fprintf('                                        ANOVA TABLE \n\n\n')
fprintf('sources of variation        sum of squares        degree of freedom         mean sum of square         f ratio\n\n')
 disp('-----------------------------------------------------------------------------------------------------------------------------')
 fprintf('Regression sum of square      SSr =  %f             %d                    MSr= %f       MSr / MSe = %f \n\n', SSr, p ,MSr, f)
 fprintf('Residual sum of square        SSe = %f               %d                    MSe= %f        ----------       \n\n', SSe,(n-p-1), MSe)
 fprintf('Total sum of square           Syy = %f              %d                     %f            ---------- \n\n\n',Syy,(n-1))
 fprintf('\n\n\n')
 
 
 R_square = SSr / Syy 
 
 F_distribution = finv(0.95,2,22)
 
 s_square = MSe;
 s = sqrt(MSe);
contour(X)
title('contour plot for X');
figure
surf(X)
title('surface plot for X');
figure
surfc(X)
title('surface plot with contour for X')
%  beta0_cap = sqrt(s_square*c(1,1))
%  beta1_cap = sqrt(s_square*c(2,2))
%  beta2_cap = sqrt(s_square*c(3,3))
%  T0 = beta_cap(1,1) / beta0_cap
%  T1 = beta_cap(2,1) / beta1_cap
%  T2 = beta_cap(3,1) / beta2_cap
%  alpha = 0.05;
%  tail = 'both';
%  [h,p] = ttest(x,y,alpha,tail);
 
 
 
 
 