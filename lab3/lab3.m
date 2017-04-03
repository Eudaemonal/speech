% EE9723 Lab 3


[sample,fs] = audioread('../Speech samples/sample1.wav');

% frame_fft(sample, 1600,256)
frame_size = 256;

contour = pitch_contour( sample, fs, frame_size );

% Plot stft spectrogram
map = stft(sample, fs, frame_size, 1);
mesh(map)
axis xy; axis tight; colormap(jet); view(0,90);
title('Speech Pitch Countor Overlay Spectrogram')
xlabel('Frequency (Hz)')
ylabel('Frame Num')

hold on

% Overlay pitch contour
z = repmat(35,1,size(contour, 2));
plot3(contour,1:size(contour, 2),z,'ro','LineWidth',3)





