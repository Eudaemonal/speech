function [ y ] = myfft( x )
%FFT Summary of this function goes here
%   Detailed explanation goes here
    N=length(x);
    y=zeros(1,N);
    Sum=0;
	for k=1:nfft
        for j=1:N
            Sum=Sum+x(j)*exp(-2*pi*1i*(j-1)*(k-1)/nfft);
        end
        y(k)=Sum;
	Sum=0;% Reset
	end

end

