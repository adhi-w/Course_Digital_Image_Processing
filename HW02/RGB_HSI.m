function img = RGB_HSI(imgSource)

%Convert RGB image in [0 1] range
I=double(imgSource)/255;
R=I(:,:,1);
G=I(:,:,2);
B=I(:,:,3);

num=1/2*((R-G)+(R-B));  %Hue
denum=((R-G).^2+((R-B).*(G-B))).^0.5;

%To avoid divide by zero exception add a small number in the denuminator
H=acosd(num./(denum+0.000001));

H(B>G)=360-H(B>G);  %If B>G then H = 360-Theta

H=H/360;    %Normalize to the range [0 1]
S=1- (3./(sum(I,3)+0.000001)).*min(I,[],3); %Saturation
I=sum(I,3)./3;  %Intensity

%HSI
HSI=zeros(size(imgSource));
HSI(:,:,1)=H;
HSI(:,:,2)=S;
HSI(:,:,3)=I;

img = HSI;
end
