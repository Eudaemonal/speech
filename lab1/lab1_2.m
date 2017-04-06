% EE9723 Lab 1

% Read speech file
% Plot samples
s = load('../Speech samples/speech.mat');
fs = 8000;
sample = s.speech;


freq = linspace(0,8000,256);

%1600 - 2000
%2000 - 2250
%2250 - 2500


offset = 255;
start_idx = 1800;

frame_sample = sample(start_idx:start_idx+offset);

spectra(frame_sample,fs )






plot(1:size(sample,1),v_uv,1:size(sample,1),sample )
