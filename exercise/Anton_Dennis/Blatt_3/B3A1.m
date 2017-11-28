img = rgb2gray(imread('../Blatt_2/lena_testbild.jpg'));

eq_filter = [0 1 0; 1 1 1; 0 1 0]*(1/5);
gauss_filter = [ 1 2 1; 2 4 2; 1 2 1]*(1/16);

[n,m] = size(img);
noise_img = imnoise(img,'speckle');

newimg = denoise_iteration(eq_filter,noise_img,1);
newimg_gauss= denoise_iteration(gauss_filter,noise_img,3);

imwrite([noise_img newimg newimg_gauss],'output_newimg.jpg')


