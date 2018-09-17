% Implements receiver
% Receiver operates in blocks of 2 seconds with a shift of 0.5 sec
%clear;T1=0.51;T2=18;Id=923;THR=100;Reciever
%Input:-
%     T1= Start Time in sec
%     T2= End time  in sec
%     Id= User Id a number less than 1024 , same one used in Tx
%     THR= Detection Threshhold 
% Functions used
%      wavdemod
%      DataRecover - Hamming decoder for error correction
%      con2dec - Used in data recover

%[S,fs] = audioread('5100.wav');
%[S,fs] = audioread('15F5.wav');
[S,fs] = audioread('Test.wav');
[K1,K2]=size(S);
%============select both  channel (left or right) and add
S=S+amp*randn(size(S));


if K2==2  %sL=sL(:,1);
  sL=sum(S');sL=sL';
  else
  sL=S';
end
%--------------------------------------------------------------
%==================================== Down Load Filter Parameters===============
load RxInfo

%-------------------Reciver Filter--------------
%---------------------------------------

T=T1;
while T<T2 
  T=T1+2;
  n1=round(T1*fs);
  n2=round(T*fs);
  sR=sL(n1:n2);
    %-------------------------------- Down Sample by 4------------------
  sR=filter(hd,1,sR);
  sR=sR(1:4:end);
   % ------------Down sampled ---------------------------------
  sr=filter(hh,1,sR);
%============================================
%------------Peak detect-------------------------
  Sd=filter(fliplr(sign(sp)),1,sign(sr(1:15025)));
  Sd=filter(h,1,abs(Sd));
  [sd,m0]=max(Sd);
  if sd>THR
  mm=m0-(8+128);
  si=sR(mm:mm+L-1+128);
  si=filter(a,1,si);
  BIT=Wav_Demod(si(128:end),Mn,a,32);
  v=find(BIT==-1);BIT(v)=0;
  [BIT,Mastersum]=DataRecover2(BIT,Id);
  if Mastersum>0
    BIT=zeros(1,16);
  end  
  else 
  BIT=zeros(1,16);
  end
  Ho=binArray2Hex(BIT,16)
  T1=T1+0.75;
end

