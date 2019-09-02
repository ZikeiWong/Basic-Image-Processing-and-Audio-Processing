%----------Unshifted frequency transformation-----
f=imread('images/graytomatoes.jpg');
figure;
subplot(1,3,1);
imshow(f),title('Original');
F=fft2(f);
subplot(1,3,2);
imshow(abs(F),[]),title('fft2');
S=log(1+abs(F));
subplot(1,3,3);
imshow(S,[]),title('log(1+abs(F))');

%-------Shifted frequency transformation-----

f = imread('images/graytomatoes.jpg');
figure;
subplot(2,2,1);
imshow(f);title('Original');

F = fft2(f);
subplot(2,2,2);
imshow(abs(F),[]);title('fft2');

Fc = fftshift(F);
subplot(2,2,3);
imshow(abs(Fc),[]);title('fftshift');

subplot(2,2,4);
imshow(log(1 + abs(Fc)),[]);title('log(1+abs(Fc))');

