function [sR,sL,RATIO]=Tx_Block1(sR,sL,T,fs,bits,Mn,a,L,b,AmpNs)
RATIO=[]; 
v=[0:L-1];
%ns=cos(2*pi*1500/44100*v); 
%ns=randn(1,L);ns=filter(a,1,ns);ns=ns/rms(ns);
for k=1:length(T)
n1=round(fs*T(k));n2=n1+L-1;
s=sR(n1:n2);
[s,pwr,pwr1]=Power_Compute(s,Mn,AmpNs);
%==============,===========================================
so=Wav_Mod(s,bits,Mn,AmpNs);
 %================================
sR(n1:n2)=so;
%--------------- Left Channel-------------
s=sL(n1:n2);
[s,pwr,pwr1]=Power_Compute(s,Mn,AmpNs);
 %=========================================================
so=Wav_Mod(s,bits,Mn,AmpNs);
 %================================
sL(n1:n2)=so;
end
endfunction