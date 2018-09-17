%============= wav Modulation===================
function s=Wav_Mod(s,bits,Mn,Amp)
  %s=1*s;
  Ps=rms(s);
  v1=[1:Mn];
  v2=[Mn+1:2*Mn];
  for k=1:length(bits)
    bt=bits(k);
  % if rms(s(v1))<0.5*Ps
   %   s(v1)=(s(v1)/rms(s(v1)))*Ps*Amp;
   % end  
      
    s(v2)=bt*s(v1);
    v1=v1+2*Mn;
    v2=v2+2*Mn;
  end  