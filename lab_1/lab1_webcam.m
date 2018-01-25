%webcamlist;
clear('cam');
cam = webcam('Logitech QuickCam Pro 4000');
%preview (cam);
for i=1:10
    img = snapshot(cam);
    file_name = ['Images/Image' num2str(i) '.png']
    imwrite (img, file_name);
    imshow(img)
end

clear('cam');
cam = webcam('Logitech QuickCam Pro 4000');
vw=VideoWriter('Images/Image/video','MPEG-4');

open(vw);
for i=1:10
    img = snapshot(cam);
    writeVideo(vw,img);
end
close (vw)

clear('cam');