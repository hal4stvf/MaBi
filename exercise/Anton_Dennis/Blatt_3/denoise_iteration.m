function [ noise_img] = denoise_iteration(filter,noise_img,steps)
%function [dimg] = denoise_iteration(filter,noise_img,steps)

[n,m] = size(noise_img);
[k,k] = size(filter);
km = (k-1)/2;
mid = km + 1;

nn = n + 2*km;
mm = m + 2*km;
% Neue Matrix für die Ränder

dimg = (zeros(nn,mm));
dimg(mid:nn-km,mid:mm-km) = noise_img;

% Spiegelt die Ränder
% oben
dimg(1:mid,mid:mm-km) = flipud(noise_img(1:mid,:));
%links 
dimg(mid:nn-km,1:mid) = fliplr(noise_img(:,1:mid));
%rechts
dimg(mid:nn-km,mm-mid:mm) = fliplr(noise_img(:,m-mid:m));
%unten
dimg(nn-mid:nn,mid:mm-km) = flipud(noise_img(n-mid:n,:));
%ecke oben links 
%ecke oben rechts 
%ecke unten links
%ecke unten links
noise_img = mat2gray(full(dimg));
for l = 1: steps
	for i = 1:n
		for j = 1 : m
%				noise_img(i,j) = filter_m(filter,i+km,j+km,dimg); 
		end 
	end
end


end
