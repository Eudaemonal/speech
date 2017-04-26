function varargout = gammatone(fc, fs, L)
%GAMMATONE Summary of this function goes here
%   Detailed explanation goes here
%{
INPUTS:
        fc  - centre frequency (Hz)
        fs  - sampling frequency (Hz)
        L   - filter length
ONPUTS:
        p   - finite length gammatone filter taps
%}
a = 1;
b = 1.019;
T = 1/fs;
N = 3;
ERB = 24.7 + 0.108 * fc;

p = zeros(L,1);
for n=1:L
   p(n) = a*(n*T)^(N-1)*exp(-2*pi*b*ERB*n*T)*cos(2*pi*fc*n*T);
end

varargout = {p};

end

