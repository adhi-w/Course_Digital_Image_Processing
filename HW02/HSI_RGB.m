function img = HSI_RGB(imgSource)

%Get each value (H,S,I) from each channel
 H=imgSource(:,:,1);  
 S=imgSource(:,:,2);  
 I=imgSource(:,:,3);  
 
 %Convert Hue into the range [0 360]  
 H=H*360;                                               
 
 %Preallocate the R,G and B components  
 R=zeros(size(H));  
 G=zeros(size(H));  
 B=zeros(size(H));  
 RGB=zeros([size(H),3]);  
 
 %RG Sector(0<=H<120)      
 B(H<120)=I(H<120).*(1-S(H<120));  
 R(H<120)=I(H<120).*(1+((S(H<120).*cosd(H(H<120)))./cosd(60-H(H<120))));  
 G(H<120)=3.*I(H<120)-(R(H<120)+B(H<120));  
    
 %GB Sector(120<=H<240)      
 %Subtract 120 from Hue  
 H1=H-120;  
    
 R(H>=120&H<240)=I(H>=120&H<240).*(1-S(H>=120&H<240));  
 G(H>=120&H<240)=I(H>=120&H<240).*(1+((S(H>=120&H<240).*cosd(H1(H>=120&H<240)))./cosd(60-H1(H>=120&H<240))));  
 B(H>=120&H<240)=3.*I(H>=120&H<240)-(R(H>=120&H<240)+G(H>=120&H<240));  
    
 %BR Sector(240<=H<=360)  
 %Subtract 240 from Hue  
 H1=H-240;  
   
 G(H>=240&H<=360)=I(H>=240&H<=360).*(1-S(H>=240&H<=360));  
 B(H>=240&H<=360)=I(H>=240&H<=360).*(1+((S(H>=240&H<=360).*cosd(H1(H>=240&H<=360)))./cosd(60-H1(H>=240&H<=360))));  
 R(H>=240&H<=360)=3.*I(H>=240&H<=360)-(G(H>=240&H<=360)+B(H>=240&H<=360));  
   
 %Set Pixel of each channel 
 RGB(:,:,1)=R;  
 RGB(:,:,2)=G;  
 RGB(:,:,3)=B;  
  
 %Convert image into the range [0 255]  
 RGB=im2uint8(RGB);  
 img = RGB;

end