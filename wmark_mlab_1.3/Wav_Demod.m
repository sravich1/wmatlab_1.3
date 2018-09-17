% Demodulate Bits
function BIT=Wav_Demod(s,Mn,as,BitL)
  %sf=filter(as,1,s);
  %sf=s;
  %v1=[4:Mn-3];
  v1=[1:Mn];
  %v2=[Mn+1:2*Mn];
  v2=v1+Mn;
  BIT=zeros(1,BitL);
  for k=1:BitL
    R=sum(s(v1).*s(v2));
    BIT(k)=sign(R);
    v1=v1+2*Mn;
    v2=v2+2*Mn;
  end  
