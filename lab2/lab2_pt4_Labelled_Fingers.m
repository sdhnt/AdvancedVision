close  all;
%We will  concatenate  the  positions  of our 5 fingers , so we  initialize  the  position as  empty.
position = [] ;
%Names  for  our  fingers.
labelstr ={['Pinky'] , ['Ring  Finger'] , ['Middle  Finger'] , ['Index  Finger'] , ['Thumb']};
%Go  through  all  the 5 labels  to find  the  maximum  and  minimum  row (r) and  column (c)
for i =1:5
[r ,c]= find( lbl==i ) ;
maxr=max( r ) ;minr=min( r ) ;
maxc=max( c ) ;minc=min( c ) ;
width = maxc-minc+1;
%obtaining  the  width  of the  bounding  box
height = maxr-minr +1;
%obtaining  the  height  of the  bounding  box
position=[position ;  [ minc ,  minr ,  width ,  height ] ] ;
%concatenating  the positions  of the  fingers
end
rgb=insertObjectAnnotation ( rgbhand ,'rectangle', position ,  labelstr ,'Color','red', 'FontSize',  10) ;
imshow ( rgb ) ;