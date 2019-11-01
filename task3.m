function [A_k S] = task3(image, k)
  A = double(imread(image));
  [m, n] = size(A);
  % calculez media pentru fiecare linie
  for i = 1 : m
    suml = 0;
    for j = 1 : n
      suml = suml + A(i, j);
    endfor
    suml = suml / n;
    u(i) = suml;
  endfor
  
  % actualizez valoarea elementelor scazand din fiecare media de pe linie 
  for i = 1 : m
    for j = 1 : n
      A(i, j) = A(i, j) - u(i);  
    endfor
  endfor
  
  % construiesc matricea Z
  Z = A' / sqrt(n-1); 
  
  % calculez DVS pentru matricea Z
  [U, S, V] = svd (Z); 
  
  % calculez spatiul k-dimensional al elementelor principale notat W
  W = V(:, 1 : k); 
  
  % calculez proiectia lui A in spatiul componentelor principale
  Y = W' * A; 
  
  % aproximatia matricei initiale Ak
  A_k = W * Y + u';
endfunction