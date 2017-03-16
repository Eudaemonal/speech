function fft_plot( frame_sample )
%FFT_PLOT Summary of this function goes here
%   Detailed explanation goes here
    frame_spectrum = fft(frame_sample)

    semilogy(abs(frame_spectrum))
    grid on
    xlabel('Frequency (Hz)')
	ylabel('Magnitude (dB)')

end

