%% ------Read image and pre-processing----
f = im2double(imread('images\tomatoes.bmp'));
ycbcrImg = rgb2ycbcr(f);%Transfer color space
yImg = ycbcrImg(:,:,1);%Extract the first layer
%% --------Generate Watermark Matrix-----
[m,n] = size(yImg);
embedImg = zeros(m,n);
% ----setting parameters-----
angle = 135;
a=cos(angle*pi/180);
b=sin(angle*pi/180);
w=pi/2;
% ---Generate water matrix-------
for i = 1:m
    for j = 1:n
        embedImg(i,j) = sin(w*(a*i+b*j));
    end
end
%% --------Adding the watermark------
I = 1/4;
yImg = yImg + I*embedImg;
ycbcrImg(:,:,1) = yImg;%Replace the first yCbCr layer
rgbImg = ycbcr2rgb(ycbcrImg);%Transform back to RGB image
imwrite(rgbImg,'images\watermarktomatoes.jpg');

subplot(1,2,1)
imshow(f);title('Original Image');
subplot(1,2,2)
imshow(rgbImg);title('Watermarked Image');