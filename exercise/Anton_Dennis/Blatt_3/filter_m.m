function [ u ] = filter_m(filter,q,w,img)
	%u =  ...
	% filter(1,2)*double(img_in(i-1,j)) ...
	%+ filter(2,1)*double(img_in(i,j-1)) ...
	%+ filter(2,2)*double(img_in(i,j)) ... 
	%+ filter(2,3)*double(img_in(i,j+1)) ... 
	%+ filter(3,2)*double(img_in(i+1,j)); 

% Initializiere den Startvektor
	u = 0;
% Hole Größe und km
	[n,m] = size(img);
	[k,k] = size(filter);
	km = (k-1)/2;
	mid = km +1;


Km = [-km : km];
for i = Km 
	for j = Km 
		u = u + filter(mid + i,mid + j)*img(q+i,w+j);	
	end
end

end
