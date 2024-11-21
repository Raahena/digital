clc;
clear all;
close all;
n=input('Enter the data bits');
y=length(n);
freq1=input('Enter the frequency 1: ');
freq2=input('Enter the frequency 2: ');
for i=1:y
    if n(1,i)==0
        for t=((i-1)*100+1):(i*100)
            y(t)=sin(2*pi*freq1*t/1000);
            x(t)=0;
        end
    else
        for t=(i-1)*100+1:(i*100)
            y(t)=sin(2*pi*freq2*t/1000);
            x(t)=1;
        end
    end
end
figure(1);
subplot(2,1,1);
plot(x);
title('input Data');
subplot(2,1,2);
plot(y);
xlabel('Time in sec');
ylabel('Amplitude in volts');
title('FSK');
grid on;