function task2(image)
  %TODO
  matrix = double(imread(image)); 
  [U,S,V] = svd(matrix);
   
  %Graficul pentru figura 1 
  figure(1);
  valS_S = diag(S);
  plot(valS_S);
   
  %Graficul pentru figura 2
  figure(2);  
  %disp(valS_S(2));
  x = length(valS_S);
  for k = 1 : x
    numar = min(k,x);
    for i = 1 : numar
      kek(i) = valS_S(i);
    endfor
    g2(k) = sum(kek) / sum(valS_S);
  endfor
  plot(g2);
  
  %graficul pentru figura 3 
  figure(3);
  [m n] = size(matrix);
  x = length(valS_S);
  for k = 1 : x
    U_aux = U(:,1:k);
    S_aux = S(1:k,1:k);
    V_aux = V(:,1:k);
    A_k = U_aux*S_aux*V_aux';
    suma = 0;
    for i = 1 : m
      for j = 1 : n
        sum = (matrix(i,j) - A_k(i,j))^2;
        suma += sum;
      endfor
    endfor
    g3(k) = suma / (m*n);  
   endfor 
   plot(g3);
 
  %Graficul pentru figura 4 
  figure(4); 
  [m n] = size(matrix); 
  x = length(valS_S);
  for k = 1 : x
    
    g4(k) = ((m*k)+(n*k) + k) / (m*n);
  endfor
  plot(g4);
   
end