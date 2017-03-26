function varargout = wavelet( x, frame_size, scale_sel)
%{
INPUTS:
        x          - Input samples
        frame_size - frame size for 
        scale_sel  - 

ONPUTS:
        spectrogram - 2D array for wavelet spectrogram

%}


% Perform error checking and set defaults if not passed in
narginchk(1, 3);
nargoutchk(0, 1);

if nargin < 2 || isempty(frame_size)
    frame_size = 256;
end

if nargin < 3 || isempty(scale_sel)
    scale_sel = 0;      
end

sample = x;

% Construct window function
L = frame_size;
w = hamming(L);

frame_num = floor(size(sample, 1)/L*2);
spectrogram = zeros(frame_num,L);

for i = 1:frame_num-1
    offset = (i-1)*L/2;
    spectrogram(i,:) = abs(fft(sample(1+offset:offset+L).*w));
    
    
end

    if nargout==0
        mesh(spectrogram)
    else
        varargout = {spectrogram};
    end

end
