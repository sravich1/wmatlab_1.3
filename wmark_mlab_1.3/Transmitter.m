%-------------------------------------------------------------------
%clear;m=1024;f1=2500;f2=3500;tc=0.01;T=[2:18];UserId=923;Amp=0.02;Tp=0.25;AmpNs=0.001;Transmitter


%clear;m=1024;f1=1000;f2=3500;tc=0.01;T=[2:2:18];UserId=923;Amp=0.02;Tp=0.25;AmpNs=0;Transmitter 
%clear;m=1024;f1=1000;f2=3500;tc=0.01;T=[2:2:18];UserId=923;Amp=0.02;Tp=0.25;AmpNs=0;Transmitter
 %=====================Audio Files==========================
%FILE='Cricbuzz-TV-Advertisement-Boss-Wife-Cricket-Ka-Keeda.wav';
% FILE='Crocin_Advance-_Hindi_30_seconds_.wav';
%FILE='Cricbuzz-TV-Advertisement-Cricket-Ka-Keeda-Airport.wav';
%FILE='Maaza-Greed-v_s-Girlfriend.wav';
FILE='Maaza-Twins-TVC-2016.wav';
%FILE='file23.wav';
%FILE='file9.wav';
%=========================Read Audio Files======================================
 [s,fs] = audioread(FILE);
 [K1,K2]=size(s);
  if K2==1
  s=[s s];
  end
  
%===================================================================  
%------------------Data Generation ( YOU NEED NOT IMPLEMENT THIS) -------------------------
x=clock;
sd=round(x(6)*1000);
rand('seed',sd);
bit=round(rand(1,16));
H=binArray2Hex(bit,16)
%-------------------Generate User Id----- YOU NEED NOT IMPLEMENT THIS-----------------
rand('seed',93)
UserId=round(rand(1,26));
%===============================================================
bits=Data_gen2(bit,UserId);
v=find(bits==0);bits(v)=-1;
%==================================================================
%---------------------- select 20 second audio--------------------
MM=round(20*fs);
sR=s(:,1);sR=sR';sR=sR(1:MM);
sL=s(:,2);sL=sL';sL=sL(1:MM);
%=========================================================
%------------------ Design Filters----------------------------------
% Preamble filter--------------------
an=fir1(1024,[4300 4700]/fs*2,'stop');
a=fir1(m,[f1 f2]/fs*2);
b=fir1(m,[f1 f2]/fs*2,'stop');
Mn=floor(tc*fs);L=2*Mn*length(bits);
sp=LFM_analog(44100,4400,4600,Tp);sp/rms(sp);
hh=fir1(1024,[4300 4700]/fs*2);
h=fir1(64,0.001);
hd=fir1(128,0.25);
Save_Filt_Para(a,Mn,L,sp,hh,h,hd,UserId);

%-----------------------------------
sRa=filter(a,1,sR);
sRb=filter(b,1,sR);

sLa=filter(a,1,sL);
sLb=filter(b,1,sL);


%===============Tx Wave Modulation ===============================

[sRa,sLa]=Tx_Block1(sRa,sLa,T,fs,bits,Mn,a,L,b,AmpNs);
%================= Prefix Preamble==================
sR=sRa+sRb;
sL=sLa+sLb;

[sR,sL]=Tx_Preamble(sR,sL,sp,T,Amp,fs);


%======================================================================
audiowrite('Test.wav',[sR' sL'],fs,'BitsPerSample',16);
%==========================================================
