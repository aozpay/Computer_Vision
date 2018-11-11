Img = imread('pep.png');

A = imnoise(Img,'Gaussian',0.04,0.002);
B = imnoise(Img,'Salt & pepper',0.2);
C = imnoise(Img,'speckle');
D = imnoise(Img,'poisson');
figure,imshow(A);
figure,imshow(B);
figure,imshow(C);
figure,imshow(D);