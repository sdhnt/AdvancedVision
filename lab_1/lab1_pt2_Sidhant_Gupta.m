Img= imread('Images/uni.png')

ImgGray = rgb2gray(Img);
ImgHSV = rgb2hsv(Img);
ImgLab = rgb2lab(Img);

subplot(1,4,1);
imshow(Img);
title('RBG Image');
imwrite(Img, 'Images/RGB.png');

subplot(1,4,2);
imshow(ImgGray);
title('Gray Image');
imwrite(ImgGray, 'Images/Gray.png');

subplot(1,4,3);
imshow(ImgHSV);
title('HSV Image');
imwrite(ImgHSV, 'Images/HSV.png');

subplot(1,4,4);
imshow(ImgLab);
title('Lab Image');
imwrite(ImgLab, 'Images/Lab.png');
