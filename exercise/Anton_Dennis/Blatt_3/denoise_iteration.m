function [ noise_img] = denoise_iteration(filter,noise_img,steps)

	[n,m] = size(noise_img);
	[k,k] = size(filter);
	km = (k-1)/2;
	mid = km + 1;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% Spiegel in neue Matrixmethode
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% Neue Matrix (Methode) für die Ränder
%% neue Dimensionen
%	nn = n + 2*km;
%	mm = m + 2*km;

%REMOVEAFTERUSE%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% Testcode
%km = 10;
%mid = 11;
%	nn = n + 2*km;
%	mm = m + 2*km;
%dimg = mat2gray(zeros(nn,mm));
%dimg(mid:nn-km,mid:mm-km) = noise_img;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%%% Spiegelt die Ränder
%% oben
%	dimg(1:mid,mid:mm-km) = flipud(noise_img(1:mid,:));
%%links 
%	dimg(mid:nn-km,1:mid) = fliplr(noise_img(:,1:mid));
%%rechts
%	dimg(mid:nn-km,mm-mid:mm) = fliplr(noise_img(:,m-mid:m));
%%unten
%	dimg(nn-mid:nn,mid:mm-km) = flipud(noise_img(n-mid:n,:));
%%ecke oben links 
%	dimg(1:mid,1:mid) = flipud(fliplr(noise_img(1:mid,1:mid)))';
%%ecke oben rechts 
%	dimg(1:mid,mm-mid:mm) = flipud(fliplr(noise_img(1:mid,m-mid:m)));
%%ecke unten links
%	dimg(nn-mid:nn,1:mid) = flipud(fliplr(noise_img(n-mid:n,1:mid)));
%%ecke unten rechts 
% dimg(nn-mid:nn,mm-mid:mm) = fliplr(flipud(noise_img(n-mid:n,m-mid:m)'));
%for l = 1: steps
%	for i = 1:n
%		for j = 1 : m
%				noise_img(i,j) = filter_m(filter,i+km,j+km,dimg); 
%		end 
%	end
%end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Methode Ende
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

for l = 1: steps
	for i = 1:n
		for j = 1 : m
				if (i-km) < 1 || (i+km) > n || (j-km) < 1 || (j+km) > 1
					noise_img(i,j) = filter_spiegel(filter,i,j,noise_img); 
				else 		
				noise_img(i,j) = filter_m(filter,i+km,j+km,noise_img); 
		end 
	end
end


end
