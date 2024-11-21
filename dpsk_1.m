clc;
clear all;
close all;
M=4;
x=randi([0 M-1],1000,1);
y=dpskmod(x,M,pi/8,'bin');
z=dpskdemod(y,M);
subplot(3,1,1);
plot(x);
title('Input data');
subplot(3,1,2);
plot(y);
title('DPSK')
subplot(3,1,3);
plot(z);
title('Demodulated signal')