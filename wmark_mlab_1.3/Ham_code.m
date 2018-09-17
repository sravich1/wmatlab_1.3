%Hamming linear code (26,31)
%clear;M=7;Ham_code
A=[1:31];B=[1 2 4 8 16];
x=setdiff(A,B);
y=[x 16 8 4 2 1];
bx=[];
for k=1:length(x)
  bx=[bx;con2dec(x(k),5)];
end  
%=================================
d=round(rand(1,26));
Parity=rem(d*bx,2);
BITS=[d Parity];
BITSTx=BITS;
Decoder=[bx;eye(5)];
%---------create error---------------
for L=1:length(M)
bb=BITS(M(L));
if bb==1,
  BITS(M(L))=0;
  else
  BITS(M(L))=1;
end
%BITSEr=BITS;
end
BITSEr=BITS;
%------------------------------------
s=BITS*Decoder;
Er=rem(s,2);
idx=Er*[16 8 4 2 1]';
m=find(y==idx)
BITS(m)=rem(BITS(m)+1,2);
Er
idx
[BITSTx;BITSEr;BITS]
