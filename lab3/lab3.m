% EE9723 Lab 3


[sample,Fs] = audioread('../Speech samples/sample1.wav');

% frame_fft(sample, 1600,256)
frame_size = 256;

%{
frame_num = floor(size(sample,1)/(frame_size/2));
pitch_contour=  zeros(1,frame_num-1);

for i = 1:frame_num-1
    % offset is half frame size 
    offset = (i-1)*frame_size/2;
    
    frame = sample(1+offset:offset+frame_size);
    
    y = acf(frame,128);
    [loc, mag] = peakfinder(y,(max(y)-min(y))/4,0.6);
    
    
    
    if size(loc,1) >= 2
        pitch_contour(i) = 8000/(loc(2) - loc(1));
    else
        pitch_contour(i) = 0;
    end
end
%}

contour = pitch_contour( sample, Fs, frame_size );

map = stft(sample, 8000, frame_size, 1);
mesh(map)
axis xy; axis tight; colormap(jet); view(0,90);
hold on
z = repmat(35,1,size(contour, 2));
plot3(contour,1:size(contour, 2),z,'ro','LineWidth',3)





