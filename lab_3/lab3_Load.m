path='Images/';
a = dir([path '*.png']) ;
imcell = {};
for i=1:length(a)
    Img = im2double(imread( [path 'highway_' num2str(i) '.png'] ) ) ;
    imshow (Img);
    imcell{i}= Img;
end