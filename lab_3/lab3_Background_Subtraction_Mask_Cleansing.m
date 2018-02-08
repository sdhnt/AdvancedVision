
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
    %(Code: Start  writing  your  code here , you  only  need to use  the  variable I (the mask) as  input)
end

subplot(2 ,2 ,1) ,  imshow ( background ) ;
subplot(2 ,2 ,2) ,  imshow ( rgb2gray ( imcell{end}) ) ;
subplot(2 ,2 ,3) ,  imshow ( bs ) ;
subplot(2 ,2 ,4) ,  imshow ( I) ;