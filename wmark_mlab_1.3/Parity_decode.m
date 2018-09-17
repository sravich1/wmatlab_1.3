% This decodes Parity Matrix
function [Dx,Mastersum]=Parity_decode(R)
Rr=R(1:25);

Rn=reshape(Rr,5,5);
%---------Test Syndrome------------------
A=rem(sum(Rn(1:4,:),2),2);
B=rem(sum(Rn(:,1:4)),2);
Left=rem(sum(diag(Rn)),2);
Right=rem(sum([diag(fliplr(Rn(1:4,1:4)));R(26)]),2);
Mastersum=sum([A;B';Left;Right]);
%-----------------Extract data----------------
save PARITY A B Left Right Rn
Dx=Rn(1:4,1:4);
Dx=Dx(:);Dx=Dx';
%binArray2Hex(Dx,16);
