clc;
clear all;
close all;
data=[0 0 1 1 0 1 1 0 1 1 1 0];
figure(1)
stem(data,'LineWidth',3);
grid on;
title('Information before Transmitting');
axis([0 11 0 1.5]);
data_NRZ=2*data-1;
s_p_data=reshape(data_NRZ,2,length(data)/2);
br=10.^6;
f=br;
T=1/br;
t=T/99:T/99:T;
y=[];
y_in=[];
y_qd=[];
d=zeros(1,length(data)/2);
for i=1:length(data)/2
    p=data(2*i);
    imp=data(2*i-1);
    y1=s_p_data(1,i)*cos(2*pi*f*t);
    y2=s_p_data(1,i)*sin(2*pi*f*t);
    y_in=[y_in y1];
    y_qd=[y_qd y2];
    y=[y y1+y2];
    if(imp==0)&&(p==0)
        d(i)=exp(1j*pi/4);
    end
    if(imp==1)&&(p==0)
        d(i)=exp(1j*3*pi/4);
    end
    if(imp==1)&&(p==1)
        d(i)=exp(1j*5*pi/4);
    end
    if(imp==0)&&(p==1)
        d(i)=exp(1j*7*pi/4);
    end
end
Tx_sig=y;
qpsk=d;
tt=T/99:T/99:(T*length(data))/2;
figure(2);
subplot(3,1,1);
plot(tt,y_in,'LineWidth',3);
grid on;
title('Inphase component');
subplot(3,1,2);
plot(tt,y_qd,'LineWidth',3);
grid on;
subplot(3,1,3);
plot(tt,Tx_sig,'r',LineWidth=3);
grid on;
title("Modulated");
figure(3);
plot(d,'o');
axis([-2 2 -2 2]);
grid on;
title('QPSK constellation');
