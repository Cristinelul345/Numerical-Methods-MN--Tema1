function [G_J, c_J] = Jacobi_factorization(A, b)
  N = diag(diag(A));
  P = N-A;
  W = inv(N);
  G_J = W * P;
  c_J = W * b;
endfunction
