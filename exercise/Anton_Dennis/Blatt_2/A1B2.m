A = rgb2gray(imread('schneehase2.jpg'));
%A = rgb2gray(imread('lena_testbild.jpg'));

tic
B = lineareKontraststreckung(A); 
%imwrite([A B],'output_B.jpg')
toc

tic
C = histogrammEntzerrung(A);
imwrite([A C],'output_C.jpg')
toc
