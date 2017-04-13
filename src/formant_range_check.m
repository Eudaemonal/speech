function y = formant_range_check( freq, index )
%FORMAT_RANGE_CHECK Summary of this function goes here
%{
INPUTS:
        freq  - Formant frequency for checking (Hz)
        index - Formant number

ONPUTS:
        varargout - pitch contour
%}
switch(index)
    case 1
        if(80<=freq & 1200>=freq)
            y = 1;
        else
            y = 0;
        end
        
    case 2
        if(80<=freq & 2400>=freq)
            y = 1;
        else
            y = 0;
        end        
    case 3
        if(80<=freq & 4000>=freq)
            y = 1;
        else
            y = 0;
        end        
        
    otherwise
        y = 0;
            
      
end

