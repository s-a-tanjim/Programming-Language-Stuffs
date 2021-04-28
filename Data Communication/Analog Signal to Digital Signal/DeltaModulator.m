% Analog signal to digital signal converter
clc;
clear;
close all;

load input.mat;
figure(1), plot(Input(2,:), Input(1,:));
grid on;



del = max(Input(1,:))/(length(Input(1,:))/32);

out = [];
stair = [Input(1,1)];
time = [0];
j=1;
for i=1:8:length(Input(1,:))-8
    if (Input(1,i) >= Input(1,i+8))
        out = [out 1];
        stair = [stair stair(j)-del];
     
    else
        out = [out 0];
        stair = [stair stair(j)+del];
    end
    j=j+1;
    time = [time Input(2,i+8)];
end

dlmwrite('output.txt', out, 'delimiter', ' ');

figure(2), plot(Input(2,:), Input(1,:)), grid on;
hold on;
stairs(time, stair);
hold off;

