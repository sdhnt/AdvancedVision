path='Images/';
a = dir( [path '*.png'] ) ;
imcell = {};
for i=1:length(a)
    Img = im2double(imread( [path 'highway_' num2str(i) '.png'] ) ) ;
    %imshow (Img)
    imcell{i}= Img ;
end

background = rgb2gray(imcell{1});

SE=strel ('square',5) ;
%Use it for  the  dilation
SE1=strel ('rectangle',[10,5] ) ;
%Use it for  the  imclose  operation

for i =2:length( imcell )
    bs = abs(rgb2gray( imcell{i}) - background);
    I=bs ;
    I ( I>0.3) =1;
    I ( I<=0.3)=0;
    I = bwareaopen(I, 30);
    I =imdilate(I,SE);
    I=imclose(I,SE1);
    I = imfill(I, 'holes');
    tbf= 0.01;
    showcars(I,imcell{i},tbf);
end
