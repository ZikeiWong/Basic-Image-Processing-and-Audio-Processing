%---------- image reading and displaying ------------
f  = imread('images/tomatoes.bmp');
whos f
subplot(2,3,1);
imshow(f);
title('Tomatoes RGB')
%-----Index Image--------
[IND,map] = rgb2ind(f,64);
subplot(2,3,2);
imshow(IND,map);
title('Tomatoes Index')
imwrite(IND,map,'images/indextomatoes.png');


%----Grayscale the input image-----------
I = rgb2gray(f);
subplot(2,3,3);
imshow(I);
title('Tomatoes Gray')
imwrite(I,'images/graytomatoes.jpg','quality',100);
%--------Binary image-----
g1=im2bw(I,0.2); 
subplot(2,3,4);
imshow(g1);
title('T=0.2')

g2=im2bw(I); 
subplot(2,3,5);
imshow(g2);
title('T=0.5')

g3=im2bw(I,0.7);
subplot(2,3,6);
imshow(g3);
title('T=0.7')