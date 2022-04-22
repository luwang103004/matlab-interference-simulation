I=imread('USTC.png');

I=rgb2gray(I);

I=im2double(I);

F=fft2(I);

F=fftshift(F);

F=abs(F);

T=log(F+1);

figure;

imshow(T,[]);