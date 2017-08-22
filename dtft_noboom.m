%验证离散信号的周期性
% t = 0:0.01:10
% y = sin(1*t + pi / 70);
% figure(1)
% plot(t,y)
% hold on;
% z = sin((1+2*pi)*t + pi / 70);
% plot(t,z)
% hold off
%%此方法为了验证DFT栅栏效应，由作图可以观察到，不论是采取补零还是增加采样点，相对于DTFT来说，栅栏效应都明显变好，所谓的补零不能解决的事情，是周期离散信号当成原始信号，这样相对于此周期离散信号来说，的确补零引入许多干扰项，
%%但是对于一般信号来说，本身就是时域有限信号，相当于时域信号范围之外也全都是零，所以相对于时域有限信号而言，本身补零不存在引入干扰的说法
%%由作出的图也可以发现，不论是补零还是增加采样点，DFT都是在DTFT上的采样，表示DFT并不会对DTFT产生干扰
%%但是明显，增加采样点后的DFT更加贴近于无限信号cos与sin 的频谱，（但是这不是由于栅栏效应引起的，而是由于有限截取（加窗），产生的旁瓣泄露）
%%
%%访问此网站
%https://books.google.com.hk/books?id=JUqy-M3XqZwC&pg=PA222&lpg=PA222&dq=DFT+%E8%A1%A5%E9%9B%B6&source=bl&ots=ETTvvtV_Kx&sig=XGfuEOV1Y8Fd1wiDXCH-Q47CiqE&hl=zh-CN&sa=X&ved=0ahUKEwjf09DQ1-nVAhVBNbwKHYcSBnIQ6AEIVjAJ#v=onepage&q=DFT%20%E8%A1%A5%E9%9B%B6&f=false
%%
%%通过补零来验证图像
M=64;%M点是采样点的
N=256;%总点数256个，补零点N-M个
f1=-300;
f2=-600;
fn=2000;
m=0:M-1;
yn=cos(2*pi*f1*m/fn)+sin(2*pi*f2*m/fn);%原始信号（此原始信号已经相当于被截取到中间一截）
zn=zeros(1,N-M);%零矩阵用以补零拼接
xn=[yn,zn];%拼接
%xn = gaussmf(n,[0.5,5]);%高斯函数
n=0:N-1;
k=0:N-1;
WN=exp(-1j*2*pi/N);
nk=n'*k;
WNnk=WN.^nk;
Xk=xn*WN.^nk;
figure(1)
stem(xn)%显示原图像
figure(2)
stem(abs(Xk))%显示DFT图像
hold on
[H,W]=freqz(xn,1,N,'whole'); 
plot(abs(H))%显示dtft图像
hold off
%%
%%增加采样点
M=256;
N=256;
f1=-300;
f2=-600;
fn=2000;
m=0:M-1;
yn=cos(2*pi*f1*m/fn)+sin(2*pi*f2*m/fn);
zn=zeros(1,N-M);
xn=[yn,zn];
%xn = gaussmf(n,[0.5,5]);%高斯函数
n=0:N-1;
k=0:N-1;
WN=exp(-1j*2*pi/N);
nk=n'*k;
WNnk=WN.^nk;
Xk=xn*WN.^nk;
figure(3)
hold on
stem(abs(Xk))
[H,W]=freqz(xn,1,N,'whole'); 
plot(abs(H))
%%
%偏门方法：将截后的部分矩阵直接复制贴到后边，查看dtft与DFT
M=126;
N=126;
f1=-300;
f2=-600;
fn=2000;
m=0:M-1;
yn=cos(2*pi*f1*m/fn)+sin(2*pi*f2*m/fn);
xn=[yn,yn];
%xn = gaussmf(n,[0.5,5]);%高斯函数
N=N*2;
n=0:N-1;
k=0:N-1;
WN=exp(-1j*2*pi/N);
nk=n'*k;
WNnk=WN.^nk;
Xk=xn*WN.^nk;
figure(4)
hold on
stem(abs(Xk))
[H,W]=freqz(xn,1,N,'whole'); 
plot(abs(H))