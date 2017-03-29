% EE9723 Lab 3


[sample,Fs] = audioread('../Speech samples/sample1.wav');

% frame_fft(sample, 1600,256)
frame_size = 256;

contour = pitch_contour( sample, Fs, frame_size );

map = stft(sample, 8000, frame_size, 1);
mesh(map)
axis xy; axis tight; colormap(jet); view(0,90);
hold on
z = repmat(35,1,size(contour, 2));
plot3(contour,1:size(contour, 2),z,'ro','LineWidth',3)





