clear all
close all
thetamax=pi/8;
while(1)
    n=input('Enter the nuber of pixel(slit width in micro meter): ');
    a=13.7*n*1e-6;%缝宽
    L=632.8*1e-9; %wavelength (in nm)
    s=0.3;%衍射屏和狭缝间的距离（m)
    theta=-thetamax:1e-3:thetamax;
    y=s*tan(theta);
    alpha=pi*a*sin(theta)./L;
    x=(sin(alpha)./alpha).^2;
    plot(y,x);
    title(['Single slit ',num2str(n) , ' pixel diffraction ']);
    xlabel('Distance in m');
    ylabel('Intensity');
    hold all;
    ch= input('Press 1 to continue and 0 to exit: ');

if ch ==  0
    break;
end
end