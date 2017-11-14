%% Funktioniert noch nicht ganz richtig. Vergleiche zum Beispiel
%% das Schneehasenbild2
function [ Im_out] = histogrammEntzerrung(Im_in)
%% Histogramm Entzerrung aus der Vorlesung.
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

%% Implementierung des Histogramms
Histogramm = zeros(1,256);
for k = 1:n
	for l = 1:m
		x = Im_in(k,l);
		for i = 0:255
			if x == i
				Histogramm(i+1) = Histogramm(i+1)+1;
			end		
		end
	end
end

%%%%%%%%%%%%%
zero = 0;
N = 255;
[k_min, k_max];
for k = 1:n
	for l = 1:m
		x = Im_in(k,l);
		switch x 
			case k_min
				Im_out(k,l) = zero;	
			case k_max
				Im_out(k,l) = N;
			otherwise	
				sum = 0;
				for j = 1:x+1
				 sum = sum + Histogramm(j);
				end
				Im_out(k,l) = round((N*sum)/(n*m));
				if round((N*sum)/(n*m)) == 255
					(N*sum)/(n*m)
				end
		end
	end
end
%Im_out = mat2gray(Im_out);
% run A1B2.m
end

