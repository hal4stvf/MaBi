function [ Im_out] = lineareKontraststreckung(Im_in)
%% Lineare Konstraststreckung aus der Vorlesung.
%% Nimmt einen 

% size of the image
[n,m] = size(Im_in);
Im_out = zeros(n,m);

% declaring k_min, k_max and geting it
k_min = 255;
k_max = 0;

% k_min, k_max werden bestimmt
for k = 1:n
	for l = 1:m
		x = Im_in(k,l);
		if x < k_min 
			k_min = double(x);
		end
		if x > k_max
			k_max = (x);
		end
	end
end
zero = 0;
N = 255;
[k_min, k_max]
for k = 1:n
	for l = 1:m
		x = Im_in(k,l);
		switch x 
			case k_min
				Im_out(k,l) = zero;	
			case k_max
				Im_out(k,l) = N;
			otherwise	
				Im_out(k,l) = (double(x)- k_min)*N/(k_max - k_min);
		end
	end
end
%Im_out = mat2gray(Im_out);
end

