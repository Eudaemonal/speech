% EE9723 Lab 2

[sample,fs] = audioread('../Speech samples/sample1.wav');



% 800 - 3600
% 4600 - 7090

stft(sample,fs, 256)
%figure
%frame_fft(sample, 1600,256)



