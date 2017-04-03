function varargout = pitch_contour( x0, fs, frame_size )
%PITCH_CONTOUR Summary of this function goes here
%   Detailed explanation goes here
%{
INPUTS:
        x0    - Speech signal samples
        fs    - Sampling frequency (Hz)
        frame_size - Window length (default: 256)

ONPUTS:
        varargout - pitch contour
%}
narginchk(2, 3);
nargoutchk(0, 2);

if nargin < 3 || isempty(frame_size)
    frame_size = 256;
end

frame_num = floor(size(x0,1)/(frame_size/2));
pitch_contour=  zeros(1,frame_num-1);



for i = 1:frame_num-1
    % offset is half frame size 
    offset = (i-1)*frame_size/2;
    
    frame = x0(1+offset:offset+frame_size);
    % v_uv = voiced_or_unvoiced(frame, fs);
    
    
    y = acf(frame,frame_size/2);
    
    % Change threshold to adjust
    [loc, ~] = peakfinder(y, (max(x0)-min(x0))/4, 0.4);
    
    if size(loc,1) >= 2 % && v_uv(i)==0
        pitch_contour(i) = fs/(loc(end) - loc(1));
    else
        pitch_contour(i) = 0;
    end
end

if nargout == 0
    plot(pitch_contour);
else
    varargout = {pitch_contour};
end

end

