%------Read Image---------
f1 = imread('images/graytomatoes.jpg');
I2 = imread('images/watermarktomatoes.jpg');
f = rgb2gray(I2);
%------- frequency transformation-----
figure;
subplot(2,2,1);
imshow(f1);title('Original');

subplot(2,2,2);
F1 = fft2(f1);
Fc1 = fftshift(F1);
imshow(log(1 + abs(Fc1)),[]);title('Original FFT');

subplot(2,2,3);
imshow(f);title('Watermarked');

subplot(2,2,4);
F2 = fft2(f);
Fc2 = fftshift(F2);
imshow(log(1 + abs(Fc2)),[]);title('Watermarked FFT');


% 
% [m,n]=size(Fc1);%????
% 
% n1=floor(m/2);
% 
% n2=floor(n/2);
% 
% d0=30;%????
% %----------Low Pass------
% Fc=Fc1;
% for i=1:m
%  for j=1:n
%    if ((i-n1)^2+(j-n2)^2>=d0^2)
%    Fc(i,j)=0;
%    end
%  end
% end
% re1=real(Fc);%?????????
% logfftimg1=log(re1);
% figure(3)
% imshow(logfftimg1,[8,10])
% title('???????')
% Fc=ifftshift(Fc);
% ifftimg1=uint8(real(ifft2(Fc)));
% figure(4)
% imshow(ifftimg1);
% title('???????')

% 
% PQ=paddedsize(size(f));
% % ???????(????) ??
% [U,V]=dftuv(PQ(1),PQ(2));
% D0=0.05*PQ(2);
% H=exp(-1*(U.^2+V.^2)/(2*D0.^2));
% H1=fftshift(H);
% % ??????
% g=dftfilt(f,H1);
% % f11=fft2(f);
% 
% figure;
% subplot(2,2,1);
% imshow(f);
% subplot(2,2,2);
% imshow(H1);
% subplot(2,2,3);
% imshow(g);
% % subplot(2,2,4);
% % imshow(f11);

PQ = paddedsize(size(f));
[U,V] =  dftuv(PQ(1),PQ(2));
D0 = 0.05 * PQ(2);
F = fft2(f,PQ(1),PQ(2));
H = exp(-(U.^2+V.^2)/(2 * D0^2));
g = dftfilt(f,H);
figure
subplot(2,3,2);imshow(log(1+abs(fftshift(F))),[]);
subplot(2,3,3);imshow(log(1+abs(fftshift(H))),[]);
subplot(2,3,5);imshow(log(1+abs(fftshift(F.*H))),[]);
subplot(2,3,4);imshow(g,[]);
