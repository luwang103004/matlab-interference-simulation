%% 
clear all; close all;
tic;
lamda=0.6328*1e-3;
pix=0.1;%mm
N=round(100/pix);
delta=100/N;%mm
radius=50; %mm
radius_t=1;
lights=zeros(N,N);
target=zeros(N,N);
%% 出射高斯光束
 
	x = -N/2:N/2-1;
	y = -N/2:N/2-1;
	[X,Y] = meshgrid(x,y);
    dis=((X.^2+Y.^2).^0.5)*delta;
    for a=1:N
        for b=1:N
            if dis(a,b)< radius
                lights(a,b)=exp(-dis(a,b).^2/3600);
            end
        end
    end
    figure(1);imagesc(lights);
    
%---------------------------------------------------------
%% 设置目标光场
   T= 1/pix;
   for a=1:N
       for b=1:N
           if abs(a-N/2)< T/2
               if abs(b-N/2)< T/2
                   target(a,b)=50;
               end
           end
       end
   end
   
   
%% irretation
	
	A = fftshift(ifft2(fftshift(target)));
	iteration_num = 200;
	%hologram = |objectWave + referenceWave|.^2
    

for i=1:iteration_num
  B = abs(lights) .* exp(1i*angle(A));
  C = fftshift(fft2(fftshift(B)));
  D = abs(target) .* exp(1i*angle(C));
  A = fftshift(ifft2(fftshift(D)));
end

	figure
	imshow(target)
	title('target image');
	figure
    imagesc(abs(C))  
    title('reconstructed image');
    figure
    imagesc(angle(A))              
	title('相位');

	
	toc;