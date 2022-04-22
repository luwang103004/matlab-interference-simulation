% Close-up of first-order diffraction pattern of grating illuminated by
% monochromatic light.  Shows the "defraction limit' caused by the finite
% number of grooves, N.  The larger N, the narrower this pattern. 
% Tom O'Haver, March 2006
clear
% N = Number of grooves in grating (Try larger values of N if your computer is fast enough) 
N=5;
format compact
clf
hold off
start=cputime;
x=[0:.1:pi];  
z=zeros(size(x));
StartPLD=6.2;
EndPLD=6.35;
Increment=.002;
intensity=zeros(1,2000);
OPL=zeros(1,2000);
k=1;
figure(2);clf;
for pld=StartPLD:Increment:EndPLD,  % path length difference in radians
  z=zeros(size(x));
  a=0;
  for j=1:N, 
     y=sin(3.*x+a);
     z=z+y;   % z is waveform (sine) resulting from superimposition
     a=a+pld;
  end
  intensity(k)=sum(z.*z);  % calculates mean amplitude
  OPL(k)=pld./(2*pi);
  plot(OPL(1:k-1),intensity(1:k-1))
  ylabel('Observed irradiance  (Mean-square of sum of all reflections)')
  xlabel('Pathlength difference between adjacent grooves, in wavelengths')
  title(['First-order diffraction pattern for grating with '  num2str(N)  ' grooves.'])
  %drawnow
  k=k+1;
end
hold off
figure(2)
ElapsedTime=cputime-start