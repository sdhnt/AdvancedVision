rgbhand = imread ('Images/hand.png') ;
rgbhand = im2double ( rgbhand ) ;
hsvhand = rgb2hsv( rgbhand ) ;
s = hsvhand ( : , : , 2 ) ;
edcanny = edge ( s , 'Canny' , 0.2 ) ;
SE2 = strel ( 'square' , 8 ) ;
dilation = imdilate( edcanny , SE2 ) ;
filledfingers = imfill(dilation, 'holes');
SE = strel('square' ,15) ;
erodefingers = imerode( filledfingers , SE) ;
maskedhand = bsxfun ( @times , rgbhand , cast(erodefingers ,'like', rgbhand));
G = rgbhand ( : , : , 2 );
maskG = G.*erodefingers; 
tr = 0.73;
maskG ( maskG>tr)=0; maskG ( maskG>0) =1;
newmaskedhand = bsxfun( @times , rgbhand , cast( maskG , 'like' , rgbhand ) ) ;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%First , if there is a small area near the palm of the hand , we can eliminate it using bwareopen .
maskG = bwareaopen ( maskG , 50 ) ; % Only the objects with area ( pixels ) >50 will remain .


lbl = bwlabel(maskG); % ( Code : label the fingers using mask_G )
imshow(lbl);% ( Code : Show the output of the bwlabel function and observe the values of the fingers )
close all ;
% ( Code : Show each finger separately . HINT : You can use ( lbl == i ) which will output a binary image were the pixels with value i will become 1 and the others 0)
for i=1:5
    subplot(1,5,i); imshow(lbl==i);
end 