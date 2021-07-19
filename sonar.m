clc; 
plot(x) %Plot of transmitted signal x(n) 
figure,freqz(x) %Frequency response of x(n) 
X=fft(x); 
figure,plot(abs(X)) 
figure,plot(y) %Plot of received signal y(n) 
figure,freqz(y) %Frequency response of y(n) 
Y=fft(y); 
figure,plot(abs(Y)) 
[b,a]=SOS2tf(SOS,G); 
y2=filter(b,a,y); %filter calling. 
figure,plot(y2) % plot of filtered signal y2(n) 
figure,freqz(y2) %Frequency response of y(n) 
Y2=fft(y2); 
figure,plot(abs(Y2)) 
n0=1:length(x); % cross co-relation of transmitted
n2=1:length(y2); % signal x(n) and filtered signal y2(n) 
[x1,n1]=sigfold(x,n0); 
[z,n]=conv_m(x1,n1,y2,n2); 
figure,plot(n,z)