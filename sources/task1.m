function A_k = task1(image, k)
  %TODO
  matrix = double(imread(image));
  [U,S,V] = svd(matrix);
  
  sing_val = diag(S);
  
  U_aux = U(:,1:k);
  S_aux = S(1:k,1:k);
  V_aux = V(:,1:k);
  
  A_k = U_aux*S_aux*V_aux';
  
end