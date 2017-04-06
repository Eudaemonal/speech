function [ varargout ] = spectra( x0, fs, mux)
%SPECTRA Summary of this function goes here
%   Detailed explanation goes here
%{
INPUTS:
        x0  - Input samples
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

N = length(x0);
K = fs;

% Perform K point dft
%{
xf = zeros(1,K);
for k=1:K
    for n=1:N
        xf(k)=xf(k)+x0(n).*exp(-1j.*2.*pi.*(n-1).*(k-1)./K); 
    end
end
%} 
xf = fft(x0,K);

% Magnitude of xf(w)
for i=1:K
xm(i)=abs(xf(i));
end
% Phase of xf(w)
for i=1:K
xp(i)=angle(xf(i));
end

if nargout == 0
    if mux == 1     % plot magnitude spectra
        plot(xm);
        title('Magnitude Spectra');
        xlabel('Frequency (Hz)');
        ylabel('Magnitude');
    elseif mux == 2 % plot phase spectra
        plot(xp);
        title('Phase Spectra');
        xlabel('Frequency (Hz)');
        ylabel('Phase');
   
    elseif mux == 3 % plot magnitude and phse spectra
        subplot(2,1,1);
        plot(xm);
        title('Magnitude Spectra');
        xlabel('Frequency (Hz)');
        ylabel('Magnitude');
        
        subplot(2,2,1);
        plot(xp);
        title('Phase Spectra');
        xlabel('Frequency (Hz)');
        ylabel('Phase');
    end
else
    varargout = {xm, xp};

end



end

