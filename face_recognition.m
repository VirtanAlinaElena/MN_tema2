function [min_dist output_img_index] = face_recognition(image_path, m, A, eigenfaces, pr_img)
  % transform imaginea de test intr-un vector coloana
  Aimg = double(rgb2gray(imread(image_path)));
  [l, c] = size(Aimg);
  v = Aimg(:);
  % extrag media din imaginea de test
  v = v - m';
  % calculez proiectia imaginii de test in spatiul fetelor
  pr_test_img = eigenfaces' * v;
  % determinarea celei mai mici distante intre proiectii
  min_dist = 99999999999999;
  for i = 1 : size(pr_img, 2)
    if norm(pr_test_img - pr_img(:, i)) < min_dist
      min_dist = norm(pr_test_img - pr_img(:, i));
      output_img_index = i;
    endif
  endfor
end