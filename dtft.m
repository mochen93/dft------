%��֤��ɢ�źŵ�������
% t = 0:0.01:10
% y = sin(1*t + pi / 70);
% figure(1)
% plot(t,y)
% hold on;
% z = sin((1+2*pi)*t + pi / 70);
% plot(t,z)
% hold off
%%�˷���Ϊ����֤DFTդ��ЧӦ������ͼ���Թ۲쵽�������ǲ�ȡ���㻹�����Ӳ����㣬�����DTFT��˵��դ��ЧӦ�����Ա�ã���ν�Ĳ��㲻�ܽ�������飬��������ɢ�źŵ���ԭʼ�źţ���������ڴ�������ɢ�ź���˵����ȷ���������������
%%���Ƕ���һ���ź���˵���������ʱ�������źţ��൱��ʱ���źŷ�Χ֮��Ҳȫ�����㣬���������ʱ�������źŶ��ԣ������㲻����������ŵ�˵��
%%��������ͼҲ���Է��֣������ǲ��㻹�����Ӳ����㣬DFT������DTFT�ϵĲ�������ʾDFT�������DTFT��������
%%�������ԣ����Ӳ�������DFT���������������ź�cos��sin ��Ƶ�ף��������ⲻ������դ��ЧӦ����ģ������������޽�ȡ���Ӵ������������԰�й¶��
%%���ʴ���վ
%https://books.google.com.hk/books?id=JUqy-M3XqZwC&pg=PA222&lpg=PA222&dq=DFT+%E8%A1%A5%E9%9B%B6&source=bl&ots=ETTvvtV_Kx&sig=XGfuEOV1Y8Fd1wiDXCH-Q47CiqE&hl=zh-CN&sa=X&ved=0ahUKEwjf09DQ1-nVAhVBNbwKHYcSBnIQ6AEIVjAJ#v=onepage&q=DFT%20%E8%A1%A5%E9%9B%B6&f=false
%%
%%ͨ����������֤ͼ��
M=64;%M���ǲ������
N=256;%�ܵ���256���������N-M��
f1=-300;
f2=-600;
fn=2000;
m=0:M-1;
yn=cos(2*pi*f1*m/fn)+sin(2*pi*f2*m/fn);%ԭʼ�źţ���ԭʼ�ź��Ѿ��൱�ڱ���ȡ���м�һ�أ�
zn=zeros(1,N-M);%��������Բ���ƴ��
xn=[yn,zn];%ƴ��
%xn = gaussmf(n,[0.5,5]);%��˹����
n=0:N-1;
k=0:N-1;
WN=exp(-1j*2*pi/N);
nk=n'*k;
WNnk=WN.^nk;
Xk=xn*WN.^nk;
figure(1)
stem(xn)%��ʾԭͼ��
figure(2)
stem(abs(Xk))%��ʾDFTͼ��
hold on
[H,W]=freqz(xn,1,N,'whole'); 
plot(abs(H))%��ʾdtftͼ��
hold off
%%
%%���Ӳ�����
M=256;
N=256;
f1=-300;
f2=-600;
fn=2000;
m=0:M-1;
yn=cos(2*pi*f1*m/fn)+sin(2*pi*f2*m/fn);
zn=zeros(1,N-M);
xn=[yn,zn];
%xn = gaussmf(n,[0.5,5]);%��˹����
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
%ƫ�ŷ��������غ�Ĳ��־���ֱ�Ӹ���������ߣ��鿴dtft��DFT
M=126;
N=126;
f1=-300;
f2=-600;
fn=2000;
m=0:M-1;
yn=cos(2*pi*f1*m/fn)+sin(2*pi*f2*m/fn);
xn=[yn,yn];
%xn = gaussmf(n,[0.5,5]);%��˹����
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