v=VideoReader(xylophone.mp4);
vidFrames=read(v);
nFrames=v.NumberOfFrames;
for i=1:nFrames
    imshow(vidFrames(:,:,:,i));
end

vw=VideoWriter('Images/example','MPEG-4');

open(vw);
for i=1:nFrames
    frame=rgb2gray(vidFrames(:,:,:,i));
    writeVideo(vw,frame);
end
close (vw)
