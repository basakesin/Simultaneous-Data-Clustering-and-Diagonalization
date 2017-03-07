% This code identifies the number of clusters and seeks a transformation
% that makes these culsters orthoganal. 
%
%
% Required Packages
% QSL Toolbox , available on http://web.iyte.edu.tr/~bilgekaracali/Projects/QSL/qsl.tar.gz
% icalab Toolbox, available on http://www.bsp.brain.riken.jp/ICALAB/ICALABSignalProcDownload.php
% ABMFEM Matlab Toolbox, available on https://github.com/basakesin/ABMFEM


N = 100;

% create toy dataset
X1 = exp(mvnrnd([4 8 4],[0.5 0.3 0.5;0.3 0.5 0.5;0.5 0.5 0.7],10*N));
X2 = exp(mvnrnd([4 4 4],[0.3 0.1 0.3;0.1 0.4 0.2;0.3 0.2 0.4],8*N));
X3 = exp(mvnrnd([8 8 4],[0.3 0.2 0.1;0.2 0.3 0.2;0.1 0.2 0.4],10*N));


figure(1)
clf
plot3(X1(:,1),X1(:,2),X1(:,3),'.');
hold on
plot3(X2(:,1),X2(:,2),X2(:,3),'r.');
plot3(X3(:,1),X3(:,2),X3(:,3),'g.')
xlabel('first variate');
ylabel('second variate');
zlabel('third variate')
legend('x in C_1','x in C_2','x in C_3');
title('Vectors in C_1, C_2 and C_3');
grid on


X=[X1; X2; X3];

Y=[ones(length(X1),1); 2*ones(length(X2),1); 3*ones(length(X3),1)];

 
% Apply Gamma Normalization on Data
for i = 1:3
	GammaNormalizedData(:,i) = GammaNormalization(X(:,i));
end

% Identify distinct clusters
[data, labels, clusters] = divideData(GammaNormalizedData);


% Find clusters covariance matrices
C = [];

for k = 1:length(clusters)
   Ci = cov(GammaNormalizedData( find(labels == k), :));
   C(:, :, k) = Ci;
end

% Find a transformation matrix that make clusters as orthogonal as possible

B = ffdiag(C);

DiagonalizedData = (B*GammaNormalizedData')';

for i = 1:3
	GammaNormalizedDiagonalizedData(:,i) = GammaNormalization(DiagonalizedData(:,i));
end

% Plot Clustered and Diagonalized Data
figure(2)
clf
plot3(GammaNormalizedDiagonalizedData(labels==1,1),GammaNormalizedDiagonalizedData(labels==1,2),GammaNormalizedDiagonalizedData(labels==1,3),'.');
hold on
plot3(GammaNormalizedDiagonalizedData(labels==2,1),GammaNormalizedDiagonalizedData(labels==2,2),GammaNormalizedDiagonalizedData(labels==2,3),'r.');
plot3(GammaNormalizedDiagonalizedData(labels==3,1),GammaNormalizedDiagonalizedData(labels==3,2),GammaNormalizedDiagonalizedData(labels==3,3),'g.');
xlabel('first variate');
ylabel('second variate');
zlabel('third variate')
legend('x in C_1','x in C_2','x in C_3');
title('Diagonalized Vectors in C_1, C_2 and C_3');
grid on

% If you need final clustering uncomment the following code line (generally not neccessary).

%[final_data, final_labels, final_clusters] = divideData(GammaNormalizedDiagonalizedData);



