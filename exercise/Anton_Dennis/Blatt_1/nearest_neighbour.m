function [ output_point ] = nearest_neighbour(p, Im_in)
%% Von diskret nach kontinuierlich mittels nearest neighbour.
% d2
output_point = Im_in( max([ 1 , round(p(1)) ]) , max( [1, round(p(2)) ] ) ); 

end

