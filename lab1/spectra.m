function [ varargout ] = spectra( x, fs, mux)
%SPECTRA Summary of this function goes here
%   Detailed explanation goes here
%{
INPUTS:
        x   - Input samples
        fs  - sampling frequency (Hz)
        mux - 1 Magnutude spectra (default)
              2 Phase spectra
              3 Plot Both Magnutude and Phase spectra

ONPUTS:
        spectra - Magnutude spectra
                - Phase spectra
%}

narginchk(2, 3);
nargoutchk(0, 2);

if nargin < 3 || isempty(mux)
    mux = 1;
end

% Calculate spectra



if nargout



end

