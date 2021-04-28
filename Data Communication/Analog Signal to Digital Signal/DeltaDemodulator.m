% Analog signal to digital signal converter
clc;
clear;
close all;

del = 0.16;
tP = 0.0001;

M = dlmread('output.txt');
len=length(M);

t=[0];
y=[0];

for i=1:len
    t=[t t(i)+tP];
    if (M(i)==0)
        y=[y y(i)+del];
    else 
        y=[y y(i)-del];
    end
end

figure(1), stairs(t, y), grid on;

out = lowpass(y,100,1/tP);

figure(2), plot(t, out), grid on;


