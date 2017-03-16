function varargout = frame_fft( x, start_idx, frame_size )
%{
INPUTS:
        x          - Input samples
        start_idx  - start index of sample for fft
        frame_size - frame size for fft

ONPUTS:
        frame_spectrum - magnitude of frame spectrum

%}

% Perform error checking and set defaults if not passed in
narginchk(1, 3);
nargoutchk(0, 1);


if nargin < 2 || isempty(start_idx)
    start_idx = 0;
end

if nargin < 3 || isempty(frame_size)
    frame_size = 255;
end



frame_sample = x(start_idx:start_idx+frame_size);
frame_spectrum = fft(frame_sample)


if nargout == 0
    plot(abs(frame_spectrum))
    grid on

else
    varargout = frame_spectrum
    
end


end

