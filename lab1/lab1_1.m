% EE9723 Lab 1

% Read speech file
% Plot samples
s = load('../Speech samples/speech.mat');
sample = s.speech;


freq = linspace(0,8000,256);

%1600 - 2000
%2000 - 2250
%2250 - 2500

mode = 2;
switch(mode)
    case 1
        plot(sample);
        grid on;

        size(sample,1)
        
    case 2
        % Select unvoiced frame
        offset1 = 255;
        start_idx1 = 3300;

        frame_sample1 = sample(start_idx1:start_idx1+offset1);
        frame_spectrum1 = fft(frame_sample1);

        % Select voiced frame
        offset2 = 255;
        start_idx2 = 1800;

        frame_sample2 = sample(start_idx2:start_idx2+offset2);
        frame_spectrum2 = fft(frame_sample2)

        plot(freq, abs(frame_spectrum1),freq, abs(frame_spectrum2))
        legend('Unvoiced','Voiced')
        grid on
        xlabel('Frequency (Hz)')
        ylabel('Magnitude ')
        
    case 3
        s = load('../Speech samples/myspeech.mat');
        sample = s.sample;

        % Select unvoiced frame
        offset1 = 255;
        start_idx1 = 5800;

        frame_sample1 = sample(start_idx1:start_idx1+offset1);
        frame_spectrum1 = fft(frame_sample1);

        % Select voiced frame
        offset2 = 255;
        start_idx2 = 4000;

        frame_sample2 = sample(start_idx2:start_idx2+offset2);
        frame_spectrum2 = fft(frame_sample2);

        plot(freq, abs(frame_spectrum1),freq, abs(frame_spectrum2))
        legend('Unvoiced','Voiced')
        grid on
        xlabel('Frequency (Hz)')
        ylabel('Magnitude ')


    case 4
        s = load('../Speech samples/myspeech.mat');
        sample = s.sample;
        
        soundsc(sample)
end





