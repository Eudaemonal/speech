
clear all
close all

[sample,fs] = audioread('../Test Files/test_phoneme.wav');

stft(sample,fs);view(0,90);


figure

formant_contour(sample,fs,256,0);