clear all
close all

[sample,fs] = audioread('../Test Files/test_utterance.wav');

% 70000 - 90000

%sample = sample(70000:90000);

frm_len = 256;
formant_contour(sample,fs,frm_len,0);


%{
T = linspace(0,size(sample,1)/fs, size(sample,1));
plot(T,sample);


% 1:24000
% 36000:58000
% 72000:91000

% 1:200
% 280:450
% 562:710

sample1 = sample(72000:91000);
sound(sample1,fs)
%}

