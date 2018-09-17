%ss=modifySpectrum(ss,16,32,amp);
function ss=modifyspectrum(ss,m,n,amp)
  S=fft(ss);
  L=length(S);
  S(m:n)=amp*S(m:n);
  S(L-m+2:-1:L-n+2)=amp*S(L-m+2:-1:L-n+2);
  ss=ifft(S);