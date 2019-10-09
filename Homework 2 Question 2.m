
mu1 = [0 0];
Sigma1 = eye(2);
mu2 = [3 3];
Sigma2 = eye(2);
rng(1); % For reproducibility
x1 = mvnrnd(mu1,Sigma1,400);
x2 = mvnrnd(mu2,Sigma2,400);
X = [x1; x2];
GMModel = fitgmdist(X,2);

figure
y = [zeros(400,1);ones(400,1)];
h = gscatter(X(:,1),X(:,2),y);
hold on
gmPDF = @(x1,x2)reshape(pdf(GMModel,[x1(:) x2(:)]),size(x1));
g = gca;
fcontour(gmPDF,[g.XLim g.YLim])
title('Question # 2 Part 1 Gaussian Mixture Model')

legend(h,'Model 1','Model 2')
hold off

 
 