function [sol] = hsvHistogram(path_to_image, count_bins)

  imagine  = imread(path_to_image);

  [m n p] = size(imagine);
  i = 1;
  limit(i) = 0;
  z = 1.01/count_bins;
  cu = 0;
  while i != count_bins + 1
    i++;
    cu = z + cu;
    limit(i) = cu;
  endwhile


  for i =1:m
    for j = 1:n
     Rtr = double(imagine(i, j, 1)) / 255;
     Gtr = double(imagine(i, j, 2)) / 255;
     Btr = double(imagine(i, j, 3)) / 255;
     temp = max(Rtr, Gtr);
     Cmax = max(temp, Btr);
     temp = min(Rtr, Gtr);
     Cmin = min(temp, Btr);
     delta = Cmax - Cmin;
     if delta == 0
       H(i, j) = 0;
     else
       if Cmax == Rtr
         H(i, j) =  60 * mod(((Gtr - Btr) / delta), 6);
       endif
       if Cmax == Gtr
         H(i, j) = 60 * ((Btr - Rtr) / delta + 2);
       endif
       if Cmax == Btr
         H(i, j) = 60 * ((Rtr - Gtr) / delta + 4);
       endif
     endif
     H(i, j) = H(i, j) / 360;

     if Cmax == 0
       S(i, j) = 0;
     else
       S(i, j) = delta / Cmax;
     endif
     V(i, j) = Cmax;
    endfor
  endfor
  H = H(:);
  S = S(:);
  V = V(:);
  hV = histc(H, limit);
  sV = histc(S, limit);
  vV = histc(V, limit);
  sol = [hV sV vV];
 
  sol(count_bins + 1) = [];
  sol(count_bins * 2 + 1) = [];
  sol(count_bins * 3 + 1) = [];
end