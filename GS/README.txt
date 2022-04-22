%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% THIS IS MATLAB CODE FOR SIMULATING DIFFRACTION PATTERNS
% AND RECONSTRUCTING IT WITH GERCHBERG-SAXTON ITERATIVE PHASE RETRIEVAL ALGORITHM
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% These codes are written by Tatiana Latychevskaia, 2013
% tatiana(at)physik.uzh.ch
% The version of Matlab for this code is R2010b
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
programs for centred Fourier transforms

FT2Dc.m
IFT2Dc.m

should be placed into the folder where you store your local MATLAB files, in my case it is:
C:/Program Files/MATLAB/R2010b/myfiles
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
The code is based on the Gerchberg-Saxton iterative phase retrieval 
algorithm as described by R. W. Gerchberg and W. O. Saxton in 
"A practical algorithm for the determination of phase from image and 
diffraction plane pictures" Optik 35(2), pages 237 - 246 (1972) 

Gerchberg-Saxton algorithm recovers phase of the wavefront from two intensity measurements 
in the sample plane and in the detector plane. 

The sample here is a complex-valued distribution; the amplitude is a binary cat cartoon 
with maximum of 1, and the phase is the word "cat" with maximum of 1 radian. 

The programs should be run as follows:
"a_simulate_DP.m" simulates the diffraction pattern
"b_GS.m" iteratively reconstructs the complex-valued wavefront together with the phase of the sample 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
As thank you note, please cite this algorithm or any of its parts as
Tatiana Latychevskaia
"Iterative phase retrieval in coherent diffractive imaging: practical issues",
Applied Optics 57(25), 7187 - 7197 (2018)
