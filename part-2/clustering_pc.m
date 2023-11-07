function [centroids] = clustering_pc(points, NC)
 a = size(points);
 nr_coloane = a(2);
 nr_linii = a(1);
 nr_clusters = NC;
 count = 0;
 i = 1;
 
  % cluster initial
    while nr_clusters
      while (i + NC * count <= nr_linii)
      clust(i,count+1) = i + NC * count;
      count = count + 1;
    endwhile
    i = i + 1;
    count = 0;
    nr_clusters = nr_clusters - 1;
  endwhile
  
  
    sizes = size(clust);
    clust_lin = sizes(1);
    clust_col = sizes(2);
    
    % centroizi initiali
    dist = 0;
    count = 0;
      for i = 1:clust_lin
        for r = 1:nr_coloane
          for j = 1:clust_col
            if clust(i,j) != 0 
              dist = points(clust(i,j), r) + dist;
             count = count + 1; 
            endif
          endfor
          centroids(i,r) = dist/count;
          count = 0;
          dist = 0;
        endfor
      endfor
   
   sizes_centroids = size(centroids);
   centr_linii = sizes_centroids(1);
   centr_coloane = sizes_centroids(2);
   sum = 0;
    for i = 1:nr_linii
      for z = 1:centr_linii
        for j = 1:centr_coloane
         sum = (centroids(z,j) - points(i,j)) * (centroids(z,j) - points(i,j)) + sum;         
        endfor
          distVector(i, z) = sum;
        sum = 0;
      endfor
    endfor
    
    length_cluster = 0;
    min = 10000000;
    temp = 0;
    for i = 1:nr_linii
      for j = 1:NC
        if distVector(i,j)< min
          min = distVector(i,j); 
          temp(i) = j;   
        endif
      endfor
      min = 10000000;
    endfor 
    
    length_cluster(NC) = 0;
    for i = 1:nr_linii
      for j = 1:NC
        if j == temp(i)
         length_cluster(j)++;
        endif
      endfor
    endfor

       max = -1;
       for i = 1:NC
         if max < length_cluster(i)
           max = length_cluster(i);
         endif
       endfor
       
       counter = ones(NC);
       
       clust = zeros(NC, max);
         
        for i = 1:nr_linii
          for j = 1:NC 
            if temp(i) == j
              clust(j,counter(j)) = i;
              counter(j) = counter(j) + 1;
            endif
          endfor
        endfor

        r = size(clust);
    clust_lin = r(1);
    clust_col = r(2);
    
    dist = 0;
    count = 0;
      for i = 1:clust_lin
        for r = 1:nr_coloane
          for j = 1:clust_col
            if clust(i,j) != 0 
              dist = points(clust(i,j), r) + dist;
             count = count + 1; 
            endif
          endfor
          centroids_new(i,r) = dist/count;
          count = 0;
          dist = 0;
        endfor
      endfor
   
  ok = 0;    
  while (ok == 0)
    if centroids == centroids_new
      ok = 1;
      break;
    else
      centroids = centroids_new;
    endif       
   sizes_centroids = size(centroids);
   centr_linii = sizes_centroids(1);
   centr_coloane = sizes_centroids(2);
   sum = 0;
    for i = 1:nr_linii
      for z = 1:centr_linii
        for j = 1:centr_coloane
         sum = (centroids(z,j) - points(i,j)) * (centroids(z,j) - points(i,j)) + sum;         
        endfor
          distVector(i, z) = sum;
        sum = 0;
      endfor
    endfor
    
    length_cluster = 0;
    min = 10000000;
    temp = 0;
    for i = 1:nr_linii
      for j = 1:NC
        if distVector(i,j)< min
          min = distVector(i,j); 
          temp(i) = j;   
        endif
      endfor
      min = 10000000;
    endfor 
    
    length_cluster(NC) = 0;
    for i = 1:nr_linii
      for j = 1:NC
        if j == temp(i)
         length_cluster(j)++;
        endif
      endfor
    endfor

       max = -1;
       for i = 1:NC
         if max < length_cluster(i)
           max = length_cluster(i);
         endif
       endfor
       
       counter = ones(NC);
       
       clust = zeros(NC, max);
         
        for i = 1:nr_linii
          for j = 1:NC 
            if temp(i) == j
              clust(j,counter(j)) = i;
              counter(j) = counter(j) + 1;
            endif
          endfor
        endfor

        r = size(clust);
    clust_lin = r(1);
    clust_col = r(2);
    
    dist = 0;
    count = 0;
      for i = 1:clust_lin
        for r = 1:nr_coloane
          for j = 1:clust_col
            if clust(i,j) != 0 
              dist = points(clust(i,j), r) + dist;
             count = count + 1; 
            endif
          endfor
          centroids_new(i,r) = dist/count;
          count = 0;
          dist = 0;
        endfor
      endfor
     
      endwhile
  
  endfunction