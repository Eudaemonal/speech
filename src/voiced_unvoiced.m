function varargout = voiced_unvoiced_frame(x0, fs,frm_len )
% voiced/unvoiced & pitch
%{
INPUTS:
        x0 - Speech signal samples
        fs - Sampling frequency (Hz)
        frm_len - frame length

ONPUTS:
        v_uv    - 1 if voiced, 0 if unvoiced
%}


narginchk(2, 3);
nargoutchk(0, 1);

if nargin < 3 || isempty(frm_len)
    frm_len = 256;
end


n=frm_len-1;
v_uv = zeros(length(x0),1);
for frm=1:frm_len:(length(x0)-frm_len)
    y=x0(frm:frm+n);
      
    v_uv(frm:(frm+n)) = voiced_unvoiced_frame(y, fs);

 end
 
 varargout = {v_uv};
 
 
end