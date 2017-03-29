function varargout = stft( x, fs, frame_size, scale_sel)
%{
INPUTS:
        x          - Input samples
        fs         - sampling frequency
        frame_size - frame size for stft
        scale_sel  - 0 if normal scale, 1 to semi-log y

ONPUTS:
        spectrogram - 2D array for stft spectrogram

%}


% Perform error checking and set defaults if not passed in
narginchk(2, 4);
nargoutchk(0, 1);

if nargin < 3 || isempty(frame_size)
    frame_size = 256;
end


if nargin < 4 || isempty(scale_sel)
    scale_sel = 0;      
end

sample = x;

% Construct window function
L = frame_size;
w = hamming(L);

frame_num = floor(size(sample, 1)/L*2);
spectrogram = zeros(frame_num,fs);

for i = 1:frame_num-1
    offset = (i-1)*L/2;
    spectrogram(i,:) = abs(fft(sample(1+offset:offset+L).*w, fs));

end

    if nargout==0
        mesh(spectrogram);

    else
        varargout = {spectrogram};
    end

end
