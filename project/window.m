function varargout = window( x0, len,offset, mode)
%WINDOW Summary of this function goes here
% take sample x0 and split it into iwndowed frames
%{
INPUTS:
        x0     - audio input
        len    - window length
        offset - overlap window coefficient (0-1)
        mode   - window type
ONPUTS:
        y      - windowed signal
%}
narginchk(2, 4);
nargoutchk(0, 1);

if nargin < 3 || isempty(offset)
    offset = 0.5;
end

if nargin < 4 || isempty(mode)
    mode = 'square';
end

w = ones(len,1);
switch mode
    case 'square' 
        w = ones(len,1);
    case 'hamming'
        w = hamming(len);

end

num = floor(length(x0)/(len*offset))-1;
y = zeros(num, len);

for i=1:num
   left = 1+(i-1)*len*offset;
   right = len+(i-1)*len*offset;

   y(i,:) = x0(left:right).*w;
end

varargout = {y};

end

