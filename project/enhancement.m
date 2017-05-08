clear all
close all

[inp_aud,fs] = audioread('../Speech samples/sample4.wav');
frm_len=160;

sig0 = window(inp_aud, frm_len, 0.5,'hamming');



