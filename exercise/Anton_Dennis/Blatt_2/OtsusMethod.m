function [ Im_out] = otsusMethode(q, Im_in)
%% Lineare Konstraststreckung aus der Vorlesung.
%% Nimmt einen 

% size of the image
[n,m] = size(Im_in);
Im_out = zeros(n,m);



for k = 1:n
	for l = 1:m
		x = Im_in(k,l);
		if x <= t
			Im_out(k,l) = 0;
		else
			Im_out(k,l) = 255;
		end
	end
end
%Im_out = mat2gray(Im_out);
end

