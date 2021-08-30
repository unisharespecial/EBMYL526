function [ ZZ ] = kemal(ref)
W= ref(1:3,1:25);
b= ref(1:3,26);

imagefiles = dir('A/*.png'); 
nfiles = length(imagefiles);    % Number of files found
A=[];
for i=1:nfiles
    
   currentfilename = imagefiles(i).name;
   currentimage = (imread(strcat('A/',currentfilename))-128)/128;
   A=[A currentimage(:)];
end
% for B
imagefiles = dir('B/*.png'); 
nfiles = length(imagefiles);    % Number of files found
B=[];
for i=1:nfiles
    
   currentfilename = imagefiles(i).name;
   currentimage = (imread(strcat('B/',currentfilename))-128)/128;
   B=[B currentimage(:)];
end
% for C
imagefiles = dir('C/*.png'); 
nfiles = length(imagefiles);    % Number of files found
C=[];
for i=1:nfiles
    
   currentfilename = imagefiles(i).name;
   currentimage = (imread(strcat('C/',currentfilename))-128)/128;
   C=[C currentimage(:)];
end
% collect them together
% w[ABC]+b=[sss]
% 3x784*784x30+3x30=3x30
X=double([A B C]); %784X30

% O is a 3x30 vektor similar to ABC as 100,010,001
myones=ones(1,3);
myzeros=zeros(1,3);
O=[myones myzeros myzeros;myzeros myones myzeros;myzeros myzeros myones];

 Y = W*X+b;
 Z = [];
 
    % Y=exp(X)./sum(exp(X)) %softmax
 for i=1:9
    Zi=exp(Y(:,i))./sum(exp(Y(:,i)));
    Z =[Z Zi];
 end
 
  ZZ = -1*(sum(sum(O.*log10(Z))));

end

