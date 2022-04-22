clc
clear all
lambda=632e-9; 
pixel=13.7e-6;
k=(2*pi)/lambda;
a=300*pixel; 
b=300*pixel; 
d=20e-3;
Io = 100.0;
R = 1;
Y = (-4e-3:1e-5:4e-3); 
Z= Y; 
beta = k*b*Y/(2*R*pi);
alpha = k*a*Z/(2*R*pi); 
for i=1:length(Y)
    for j=1:length(Z)
        I(i,j)=Io.*((sinc(alpha(j)).^2).*(sinc(beta(i))).^2);
   
    end
 end
    
 figure(1)
 imshow(I)
 title('Fraunhofer Diffraction','fontsize',14)
 fh = figure(1);
 set(fh, 'color', 'white');
 