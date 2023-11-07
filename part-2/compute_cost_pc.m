function [cost] = compute_cost_pc(points, centroids)
  
    a = size(points);
    nr_linii = a(1);
  
   sizes_centroids = size(centroids);
   centr_linii = sizes_centroids(1);
   centr_coloane = sizes_centroids(2);
   sum = 0;
   cost = 0;
   min = 100000000;
    for i = 1:nr_linii
      for z = 1:centr_linii
        for j = 1:centr_coloane
         sum = (centroids(z,j) - points(i,j)) * (centroids(z,j) - points(i,j)) + sum;         
        endfor
        sum = sqrt(sum);
         if sum < min
           min = sum;
         endif
        sum = 0;
      endfor
      cost += min;
      min = 100000000;
    endfor
  
endfunction

