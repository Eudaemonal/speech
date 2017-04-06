function varargout = voiced_unvoiced_frame(x0, fs )
% voiced/unvoiced & pitch
%{
INPUTS:
        x0 - Speech signal samples
        fs - Sampling frequency (Hz)

ONPUTS:
        v_uv    - 1 if voiced, 0 if unvoiced
%}


frm_len = length(x0);

autocor=xcorr(x0);
[pk,ind]=findpeaks(autocor);
pitch_freq(1:frm_len)=mean(fs./diff(ind));

if(80<=pitch_freq(1:frm_len) & 1350>=pitch_freq(1:frm_len))
	v_uv(1:frm_len)=1;    % voiced/unvoiced count
else
	v_uv(1:frm_len)=0;
end

 
 varargout = {v_uv};
 
end

