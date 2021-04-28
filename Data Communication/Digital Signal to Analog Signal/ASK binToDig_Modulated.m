% Digital signal to analog signal convert
clc;
clear all;
close all;


% 1st step:
% Generate digital signal from binary data
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

% Step 2
% Ask modulation | Generate analog signal

A0=0;
A1=10;
f=10/bp;

t2=bp/99:bp/99:bp;
m=[];

for n=1:1:length(x)
  if x(n)==1
    y=A1*cos(2*pi*f*t2);
  else
    y=A0*cos(2*pi*f*t2);
  end
  m=[m y];
end

t3=bp/99:bp/99:bp*length(x);


subplot(2,1,1);
plot(t3,m); grid on;
axis([0 length(x)*bp -1.5 1.5]);
xlabel('Time');
ylabel('amplitude');
title('Modulated signal'); 
