function [m A eigenfaces pr_img] = eigenface_core(database_path)
  %TODO
   T = [];
   v = [];
  for l = 1 : 10 
    filename = strcat(database_path,"/",sprintf("%d",l),".jpg");
    matrix = double(rgb2gray(imread(filename)));
    [p o] = size(matrix);
    
  X = reshape(matrix,o*p,1); 
  T = [T X];
  #m(i) = mean(T(:,i));
endfor

opa = rows(T);
for i = 1 : opa
  m(i) = mean(T(i,:));
endfor
  #m = mean(T,2);
  for i = 1 : opa
    A(i,:) = T(i,:) - m(i);
    endfor
 # A = T - m;
  L = (A') * A;
  [V,sing_val] = eig(L);
  #disp(V);
  #disp(sing_val);
  k = 1;  
 for i = 1 : rows(sing_val)
   if sing_val(i,i) >= 1
     v(:,k) = V(:,i);
     k++;
    endif
   endfor
  #disp(v);

  eigenfaces = A * v;
  pr_img = (eigenfaces') * A;
  
endfunction