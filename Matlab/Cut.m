%------- Read,cut and grayscale the image ----------
f = imread('images/tomatoes.bmp');
fc = f(25:175,25:175,1:3);%Cut the image
I=rgb2gray(fc)
imwrite(fc,'images/cuttedtomatoesRGB.jpg','quality',100);
imwrite(I,'images/cuttedtomatoes.jpg','quality',100);

% %----------- scale the output image   ------------------

figure;
subplot(2,2,1);imshow(f);title('Original Image');
subplot(2,2,2);imshow(fc);title('Cutted Image');
subplot(2,2,3);imshow(I);title('Grayscaled Image');
subplot(2,2,4);imshow(I,[]);title('Scaled Image');