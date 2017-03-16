% EE9723 Lab 1

% Read speech file
% Plot samples
s = load('../Speech samples/speech.mat');
sample = s.speech;


freq = linspace(0,8000,256);

%1600 - 2000
%2000 - 2250
%2250 - 2500

mode = 3;
switch(mode)
    case 1
        plot(sample);
        grid on;

        size(sample,1)
        
    case 2
        % Select unvoiced frame
        offset = 255;
        start_idx = 2200;

        frame_sample = sample(start_idx:start_idx+offset);
        frame_spectrum = fft(frame_sample)

        plot(freq, abs(frame_spectrum))
        grid on
        title('Unvoiced frame magnitude spectrum')
        xlabel('Frequency (Hz)')
        ylabel('Magnitude (dB)')
        
    case 3
        % Select voiced frame
        offset = 255;
        start_idx = 2500;

        frame_sample = sample(start_idx:start_idx+offset);
        frame_spectrum = fft(frame_sample)

        plot(freq, abs(frame_spectrum))
        grid on
        title('Voiced frame magnitude spectrum')
        xlabel('Frequency (Hz)')
        ylabel('Magnitude (dB)')
        
    case 4
        % Voice Recoder
        s = load('../Speech samples/myspeech.mat');
        sample = s.sample;

        % Select unvoiced frame
        offset = 255;
        start_idx = 4000;

        frame_sample = sample(start_idx:start_idx+offset);
        frame_spectrum = fft(frame_sample)

        semilogy(freq, abs(frame_spectrum))
        grid on
        title('Unvoiced frame magnitude spectrum')
        xlabel('Frequency (Hz)')
        ylabel('Magnitude (dB)')
        
        
    case 5  
        s = load('../Speech samples/myspeech.mat');
        sample = s.sample;
        
        offset = 255;
        start_idx = 4200;

        frame_sample = sample(start_idx:start_idx+offset);
        frame_spectrum = fft(frame_sample)

        plot(freq, abs(frame_spectrum))
        grid on
        title('Voiced frame magnitude spectrum')
        xlabel('Frequency (Hz)')
        ylabel('Magnitude (dB)')
        
        
        
    case 6
        s = load('../Speech samples/myspeech.mat');
        sample = s.sample;
        
        soundsc(sample)
        
    case 7        
        recObj = audiorecorder

        disp('Start speaking.')
        recordblocking(recObj, 1);
        disp('End of Recording.');

        sample = getaudiodata(recObj);
        
        plot(sample)      
end

