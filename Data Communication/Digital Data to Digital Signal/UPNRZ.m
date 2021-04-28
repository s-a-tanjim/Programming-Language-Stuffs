% Digital data to digital signal convert (Line coding)
clc;
clear;
close all;

M = dlmread('data.txt');
len=length(M);

x=[];
y=[];

for i=0:len-1
    x=[x i i+1];
    y=[y M(i+1) M(i+1)];
end

plot(x,y),axis([0,len,-1.5, 1.5]),xticks([0:len]);
grid on;
