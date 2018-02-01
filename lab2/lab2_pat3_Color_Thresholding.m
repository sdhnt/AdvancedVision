rgbhand = imread ('Images/hand.png') ;
rgbhand = im2double ( rgbhand ) ;
hsvhand = rgb2hsv( rgbhand ) ;
s = hsvhand ( : , : , 2 ) ;
edcanny = edge ( s , 'Canny' , 0.2 ) ;
SE2 = strel ( 'square' , 8 ) ;
dilation = imdilate( edcanny , SE2 ) ;

filledfingers = imfill(dilation, 'holes');% ( Code : Fill the wholes inside the dilation image )
SE = strel('square' ,15) ;
erodefingers = imerode( filledfingers , SE) ;% ( Code : Use erotion on the variable filled_fingers ) We will consider this as our mask
maskedhand = bsxfun ( @times , rgbhand , cast(erodefingers ,'like', rgbhand));

% Given that the green background has high intensity values in the green space , we will threshold that space .
G = rgbhand ( : , : , 2 );
%imshow (G) ; % Show the green space .
maskG = G.*erodefingers; % create a mask based on the green colour space and the previous mask .
imshow (maskG) % Show the binary mask .
% ( Code : Use the image mask_G to find the value of the threshold . Once you find it , replace the comment in " tr " with it .)
tr = 0.73;
% We threshold the intensity value of our new mask . All values above " tr " will become 0.
maskG ( maskG>tr)=0;
maskG ( maskG>0) =1; % we make our mask a binary image
% check if your threshold separated the fingers successfully
newmaskedhand = bsxfun( @times , rgbhand , cast( maskG , 'like' , rgbhand ) ) ;
subplot ( 1 , 2 , 1 ) , imshow ( maskedhand )
subplot ( 1 , 2 , 2 ) , imshow ( newmaskedhand )

% We put the mask on the rgb image using the bsxfun command

%subplot ( 1 , 2 , 1 ) , imshow ( erodefingers) ;
%subplot ( 1 , 2 , 2 ) , imshow ( maskedhand ) ;