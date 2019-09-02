f = imread('images/cuttedtomatoesRGB.jpg');

r=f(:,:,1);
subplot(3,2,1);imhist(r);
title('R Histogram')
r1=histeq(r);
subplot(3,2,2),imhist(r1);
title('Equalized R Histogram')

g=f(:,:,2);
subplot(3,2,3);imhist(g);
title('G Histogram')
g1=histeq(g);
subplot(3,2,4),imhist(g1);
title('Equalized G Histogram')

b=f(:,:,3);
subplot(3,2,5);imhist(b);
title('B Histogram')
b1=histeq(b);
subplot(3,2,6),imhist(b1);
title('Equalized B Histogram')

%f0=cat(3,r1,g1,b1);
f0=cat(3,r,g1,b1);
figure;
subplot(1,2,1),
imshow(f);title('Original')
subplot(1,2,2),
imshow(f0);title('Histogram Equalized')