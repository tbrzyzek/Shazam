close all; clc;

% User selects a song to load in
waitfor(msgbox('Select a song sample.'))
[filename, pathname] = uigetfile('*.wav');


% Reads in an audio file
[clip, Fs] = audioread(filename);                      

% generates a random 10 second sample of music to identify
start = randi([0 floor(length(y)/Fs)-10],1,1)
stop = start+10;
z = clip(Fs*start+1:1:Fs*stop);

sound(z,Fs);                        % plays audio file
pause(10)
clear sound;

% OR SOMETHING SIMILAR TO THIS V
match = search(z, Fs);

%msgbox(['Match found! : ' songid{match}]);

% close afterwards



                         

% % define analysis parameters
% zlen = length(sample);                   % length of the signal
% wlen = 1024;                        % window length (recomended to be power of 2)
% hop = wlen/4;                       % hop size (recomended to be power of 2)
% nfft = 4096;                        % number of fft points (recomended to be power of 2)
% 
% % perform STFT
% [S, f, t] = stft(sample, wlen, hop, nfft, 8000);
% 
% % define the coherent amplification of the window
% K = sum(hamming(wlen, 'periodic'))/wlen;
% 
% % take the amplitude of fft(x) and scale it, so not to be a
% % function of the length of the window and its coherent amplification
% S = abs(S)/wlen/K;
% 
% % correction of the DC & Nyquist component
% if rem(nfft, 2)                     % odd nfft excludes Nyquist point
%     S(2:end, :) = S(2:end, :).*2;
% else                                % even nfft includes Nyquist point
%     S(2:end-1, :) = S(2:end-1, :).*2;
% end
% 
% % convert amplitude spectrum to dB (min = -120 dB)
% S = 20*log10(S + 1e-6);
