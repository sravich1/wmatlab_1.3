%--Converts binary (+1 -1) array of 16 bits to Hex number
function H=binArray2Hex(b,Nbit)
%Input:-
%      b= Binary array of 1 and -1, of length 4
% Output:-
%      H= Hex number
v=find(b==-1);
b(v)=0;
g=2.^([0:Nbit-1]);
%b=b';
b=fliplr(b);
d=b*g';
H=dec2hex(d);
