% convert dec number to comp binary no
function B=con2dec(x,m)
  B=zeros(1,m);
  k=1;R=x;
  while R~=0
    r=rem(R,2);
    B(k)=r;
    k=k+1;
    R=fix(R/2);
  end
  B=fliplr(B);
    