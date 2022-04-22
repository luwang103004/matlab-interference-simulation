%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% GERCHBERG-SAXTON ITERATIVE PHASE RETRIEVAL ALGORITHM
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% The code is based on the Gerchberg-Saxton itertaive phase retrieval 
% algorithm as described by R. W. Gerchberg and W. O. Saxton in 
% "A practical algorithm for the determination of phase from image and 
% diffraction plane pictures" Optik 35(2), pages 237 - 246 (1972) 
% As thank you note, please cite this algorithm or any of its parts as
% Tatiana Latychevskaia
% "Iterative phase retrieval in coherent diffractive imaging: practical issues",
% Applied Optics 57(25), 7187 - 7197 (2018)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% The code is written by Tatiana Latychevskaia, 2013
% The version of Matlab for this code is R2010b
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
close all
clear all
% addpath('C:/Users/latychevskaia_t/MATLAB/myfiles');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
ButtonHandle = uicontrol('Style', 'PushButton', ...
                         'String', 'Stop loop', ...
                         'Callback', 'delete(gcbf)');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
Iterations = 2000; % number of iterative Iterations, typically 200 iterations are enough
N = 256;           % number of pixels
p = 0.1;           % time to pause, otherwise images are not shown
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%reading diffraction pattern

    fid = fopen('a_dp.bin', 'r');
    dp = fread (fid , [N, N], 'real*4');
    fclose(fid);   
    imagesc(rot90(log(dp + 10))), colorbar;
    colormap(gray);
    dp_amplitude = sqrt(dp);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Reading sample amplitude

    fid = fopen('a_sample_amplitude.bin', 'r');
    sample_amplitude = fread(fid, [N, N], 'real*4');
    fclose(fid);    
    
    % imshow(rot90(sample_amplitude));
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Creating initial complex-valued field distribution at the detector plane

phase = zeros(N,N);
phase = (2*rand(N,N) - 1)*pi;
field_detector = dp_amplitude.*exp(i*phase);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% GS iterative loop

for ii = 1:Iterations
  
fprintf('Iteration: %d\n', ii) 

% Getting updated sample distribution
sample_phase_updated = angle(IFT2Dc(field_detector));
sample_amplitude_updated = abs(IFT2Dc(field_detector));
sample_phase_updated = sample_phase_updated.*sample_amplitude_updated;
imshow(rot90(sample_phase_updated), []), colorbar, title('sample phase progress');
pause(p);
sample_updated = sample_amplitude.*exp(i*sample_phase_updated);

field_detector_updated = FT2Dc(sample_updated);

% Replacing updated amplitude for measured amplitude
field_detector = dp_amplitude.*exp(i*angle(field_detector_updated));

if ~ishandle(ButtonHandle)
break;
    end

end
figure
imshow(rot90(sample_phase_updated), []), colorbar, title('sample phase');

figure
imshow(rot90(sample_amplitude_updated), []), colorbar, title('sample amplitude');