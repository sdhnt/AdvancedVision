Img= imread('Images/uni.png')
%whos Img
R = Img(:,:,1) ;  %Red
G = Img (:,:,2) ; %Green
B = Img (:,:,3) ; %Blue

subplot(2,2,1);
imshow(Img);
subplot(2,2,2);
imshow(R);
subplot(2,2,3);
imshow(G);
subplot(2,2,4);
imshow(B);

Img = im2double(Img);
R = im2double(R);
G = im2double(G);
B = im2double(B);
whos Img