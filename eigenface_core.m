function [m A eigenfaces pr_img] = eigenface_core(database_path)
  % citesc fiecare imagine 
  T = [];
  filenames = dir(fullfile(database_path, "*.jpg"));
  col = 1;
  for i = 1 : numel(filenames)
    % construiesc drumul spre imagine
    image = strcat(database_path, "/", num2str(i), ".jpg");
    Aimg = double(rgb2gray(imread(image)));
    % transform imaginea intr-un vector coloana si il pun in matricea T
    T(:, col) = Aimg(:);
    col = col + 1;
  endfor
 
  % calculez media pe fiecare linie din matricea T si salvez rezultatele in m
  m = [];
  [lin, col] = size(T);
  for i = 1 : lin
    average = 0;
    for j = 1 : col
      average = average + T(i, j);
    endfor
    average = average / col;
    m(i) = average;
  endfor
  
  % calculul matricei A
  A = T - m';
  
  % calculul vectorilor proprii corespunzatori valorilor proprii mai mari decat
  % 1 ale matricei A' * A
  [Q, lambda] = eig(A' * A);
  V = [];
  Vsize = 0;
  for i = 1 : size(lambda, 1)
    if lambda(i, i) > 1
      Vsize = Vsize + 1;
      V(:, Vsize) = Q(:, i);
    endif
  endfor
  
  % calculul spatiului fetelor eigenfaces
  eigenfaces = A * V;
  
  % calculul proiectiei fiecarei imagini din M in multimea spatiului fetelor
  pr_img = eigenfaces' * A;
end