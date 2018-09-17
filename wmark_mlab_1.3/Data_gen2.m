function BIT=Data_gen2(bit,Id)
% This function converts 16 bit pay load to 32 bit by adding parity matrix
% Extended Hamming code. Data is encrypted with user Id
  bit=Parity_Mtx(bit);
  %- XOR with user Id----------------
  bits=xor(bit,Id);
  %  -----------Generate Hamming Encoder(31,26)----------
  [bx,Hdx,yArray]=Ham_Encode;
  Parity=rem(bits*bx,2);
  BITS=[bits Parity];
  % 32nd is  extended bit=============
  BIT=[rem(sum(BITS),2) BITS];
  save Decoder Hdx yArray 
  %============================================================================
  