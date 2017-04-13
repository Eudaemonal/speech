clear all
close all

[sample1,fs1] = audioread('../Test Files/test_sample1.wav');
[sample2,fs2] = audioread('../Test Files/test_sample2.wav');
[sample3,fs3] = audioread('../Test Files/test_sample3.wav');

frame_size = 256;

mode = 1;
switch(mode)
    case 1
% ------------------------- test_sample1-----------------------------------
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
    case 2
% ------------------------- test_sample2-----------------------------------
figure
contour2 = pitch_contour( sample2, fs2, frame_size,4,0.4 );
% Plot stft spectrogram
map2 = stft(sample2, fs2, frame_size, 0);
mesh(map2)
axis xy; axis tight; colormap(jet); view(0,90);
title('Speech Pitch Countor Overlay Spectrogram')
xlabel('Frequency (Hz)')
ylabel('Frame Num')
hold on
% Overlay pitch contour
z = repmat(35,1,size(contour2, 2));
plot3(contour2,1:size(contour2, 2),z,'ro','LineWidth',3)

    case 3
% ------------------------- test_sample3-----------------------------------
figure
contour3 = pitch_contour( sample3, fs3, frame_size,16,0.2 );
% Plot stft spectrogram
map3 = stft(sample3, fs3, frame_size, 0);
mesh(map3)
axis xy; axis tight; colormap(jet); view(0,90);
title('Speech Pitch Countor Overlay Spectrogram')
xlabel('Frequency (Hz)')
ylabel('Frame Num')
hold on
% Overlay pitch contour
z = repmat(35,1,size(contour3, 2));
plot3(contour3,1:size(contour3, 2),z,'ro','LineWidth',3)


end