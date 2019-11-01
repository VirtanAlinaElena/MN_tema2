function task5()
  filenames = dir(fullfile("in/images", "*.gif"));
  for index = 1 : numel(filenames)
    %construiesc calea catre imagine
    image = strcat("in/images", "/image", num2str(index), ".gif");
    A = double(imread(image));
    [m, n] = size(A);
    k = [1:19 20:20:99 100:30:min(m,n)];
    
    % grafic 1
    subplot(2, 2, 1);
    [A_k S] = task3(image, 125);
    plot(diag(S), 'b');
    
    % grafic 2
    subplot(2, 2, 2);
     y1 = [];
     for i = 1 : length(k)
       y1(i) = sum(sum(S(1:k(i), 1:k(i)))) / sum(sum(S(:, :)));
     endfor
    plot(k, y1, 'b');
    
    % grafic 3
    subplot(2, 2, 3);
    y2 = [];
    for t = 1 : length(k)
      A_k = task3(image, k(t));
      suma = 0;
      for i = 1 : m
        for j = 1 : n
          suma = suma + (A(i, j) - A_k(i, j)) * (A(i, j) - A_k(i, j));
        endfor
      endfor
      y2(t) = suma / (m * n);
    endfor  
    plot(k, y2, 'b');
    
    % grafic 4
    subplot(2, 2, 4);
    plot(k, (2 * k + 1) / n, 'b');
    
    if index != 4
      figure();
    endif
  endfor
end