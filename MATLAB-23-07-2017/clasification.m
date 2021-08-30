clear all
close all

W=randn(3,25);
b=randn(3,1);
ref = [W b];

%fun = @myObjective(W,b)-1*(sum(sum(O.*log10(Z))));
%kemal(W,b); 
%options = optimset('Display','iter','PlotFcns',@optimplotfval);
options = optimset('Display','iter');
Z = fminsearch(@kemal,ref,options)
% f = @(x,a)100*(x(2) - x(1)^2)^2 + (a-x(1))^2;
save Z;

ZW= Z(1:3,1:75);
Zb= Z(1:3,26:34);











