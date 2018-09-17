function Save_Filt_Para(a,Mn,L,sp,hh,h,hd,Id)
  a=a(1:4:end);
  L=floor(L/4);
  Mn=floor(Mn/4);
  h=h(1:4:end);
  hh=hh(1:4:end);
  sp=sp(1:4:end);
  hd=fir1(128,0.25);
  save RxInfo a  Mn L sp hh h hd Id 
