% Generate Digital Signal from Binary bits
clc;
clear all;
close all;

x = [1 0 0 1 1 0 1]

disp(x);
bp=.000001;


bit=[];


for n=1:1:length(x)
  if x(n)==1
    se = ones(1,100);
  else
    se = zeros(1,100);
  end
  bit=[bit se];
end

t1 = bp/100:bp/100:length(x)*bp;

subplot(2,1,1);
plot(t1,bit,'LineWidth',2.5); grid on;
axis([0 length(x)*bp -0.5 1.5]);
xlabel('Time');
ylabel('amplitude');
title('Dig signal'); 