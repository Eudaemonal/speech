clear all
close all

[sample1,fs1] = audioread('../Test Files/test_sample1.wav');
[sample2,fs2] = audioread('../Test Files/test_sample2.wav');
[sample3,fs3] = audioread('../Test Files/test_sample3.wav');

frm_len = 256;

formant_contour(sample1,fs1,frm_len,1);
figure
formant_contour(sample2,fs2,frm_len,1);
figure
formant_contour(sample3,fs3,frm_len,1);
