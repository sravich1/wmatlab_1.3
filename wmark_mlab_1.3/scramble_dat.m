% Scramble 26 bit data================
function [y,v]=scramble_dat(x,seed)
rand('seed',seed);
v=randperm(26);
y=x(v);
%========= Descrambling array================
rand('seed',seed);
v=randperm(26);[w1,w2]=sort(v);