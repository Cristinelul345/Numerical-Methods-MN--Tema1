function [values, colind, rowptr] = matrix_to_csr(A)
  % pentru values luam elementle nenule din matrice
  % pentru colind luam pozitiile acestor din cadrul randurilor in care se incadreaza
  % pentru rowptr identificam valoarea acestor in functie de colind si values
  n = size(A,1);
  nz = 0;
  contor = 1;
  cop = 0;
  count2 = 1;
  el = 1;
  for i = 1:n
    for j = 1:n
      if A(i,j) != 0
        nz = nz + 1;
      endif
    endfor
  endfor

    for i = 1:n
    for j = 1:n
      if A(i,j) != 0
        values(contor) = A(i,j);
        colind(contor) = j;
        if cop == 0
          rowptr(count2) = el;
          count2 = count2 + 1;
          cop = 1;
        endif
        contor = contor + 1;
        el = el + 1;
      endif
    endfor
    cop = 0;
  endfor
  rowptr(n+1) = nz + 1;
endfunction