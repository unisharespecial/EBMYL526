function [ ZZ ] = new(W,b)

% for A
imagefiles = dir('A/*.png'); 
nfiles = length(imagefiles);    % Number of files found
A=[];
for i=1:nfiles
    
   currentfilename = imagefiles(i).name;
   currentimage = imread(strcat('A/',currentfilename));
   A=[A currentimage(:)];
end
% for B
imagefiles = dir('B/*.png'); 
nfiles = length(imagefiles);    % Number of files found
B=[];
for i=1:nfiles
    
   currentfilename = imagefiles(i).name;
   currentimage = imread(strcat('B/',currentfilename));
   B=[B currentimage(:)];
end
% for C
imagefiles = dir('C/*.png'); 
nfiles = length(imagefiles);    % Number of files found
C=[];
for i=1:nfiles
    
   currentfilename = imagefiles(i).name;
   currentimage = imread(strcat('C/',currentfilename));
   C=[C currentimage(:)];
end
% collect them together
% w[ABC]+b=[sss]
% 3x784*784x30+3x30=3x30
X=double([A B C]);

% O is a 3x30 vektor similar to ABC as 100,010,001
myones=ones(1,10);
myzeros=zeros(1,10);
O=[myones myzeros myzeros;myzeros myones myzeros;myzeros myzeros myones];

 Y = W*X+b;
 Z = [];
 
    % Y=exp(X)./sum(exp(X)) %softmax
 for i=1:30
    Zi=exp(Y(:,i))./sum(exp(Y(:,i)));
    Z =[Z Zi];
   
 end
 
  ZZ = -1*(sum(sum(O.*log10(Z))));

end

