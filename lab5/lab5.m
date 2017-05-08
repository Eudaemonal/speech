% EE9723 Lab 5

clear all
close all


len = 160;
fs = 8000;

[inp_aud,fs] = audioread('../Speech samples/speech.wav');

fc = [50 150 250 350 450 570 700 840 1000 1170 1370 1600 1850 2150 2500 2900 3400];


f_analysis = zeros(size(fc, 2), len);
f_synthesis = zeros(size(fc, 2), len);
for i=1:size(fc, 2)
    f_analysis(i,:) = gammatone(fc(i),fs,len);
    f_synthesis(i,:) = fliplr(f_analysis(i,:));
end

m = zeros(size(fc, 2), size(inp_aud, 1));
x = zeros(size(fc, 2), size(inp_aud, 1));
s = zeros(1, size(inp_aud, 1));
for i=1:size(fc, 2)
    m(i, :) = filter(f_analysis(i,:), 1, inp_aud);
    x(i, :) = filter(f_synthesis(i,:), 1, m(i,:));
    s(1,:) = s(1,:) + m(i, :);
end
