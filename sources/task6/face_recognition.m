function [min_dist output_img_index] = face_recognition(image_path, m, A, eigenfaces, pr_img)
  %TODO
    T = [];
    output_img_index = 1;
    filename = strcat(image_path);
    matrix = double(rgb2gray(imread(filename)));
    [p o] = size(matrix);
    X = reshape(matrix,o*p,1);
    T = [T X];

opa = rows(T);
 for i = 1 : opa
    B(i,:) = T(i,:) - m(i);
 endfor
  
  PrTestImg = (eigenfaces') * B;
  min_dist = 10^20;
  
  #disp(pr_img);
  #disp(PrTestImg);
  [l c] = size(pr_img);
  for i = 1 : c
  min = sqrt(sum((pr_img(:,i) - PrTestImg).^2));
  if min < min_dist
    min_dist = min;
    output_img_index = i;
  endif
endfor

#disp(min_dist);
#disp(output_img_index);

#imshow(uint8(pr_img));
end