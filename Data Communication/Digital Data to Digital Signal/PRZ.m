% Digital data to digital signal convert (Line coding)
clc;
clear;
close all;

M = dlmread('data.txt');
len=length(M);

x=[];
y=[];

for i=0:len-1
    x=[x i i+.5 i+.5 i+1];
    if (M(i+1)==0)
        y=[y -1 -1 0 0];
    else 
        y=[y 1 1 0 0];
    end
end

plot(x,y),axis([0,len,-1.5, 1.5]),xticks([0:len]);
grid on;

