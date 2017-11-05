function [ Im_out ] =  Rotation (phi,  Im_in, switch1 )
% Rotation. Wir rotieren das Bild Im_in um phi.
%Erstmal mittels nearest neighbour
S_inv = [cos(-phi) -sin(-phi); sin(-phi) cos(-phi)]
%S = [cos(phi) -sin(phi); sin(phi) cos(phi)]
%S_inv = inv(S);
[n,m] = size(Im_in)
nh = cos(atan(m/n)-phi)*sqrt(n^2+m^2); % n Hut, das neue n
mh = sin(atan(m/n)+phi)*sqrt(n^2+m^2); % m Hut, das neue m
nh = floor(nh)
mh = floor(mh)

%Im_out = zeros(nh,mh);
if switch1
for k=1:nh
    for l=1:mh
				p = S_inv * [k;l];
				if p(1) < n &&  p(2) < m
        	Im_out(k,l) =  ( nearest_neighbour( p , Im_in) );
				else 
					Im_out(k,l) = 255;
				end
        % Wir setzen den Wert (k,l) den B da haben muss schon skaliert ein.
        % nearest neighbour kann dan mit der unter Umständen nicht
        % natürlichen Zahl umgehen, und gibt auch eine reelle Zahl zurück.
        % durch round wird B auch wieder diskret.
				Im_out;
    end
end
else 
%for k=1:nh
%    for l=1:mh
%        Im_out(k,l) =  ( bi_polar_interpolation( S_inv * [k;l] , Im_in) );
%        % Wir setzen den Wert (k,l) den B da haben muss schon skaliert ein.
%        % bi-polar-interpolation kann dan mit der unter Umständen nicht
%        % natürlichen Zahl umgehen, und gibt auch eine reelle Zahl zurück.
%        % durch round wird B auch wieder diskret.
%    end
%end
end
Im_out = mat2gray(Im_out);





end

