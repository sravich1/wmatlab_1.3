function [bx,Decoder,y]=Ham_Encode
  A=[1:31];B=[1 2 4 8 16];
  x=setdiff(A,B);
  y=[x 16 8 4 2 1];
  bx=[];
  for k=1:length(x)
   bx=[bx;con2dec(x(k),5)];
  end 
 Decoder=[bx;eye(5)]; 