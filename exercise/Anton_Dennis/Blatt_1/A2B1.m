A = rgb2gray(imread('lena_testbild.jpg'));
%A = [ 0 0 0; 0 0 0; 1 1 1]

subplot(3, 1,1), subimage(A);
%Sollte erstmal zwischen 0 und 45 Grad liegen
phi = pi/4;

tic
B = Rotation(phi, A, 1);
subplot(3,1,2), subimage(B);
toc
tic
%C = Rotation( phi, A, 0);
subplot(3,1,3), subimage(C);
toc
imwrite(B,'testrun.jpg');
