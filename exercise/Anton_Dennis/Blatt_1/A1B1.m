A = rgb2gray(imread('lena_testbild.jpg'));

subplot(3, 1,1), subimage(A);
gamma = [0.01,0.01]; % [y,x] 

tic
B = Skalierung(gamma, A, 1);
subplot(3,1,2), subimage(B);
toc
tic
C = Skalierung( gamma, A, 0);
subplot(3,1,3), subimage(C);
toc
