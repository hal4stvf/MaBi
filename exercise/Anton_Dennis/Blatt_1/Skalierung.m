function [ Im_out ] = Skalierung (gamma,  Im_in, switch1 )
% Skalierung. Wir skalieren das Bild Im_in um.
%Erstmal mittels nearest neighbour
S = [gamma(1) 0; 0 gamma(2)];
S_inv = inv(S);
[n,m] = size(Im_in);
nh = round(gamma(1) * n); % n Hut, das neue n
mh = round(gamma(2) * m); % m Hut, das neue m

Im_out = zeros(nh,mh);
if switch1
for k=1:nh
    for l=1:mh
        Im_out(k,l) =  ( nearest_neighbour( S_inv * [k;l] , Im_in) );
        % Wir setzen den Wert (k,l) den B da haben muss schon skaliert ein.
        % nearest neighbour kann dan mit der unter Umständen nicht
        % natürlichen Zahl umgehen, und gibt auch eine reelle Zahl zurück.
        % durch round wird B auch wieder diskret.
    end
end
else 
for k=1:nh
    for l=1:mh
        Im_out(k,l) =  ( bi_polar_interpolation( S_inv * [k;l] , Im_in) );
        % Wir setzen den Wert (k,l) den B da haben muss schon skaliert ein.
        % bi-polar-interpolation kann dan mit der unter Umständen nicht
        % natürlichen Zahl umgehen, und gibt auch eine reelle Zahl zurück.
        % durch round wird B auch wieder diskret.
    end
end
end
Im_out = mat2gray(Im_out);





end

