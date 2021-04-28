clc;
close all;
clear all;

Am=5; 
fa=200; 
Ta=1/fa; 
t=0:Ta/999:Ta; 
ym=Am*sin(2*pi*fa*t); 

Input = [ym;t];
save('input.mat', 'Input');


