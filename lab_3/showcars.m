function showcars ( I ,  imcell ,  tbf )
%I: The  mask  that  segments  the  cars.
%im_cell: an RGB  image (frame  of the  video).
%tbf: time  between  frames.
lbl = bwlabel ( I ) ;
position = [] ;
labelstr ={};
for j=1:max(max(lbl))
    [r ,c]= find(lbl==j) ;
    maxr=max( r ) ;minr=min( r ) ;
    maxc=max( c ) ;minc=min( c ) ;
    width = maxc-minc+1;
    %obtaining  the  width  of the  bounding  box
    height = maxr-minr +1;
    %(Code: find  the  position  of the  bounding  boxes)
    position = [position ;  [ minc ,  minr ,  width ,  height ] ] ;
    %Concatenate  the  positions  of each  car
    labelstr{j}= ['car'] 
end
if  isempty(labelstr )==0
    rgb=insertObjectAnnotation ( imcell ,'rectangle',position,labelstr ,'Color','red','FontSize',11) ;
    imshow (rgb) ;
else
    imshow (imcell)
end
    pause (tbf)
end