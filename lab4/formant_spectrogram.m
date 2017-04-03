function varargout = formant_spectrogram(x0, fs, frm_len, p)
%FORMAT_SPECTRUM Summary of this function goes here
%   Detailed explanation goes here



narginchk(2, 4);
nargoutchk(0, 1);

if nargin < 3 || isempty(frm_len)
    frm_len = 256;
end

if nargin < 4 || isempty(frm_len)
    p = 10;
end
 %Coefficients and gain::(levinson-durbin method)
frm_num = floor(size(x0,1)/(frm_len/2));
formant_model = zeros(frm_num, fs/2);

for cnt = 1:frm_num-1
    offset = (cnt-1)*frm_len/2;
    y = x0(1+offset:offset+frm_len);
    
    coef_init=zeros(p+1);
    autocor=xcorr(y);
    R=autocor(((length(autocor)+1)./2):length(autocor));
    
    ep(1)=R(1);          
    for j=2:p+1
        tot=0;               
        for i=2:(j-1)
            tot=tot+coef_init(i,(j-1)).*R(j-i+1);
        end
        T(j)=(R(j)+tot)./ep(j-1);
        ep(j)=ep(j-1).*(1-(T(j)).^2);

        coef_init(j,j)= -T(j);
        coef_init(1,j)=1;
        for i=2:(j-1)
            coef_init(i,j)=coef_init(i,(j-1))-T(j).*coef_init((j-i+1),(j-1));
        end
    end

    q=coef_init((1:j),j)';
    %----------------------------------------------------------------------
    [h,w] = freqz(1,q,fs/2);
    h = abs(h);
    % plot(h);
    % drawnow
    % F(count) = getframe(gcf);
    % h_f = flipud(h);
    formant_model(cnt,:)= 10*log(h');
    %----------------------------------------------------------------------
    num_co=length(q);
    y_estm=filter([0 -q(2:end)],1,y);    
    e=y-y_estm;  %% errors


end



if nargout == 0
    mesh(formant_model)
else
    varargout = {formant_model}
end


end

