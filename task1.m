function A_k = task1(image, k)
  % transform imaginea intr-o matrice
  A = double(imread(image));
  [m, n] = size(A);
  % realizez descompunerea valorilor singulare pentru matricea A 
  [U, S, V] = svd (A);
  % realizez descompunerea redusa a valorilor singulare pentru matricea A
  Uk = U(1 : m, 1 : k);
  Sk = S(1 : k, 1 : k);
  V = V';
  Vkt = V(1 : k, 1 : n);
  % matricea A_k va aproxima matricea initiala A
  A_k = Uk * Sk * Vkt;
end
