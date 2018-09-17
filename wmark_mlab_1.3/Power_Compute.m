% Find the power content of sub block
 function [s,pwr,pwr1]=Power_Compute(s,Mn,Amps)
 %ns=cos(2*pi*2000/44100*[0:Mn-1]);ns/rms(ns);  
 s1=reshape(s,Mn,64);
 s2=s1(:,1:2:end);
 pwr=sqrt(sum(s2.^2)/Mn);
 Mxp=max(pwr);
 v=[1:Mn];
 for k=1:length(pwr)
   if pwr(k)<Amps*Mxp
      sg=s(v);
      sg=sg/rms(sg);
      s(v)=sg*Amps*(Mxp);
   end
   v=v+2*Mn;
end   
  s1=reshape(s,Mn,64);
  s2=s1(:,1:2:end);
   pwr1=sqrt(sum(s2.^2)/Mn);