function [ u ] = filter_spiegel(filter,q,w,img)

% Hole Größe und km
	[n,m] = size(img);
	[k,k] = size(filter);
	km = (k-1)/2;
	mid = km +1;

Img = zeros(k); 

Km = [-km : km];

for k = Km
	for l = Km
		if (q+k) < 1
			a = -k;
		elseif (q+k) > n
			a = -k;
		else 
			a = k;
		end

		if (w+l) < 1 
			b = -l;
		elseif (w +l) > n	
			b = -l;
		else
			b = l;
		end
		Img(k+1+km, l + 1+km) = img(q+a,w+b);
	end
end
u = 0;
Km = [-km : km];
for i = Km 
	for j = Km 
		u = u + filter(mid + i,mid + j)*Img(mid+i,mid+j);	
	end
end

end
