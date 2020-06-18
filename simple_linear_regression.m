clc; clear all; close all;
Y = [3.5 4.5 2.1 2.5 2.3 3.3 1.9 3.0 3.8 4.6 4.0 3.2 4.0 2.9 4.1 3.2 4.3 ...
    2.5 2.6  3.8 3.0 4.2 3.9 3.3 ];
  
X = [46 57 22 22 28 29 20 25 43 63  49 34  52 28 57 40 52 24 30 36 33 ...
     48 58 50];
% X = [20 60 100 140 180 220 260 300 360 380];
% Y = [0.18 0.27 0.35 0.78 0.56 0.75 1.18 1.36 1.48 1.65];
 z = [Y' X'];
 plot(X',Y', 'o');
 format long
 hold on
 Ym = mean(Y);
 Xm = mean(X);
 d = size(Y);
 s = (1 / (d(1,2)-1)).*sum((Y-Ym).^2);
 err = s * (1+(1 / d(1,2)));
 sigma = sqrt(err);
 b0 = Ym;
 b1 = sum((X-Xm).*(Y-Ym)) / sum((X-Xm).^2);
 yp = b0 + b1.*(X-Xm);
 plot(z(:,2),yp,'r*-')
 ei = Y - yp;
 e_i = Y - Ym;
 E0 = sum(e_i.^2);
 
 E1 = sum(ei.^2);
 e = E0 - E1;
 difference = sum((yp - Ym).^2);
 SSe = sum((Y-yp).^2);
 SSr = sum((yp-Ym).^2);
 TS = sum((Y-Ym).^2);
 Msr = SSr;
 n1 = (d(1,2)-2);
 n2 = (d(1,2)-1);
 MSe = SSe / (d(1,2)-2);
 TSE = TS / (d(1,2)-1);
 f = Msr / MSe ;
 R_square = SSr / TS;
 fprintf('sources of variation        sum of squares        degree of freedom         mean sum of square         f ratio\n\n')
 disp('-----------------------------------------------------------------------------------------------------------------------------')
 fprintf('Regression sum of square      SSr =  %f             1                    MSr= %f       MSr / MSe = %f \n\n', SSr ,Msr, f)
 fprintf('Residual sum of square        SSe = %f               %d                    MSe= %f        ----------       \n\n', SSe,n1, MSe)
 fprintf('Total sum of square            %f                   %d                     %f            ---------- \n\n\n   ',TS,n2,TSE)
  fprintf('R_square= %f \n',R_square)
 F_distribution = finv(0.999,1,22)
 xlabel('x');ylabel('y');