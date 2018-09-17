% Create Parity bits for 16 bit pay load to make 26 bits
% Data is arranged as 4 x4 matrix  & Row , Column and diagonal parity are evaluated
function y=Parity_Mtx(x)
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
y=Rt';