%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% SIMULATION OF DIFFRCATION PATTERN
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Citation for this code/algorithm or any of its parts:
% Tatiana Latychevskaia
% "Iterative phase retrieval in coherent diffractive imaging: practical issues",
% Applied Optics 57(25), 7187 - 7197 (2018)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% The code is written by Tatiana Latychevskaia, 2013
% The version of Matlab for this code is R2010b
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
close all
clear all
% addpath('C:/Program Files/MATLAB/R2010b/myfiles');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Parameters
N = 256;                % number of pixels
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Reading sample distribution
    fid_amplitude = fopen('a_sample_amplitude.bin', 'r');
    amplitude = fread(fid_amplitude, [N, N], 'real*4');
    fclose(fid_amplitude);
    fid_phase = fopen('a_sample_phase.bin', 'r');
    phase = fread(fid_phase, [N, N], 'real*4');   
    fclose(fid_phase);
   
    sample = amplitude.*exp(i*phase); 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%    
dp = abs(FT2Dc(sample)).^2;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Saving simulated diffraction pattern as bin-file
        fid = fopen(['a_dp.bin'], 'w');
        fwrite(fid, dp, 'real*4');
        fclose(fid);         
% Saving simulated diffraction pattern as jpg-file
        p = log(dp+10);
        p = (p - min(min(p)))/(max(max(p)) - min(min(p)));
        filename1 = char(strcat('a_dp.jpg'));
        imwrite(p, filename1);