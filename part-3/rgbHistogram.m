function [sol] = rgbHistogram(path_to_image, count_bins)

  imagine  = imread(path_to_image);

  i = 1;
  v(i) = 0;
  z = double(256)/count_bins;
  cu = 0;
  while i != count_bins + 1
    i++;
    cu = z + cu;
    v(i) = cu;
  endwhile
 %la count_bins = 20 imi pica si nu stiu de ce
  r = imagine(:, :, 1);
  g = imagine(:, :, 2);
  b = imagine(:, :, 3);
  r = r(:);
  g = g(:);
  b = b(:);
  rV = histc(r, v);
  gV = histc(g, v);
  bV = histc(b, v);
  sol = [rV gV bV];
 
  sol(count_bins + 1) = [];
  sol(count_bins * 2 + 1) = [];
  sol(count_bins * 3 + 1) = [];
end