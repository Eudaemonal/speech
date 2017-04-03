% EE9723 Lab 4
clear all
close all

[inp_aud,fs] = audioread('../Speech samples/sample4.wav');
frm_len=256;

formant_contour(inp_aud,fs,frm_len);

figure
formant_spectrogram(inp_aud,fs,frm_len,32);

