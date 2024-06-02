clc
input = readmatrix("samples.csv");
Fs = 1000;
seconds = 5;
t = 0:1/Fs:seconds;
input = input(3:length(t)+2, 2);

plot(t,input);

N = length(input);
D = fft(input);
D = fftshift(D);
f = -Fs/2:Fs/N:Fs/2 - Fs/N;
figure;
plot(f,abs(D));

hpb = highpassbutterworth();
lpb = lowpassbutter();
filtered_butter = filter(hpb, input);
filtered_butter = filter(lpb, filtered_butter);
hpc1 = highpasscheby1();
lpc1 = lowpasscheby1();
filtered_cheb1 = filter(hpc1, input);
filtered_cheb1 = filter(lpc1, filtered_cheb1);
hpc2 = highpasscheby1();
lpc2 = lowpasscheby1();
filtered_cheb2 = filter(hpc2, input);
filtered_cheb2 = filter(lpc2, filtered_cheb2);
hpe = highpasselliptic();
lpe = lowpasselliptic();
filtered_elliptic = filter(hpe, input);
filtered_elliptic = filter(lpe, filtered_elliptic);

figure;
subplot(4,1,1);
plot(t,filtered_butter);
subplot(4,1,2);
plot(t,filtered_cheb1);
subplot(4,1,3);
plot(t,filtered_cheb2);
subplot(4,1,4);
plot(t,filtered_elliptic);

[z,p,k] = ellip(6,1,40,[5/360 25/360],"bandpass");
figure;
zplane(z,p)
