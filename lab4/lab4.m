% EE9723 Lab 4
clear all
close all

[inp_aud,fs] = audioread('../Speech samples/sample4.wav');
frm_len=256;

formant_contour(inp_aud,fs,frm_len);

% Overlay pitch contour on both spectrogram and lpc
contour = pitch_contour( inp_aud, fs, frm_len );
z = repmat(35,1,size(contour, 2));

figure
formant_spectrogram(inp_aud,fs,frm_len,32);
hold on
% Overlay pitch contour
plot3(contour,1:size(contour, 2),z,'ro','LineWidth',3)
view(0,90);

figure
map = stft(inp_aud,fs,frm_len);
mesh(map)
axis xy; axis tight; colormap(jet); view(0,90);
title('Speech Pitch Countor Overlay Spectrogram')
xlabel('Frequency (Hz)')
ylabel('Frame Num')
hold on
% Overlay pitch contour
plot3(contour,1:size(contour, 2),z,'ro','LineWidth',3)