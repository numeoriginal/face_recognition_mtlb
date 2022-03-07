function [A_k S] = task4(image, k)
   %TODO
    matrix = double(imread(image));
    [m n] = size(matrix);
  
  for i = 1 : m
    miu(i) = mean(matrix(i,:));
    matrix(i,:) -= miu(i);
  endfor
   
   Z = ( matrix * (matrix') )/ (n - 1);
  [V S] = eig(Z);
  W = V(:,1:k);
  Y = (W')*matrix;
  A_k = W*Y;
  
    for i = 1 : m
      for j = 1 : n
        A_k(i,j) += miu(i);
      endfor
    endfor
endfunction