close  all;
BW = zeros (9 ,10) ;
BW( 4 : 6 , 4 : 7 ) = 1;
SE1 = strel('square',3) ;
BW2 = imdilate (BW,SE1);
SE2 = strel('diamond',2);
BW3 = imdilate (BW,SE2);
subplot(1 ,3 ,1) ,  imshow ( BW)
subplot(1 ,3 ,2) ,  imshow ( BW2)
subplot(1 ,3 ,3) ,  imshow ( BW3)
