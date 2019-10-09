mean1 = [0 0];
CoVa1 = [2 0.5; 0.5 1];
mean2 = [2 2];
CoVa2 = [2 -1.9; -1.9 5];
rng(1); 
x1 = mvnrnd(mean1,CoVa1,400);
x2 = mvnrnd(mean2,CoVa2,400);
X = [x1; x2];
GMModel = fitgmdist(X,2);

figure
y = [zeros(400,1);ones(400,1)];
h = gscatter(X(:,1),X(:,2),y);
hold on
gmPDF = @(x1,x2)reshape(pdf(GMModel,[x1(:) x2(:)]),size(x1));
g = gca;
fcontour(gmPDF,[g.XLim g.YLim])
title('Question # 2 Part 2 Gaussian Mixture Model', 'FontSize', 14);
xlabel('Distance across X', 'FontSize', 14);
ylabel('Distance across Y', 'FontSize', 14);
legend(h,'Model 1','Model 2');
hold off

 
 