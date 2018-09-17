% Test Syndrome==============
x=clock;
sd=round(x(6)*1000);
rand('seed',sd);
%rand('seed',7845);
x=round(rand(1,16));
F=binArray2Hex(x,16);
y=reshape(x,4,4);
%---------- vertical parity-------------
Par_Ver=rem(sum(y),2);
%-------------Horizontal parity----------------
Par_Hoz=rem(sum(y,2),2);
%-------------Left -Diagonal parity-----------------
Par_Lt=rem(sum(diag(y)),2);
%----------- Right Diagonal parity-----------
Par_Rt=rem(sum(diag(fliplr(y))),2);

Rt=[y;Par_Ver];
Rt=[Rt [Par_Hoz;Par_Lt]]; 
R=Rt;
%=========================================================================

%-------------------Add Right Diagonal parity in the end-----------------
Rt=R(:);
Rt=[Rt;Par_Rt];
RT_Input=Rt;
%=========================scramble data===========================

rand('seed',29827);
v=randperm(26);
Rt=Rt(v);

%----------Intruduce error-------------------------------
Rt(m)=rem(Rt(m)+1,2);
%R1=R(:);
%----------------------------------------------------
x=clock;
%sd1=round(x(6)*1000);
%rand('seed',sd1);
rand('seed',7659);
v=randperm(26);[w1,w2]=sort(v);
Rr1=Rt(w2);
RT_output=Rr1;
%Rr1=Rt;
Rr=Rr1(1:25);

Rn=reshape(Rr,5,5);
%---------Test Syndrome------------------
A=rem(sum(Rn(1:4,:),2),2);
B=rem(sum(Rn(:,1:4)),2);
Left=rem(sum(diag(Rn)),2);
Right=rem(sum([diag(fliplr(Rn(1:4,1:4)));Rr1(26)]),2);
Mastersum=sum([A;B';Left;Right]);
%-----------------Extract data----------------
Dx=Rn(1:4,1:4);
Dx=Dx(:);Dx=Dx';
binArray2Hex(Dx,16);






