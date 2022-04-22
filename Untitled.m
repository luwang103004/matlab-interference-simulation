clear all
close all
XNmax=[];
thetamax=pi/50;
a=137*1e-6;%slit width
d=137*1e-6;
L=632.8*1e-9;%wavelength
s=0.3;
theta=-thetamax:1e-6:thetamax;
y=s*tan(theta);
alpha = pi*a*sin(theta)./L;
beta = pi*d*sin(theta)./L;
for N=1:10
   x=((sin(alpha)./alpha).^2).*((sin(N*beta)./(sin(beta))).^2);
   subplot(y,x);
   title('multiple-slit diffraction n=',num2str(N));
   xmax=max(x);
   XNmax(N)=xmax;
end
plot((1:10),XNmax);
title(' Maximum intensity distribution');








    
   