
rgbhand = imread ('Images/hand.png') ;
rgbhand = im2double ( rgbhand ) ;
hsvhand = rgb2hsv( rgbhand ) ;
s = hsvhand ( : , : , 2 ) ;

edcanny = edge ( s , 'Canny' , 0.2 ) ;
% Structuring element
SE = strel('square' , 3 ) ;
SE2 = strel ( 'square' , 8 ) ;
% Morphological operation
erosion = imerode( edcanny , SE) ;
dilation = imdilate( edcanny , SE2 ) ;
subplot ( 1 , 3 , 1 ) , imshow ( edcanny )
subplot ( 1 , 3 , 2 ) , imshow ( erosion )
subplot ( 1 , 3 , 3 ) , imshow ( dilation )