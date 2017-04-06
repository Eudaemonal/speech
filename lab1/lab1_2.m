% EE9723 Lab 1

% Read speech file
% Plot samples
%{
s = load('../Speech samples/speech.mat');
fs = 8000;
sample = s.speech;
%}
[sample,fs] = audioread('../Speech samples/sample1.wav');

freq = linspace(0,fs,256);

%1600 - 2000
%2000 - 2250
%2250 - 2500


offset = 255;
start_idx = 1800;

frame_sample = sample(start_idx:start_idx+offset);

spectra(frame_sample,fs )

v_uv= voiced_unvoiced(sample, fs, 256);

plot(1:size(sample,1),v_uv,1:size(sample,1),sample )
