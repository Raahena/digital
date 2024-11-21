clc;
clear all;
close all;
n=input('Enter the input bits: ');
y=length(n);
freq=input('Enter the frequency: ');
for i= 1:y
    if n(1,i)==0
        for t=((i-1)*100+1):(i*100)
            y(t)=sin(2*pi*freq*t/1000+pi);
            x(t)=0;
        end
    else
        for t=((i-1)*100+1):(i*100)
            y(t)=sin(2*pi*freq*t/1000);
            x(t)=1;
        end
    end
end
figure(1);
subplot(2,1,1);
plot(x);
title('Input Data');
subplot(2,1,2);
plot(y);
title('PSK');
xlabel('Time in sec');
ylabel('Amplitude in volts');