% Generate LFM Signal
% clear;fs=16e3;f1=6e3;f2=8e3;T=0.01;LFM_analog
% Inputs-
%       fs=Sampling frequency in Hz
%       f1=Start Frequency of LFM
%       f2=End Frequency of LFM
%       T= Duration of LFM
%Output-
%       sig=Output LFM signal
function sig=LFM_analog(fs,f1,f2,T)
Alfa=(f2-f1)/T; % Slope of Chirp signal
M=round(fs*T);  % Duration in samples
v=[0:M-1];
phase1=f1/fs*v;
phase2=Alfa/2/fs/fs*(v.*v);
PH=phase1+phase2;
sig=cos(2*pi*PH);