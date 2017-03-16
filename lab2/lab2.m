% EE9723 Lab 2

[sample,Fs] = audioread('../Speech samples/sample1.wav');



% 800 - 3600
% 4600 - 7090

stft(sample)
figure
frame_fft(sample, 1600,256)

% stft(sample)


