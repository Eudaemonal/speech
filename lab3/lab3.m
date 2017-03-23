% EE9723 Lab 3


[sample,Fs] = audioread('../Speech samples/sample1.wav');

% frame_fft(sample, 1600,256)
frame = sample(700:3600)


y = acf(frame,2000)
plot(y)
peakfinder(y)
