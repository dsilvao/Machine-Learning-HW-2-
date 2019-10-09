
mean1 = [0 0];
CoVa1 = [3 1;1 ,3];
mean2 = [3 3];
CoVa2 =[3 1;1 ,3];
CBmean = [0 0;3 3];
CoVaC(:,:,1) = [3 1;1 ,3];
CoVaC(:,:,2) = 2*[3 1;1 ,3];
x1 = mvnrnd(mean1,CoVa1,400);
x2 = mvnrnd(mean2,CoVa2,400);
X = [x1; x2];
rng(1); 
P = [5/100, 95/100];
S = struct('mu', CBmean,'Sigma',CoVaC, 'ComponentProportion',P);
GMModel = fitgmdist(X,2,'start',S);
GMModel.ComponentProportion
figure
y = [zeros(400,1);ones(400,1)];
h = gscatter(X(:,1),X(:,2),y);
hold on
gmPDF = @(x1,x2)reshape(pdf(GMModel,[x1(:) x2(:)]),size(x1));
g = gca;
fcontour(gmPDF,[g.XLim g.YLim])
title('Question # 2 Part 5 Gaussian Mixture Model', 'FontSize', 14);
xlabel('Distance across X', 'FontSize', 14);
ylabel('Distance across Y', 'FontSize', 14);
legend(h,'Model 1','Model 2');
hold off