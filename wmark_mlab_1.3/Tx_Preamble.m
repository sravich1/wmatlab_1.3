%[sR,sL]=Tx_Preamb(sR,sL,premb,T,Amp);
function [sR,sL]=Tx_Preamble(sR,sL,premb,T,Amp,fs)
  L=length(premb);
  for k=1:length(T)
    m=round(fs*T(k));
    v=[m-L:m-1];
    s1=sR(v);
    p1=rms(s1);
    s1=s1/rms(s1);
    s1=s1+Amp*premb;
    s1=s1/rms(s1)*p1;
    
    sR(v)=s1;
    %-----------------Left channel----------
    s1=sL(v);
    p1=rms(s1);
    s1=s1/rms(s1);
    s1=s1+Amp*premb;
    s1=s1/rms(s1)*p1;
    sL(v)=s1;
  end 
  