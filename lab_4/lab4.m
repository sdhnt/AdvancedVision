pc = pcread('Images/bottles.ply') ;
%Reading  the point -cloud
%showPointCloud(pc)
colorpc = pc.Color ;
r = colorpc( : , 1);%(Code: get  the r color)
g = colorpc( : , 2);%(Code: get  the g color)
b = colorpc( : , 3);%(Code: get  the b color)
recr = reshape(r,[480, 640]);%(reshape r)
recg =reshape(g,[480, 640]);%(reshape g)
recb =reshape(b,[480, 640]);%(reshape b)
newrgb ( : , : , 1 ) = recr ;
newrgb ( : , : , 2 ) = recg ;
newrgb ( : , : , 3 ) = recb ;
%imshow ( newrgb );

greyimg=rgb2gray(newrgb);
edcanny = edge ( greyimg , 'Canny' , 0.2 ) ;SE2 = strel ( 'square' , 13) ;
dilation = imdilate( edcanny , SE2 ) ;
filledbottles = imfill(dilation, 'holes');SE = strel('square' ,10) ;
mask=imerode(filledbottles, SE);
mask= bwareaopen(mask, 13000);
rgbpoints= bsxfun(@times, newrgb, cast(mask, 'like', newrgb));
imshow(rgbpoints);

threshold = find(rgbpoints);%(Code: Segment the third bottle and name the mask "threshold ")
indxxyzno= find(pc<=threshold)

%(Code: find  the  indices  of the  pixels  where  our  bottle  is not  located)
xyzpc = pc.Location;
%Eliminating  the  indices  where  our  bottle  is not  located.
xyzpc ( indxxyzno , : ) = [];
colorpc ( indxxyzno , : ) = [] ;%Creating a new point -cloud
newpc = pointCloud ( xyzpc ,'Color',  colorpc ) ;
%Saving  the  new point -cloud
pcwrite ( newpc ,'single_bottle.ply') ;
%showPointCloud ( newpc );