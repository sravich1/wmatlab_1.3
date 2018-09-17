function r=rms(x)
  L=length(x);
  a=sum(x.^2);
  r=sqrt(a/L);