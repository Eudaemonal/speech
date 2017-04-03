function varargout = voiced_or_unvoiced(x0, fs )
% voiced/unvoiced & pitch
%{
INPUTS:
        x0 - Speech signal samples
        fs      - Sampling frequency (Hz)

ONPUTS:
        v_uv    - 1 if voiced, 0 if unvoiced
%}


frm_len = size(x0,1);

autocor=xcorr(x0);
[pk,ind]=findpeaks(autocor);
pitch_freq(1:frm_len)=mean(fs./diff(ind));

if(80<=pitch_freq(1:frm_len) & 350>=pitch_freq(1:frm_len))
	v_uv(1:frm_len)=1;    % voiced/unvoiced count
else
	v_uv(1:frm_len)=0;
end

 
 varargout = {v_uv};
 
end

