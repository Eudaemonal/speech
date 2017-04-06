clear all
close all

[sample1,fs1] = audioread('../Test Files/test_sample1.wav');
[sample2,fs2] = audioread('../Test Files/test_sample2.wav');
[sample3,fs3] = audioread('../Test Files/test_sample3.wav');

frame_size = 256;

contour1 = pitch_contour( sample1, fs1, frame_size,4,0.4 );

% Plot stft spectrogram
map1 = stft(sample1, fs1, frame_size, 0);
mesh(map1)
axis xy; axis tight; colormap(jet); view(0,90);
title('Speech Pitch Countor Overlay Spectrogram')
xlabel('Frequency (Hz)')
ylabel('Frame Num')
hold on
% Overlay pitch contour
z = repmat(35,1,size(contour1, 2));
plot3(contour1,1:size(contour1, 2),z,'ro','LineWidth',3)
