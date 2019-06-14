gridx1 =linspace(0,6.84,120);
gridx2 = linspace(0,6.84,120);
gridx3 = linspace(0,2.1,15);
[x1,x2,x3] = ndgrid(gridx1,gridx2,gridx3);
x1 = x1(:,:)';
x2 = x2(:,:)';
x3 = x3(:,:)';
xi = [x1(:) x2(:) x3(:)];
m = csvread('points1.csv');
f = mvksdensity(m,xi,'Bandwidth',0.19);


 imagesc(test3,[0 1]); colormap(gray);
load("filename.mat")