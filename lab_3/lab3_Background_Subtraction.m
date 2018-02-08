
path='Images/';
a = dir( [path '*.png'] ) ;
imcell = {};
for i=1:length(a)
    Img = im2double(imread( [path 'highway_' num2str(i) '.png'] ) ) ;
    %imshow (Img)
    imcell{i}= Img ;
end

background = rgb2gray( imcell{1});

%(Code: transform  the  first  image in the  cell  into  gray  scale)
for i =2:length( imcell )
    bs = abs(rgb2gray( imcell{i}) - background);
    I=bs ;
    I ( I>0.3) =1;
    I ( I<=0.3)=0;
end

subplot(2 ,2 ,1) ,  imshow ( background ) ;
subplot(2 ,2 ,2) ,  imshow ( rgb2gray ( imcell{end}) ) ;
subplot(2 ,2 ,3) ,  imshow ( bs ) ;
subplot(2 ,2 ,4) ,  imshow ( I ) ;