function [A, b] = generate_probabilities_system(rows)
  nr_noduri = ((rows + 1) * rows) / 2;
  %initializam matricea
  A = zeros (nr_noduri, nr_noduri);
  b = zeros (nr_noduri, 1);
  t = 2;
  %hardcodam partea de sus a triunghiului
  A(1,1) = 4;
  A(1,2) = -1;
  A(1,3) = -1;
  %luam fiecare nod fie ca este situat in exterior sau la interior
  %si ii construim indicii ecuatiei
  for i = 2:(rows -1)
    for j = 1:i
       if j == 1
         A(t,t+i) = -1;
         A(t,t+i+1) = -1;
         A(t,t-i+1) = -1;
         A(t,t+1) = -1;
         A(t,t) = 5;
         t++;
       elseif j == i
         A(t,t+i) = -1;
         A(t,t+i+1) = -1;
         A(t,t-i) = -1;
         A(t,t-1) = -1;
         A(t,t) = 5;
         t++;
       else
         A(t,t+i) = -1;
         A(t,t+i+1) = -1;
         A(t,t-i+1) = -1;
         A(t,t+1) = -1;
         A(t,t-i) = -1;
         A(t,t-1) = -1;
         A(t,t) = 6;
         t++;
       endif
    endfor
  endfor
  %aici vedem baza triunghiului unde trebuie sa ajunga soricelul ca sa primeasca mancare
  %si construim ecuatia in functie de aceasta valoare de adevar
  a = nr_noduri - rows + 1;
  for i = a:nr_noduri
    if i == a
      A(t,t-rows+1) = -1;
      A(t,t+1) = -1;
      A(t,t) = 4;
      b(t,1) = 1;
      t++;
    elseif i == nr_noduri
      A(t, t -rows) = -1;
      A(t, t-1) = -1;
      A(t,t) = 4;
      b(t,1) = 1;
    else
      A(t,t-rows) = -1;
      A(t,t-rows+1) = -1;
      A(t,t-1) = -1;
      A(t,t+1) = -1;
      A(t,t) = 5;
      b(t,1)= 1;
      t++;
    endif
  endfor
endfunction