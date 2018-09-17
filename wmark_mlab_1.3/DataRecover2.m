% This function recovers the data after error corection & identifying user.
function [bits,Mastersum]=DataRecover2(BIT,Id)
   load Decoder
   Parity32=rem(sum(BIT),2);
   BIT=BIT(2:end);
   s=BIT*Hdx;
   Er=rem(s,2);
   idx=Er*[16 8 4 2 1]';
   if Parity32==1
   m=find(yArray==idx);
   BIT(m)=rem(BIT(m)+1,2);
   end  
   %-------------Collect firsyt 26 bits
   BIT=BIT(1:26);
   BIT=xor(BIT,Id);
   %----------------------------------------
   [bits,Mastersum]=Parity_decode(BIT);
    
 