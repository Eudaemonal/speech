function varargout = formant_contour(x0, fs, frm_len, sel)
%formant_CONTOUR Summary of this function goes here
%{
INPUTS:
        x0    - Speech signal samples
        fs    - Sampling frequency (Hz)
        frm_len - Window length (default: 256)
        sel
ONPUTS:
        varargout - pitch contour
%}

% default filter order: 32
p=32;  %filter order

narginchk(2, 4);
nargoutchk(0, 1);

if nargin < 3 || isempty(frm_len)
    frm_len = 256;
end
if nargin < 4 || isempty(sel)
    frm_len = 0;
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

%mesh(formant_model)
%figure
formant_contour = zeros(size(formant_model, 1), 3);

for i=1:size(formant_model, 1)
    spec = formant_model(i,:);
    [loc, mag] = peakfinder(spec,(max(spec)-min(spec))/24,-3);

    if size(loc,2)>=3 
        if(formant_range_check(loc(1),1) && formant_range_check(loc(2),2) && formant_range_check(loc(3),3))
        
        for j=1:3
        formant_contour(i,j)=loc(j);
        end
        else
            for j=1:3
            formant_contour(i,j)=0;
            end           
        end
    else
        for j=1:3
        formant_contour(i,j)=0;
        end
    end
end


if nargout == 0
    if sel == 0
    map = stft(x0, fs, frm_len, 0);
    mesh(map)
    axis xy; axis tight; colormap(jet); view(0,90);
    hold on
    z = repmat(64,1,size(formant_contour, 1));
    plot3(formant_contour(:,1),1:size(formant_contour, 1),z,'ro','LineWidth',3)
    plot3(formant_contour(:,2),1:size(formant_contour, 1),z,'yo','LineWidth',3)
    plot3(formant_contour(:,3),1:size(formant_contour, 1),z,'go','LineWidth',3)
    legend('','1st Formant','2nd Formant','3rd Formant')
    else
    mesh(formant_model)
    axis xy; axis tight; colormap(jet); view(0,90);
    hold on
    z = repmat(64,1,size(formant_contour, 1));
    plot3(formant_contour(:,1),1:size(formant_contour, 1),z,'ro','LineWidth',3)
    plot3(formant_contour(:,2),1:size(formant_contour, 1),z,'yo','LineWidth',3)
    plot3(formant_contour(:,3),1:size(formant_contour, 1),z,'go','LineWidth',3)
    legend('','1st Formant','2nd Formant','3rd Formant')       
    end
else
    
end
    varargout = {formant_contour};
end

