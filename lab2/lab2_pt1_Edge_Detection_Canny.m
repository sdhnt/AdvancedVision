rgbhand = imread ('Images/hand.png') ;
rgbhand = im2double ( rgbhand ) ;
hsvhand = rgb2hsv( rgbhand ) ;
s = hsvhand ( : , : , 2 ) ;
%Now we show  the  rgb_hand  and  the s colour  space
%subplot(1 ,2 ,1) ,  imshow ( rgbhand )
%subplot(1 ,2 ,2) ,  imshow ( s )

BW1 = edge(s,'Canny',0.1)
f1=figure('Name', '0.1')
imshow (BW1)

BW2 = edge(s,'Canny',0.15)
f2=figure('Name','0.15')
imshow (BW2)

BW3 = edge(s,'Canny',0.2)
f3=figure('Name', '0.2')
imshow (BW3)

BW4 = edge(s,'Canny',0.25)
f4=figure('Name','0.25')
imshow (BW4)

BW5 = edge(s,'Canny',0.3)
f5=figure('Name', '0.3')
imshow (BW5)