function Hd = highpasscheby1
%HIGHPASSBUTTERWORTH Returns a discrete-time filter object.

% MATLAB Code
% Generated by MATLAB(R) 24.1 and DSP System Toolbox 24.1.
% Generated on: 01-Jun-2024 22:11:28

% Butterworth Highpass filter designed using FDESIGN.HIGHPASS.

% All frequency values are in Hz.
Fs = 1000;  % Sampling Frequency

Fstop = 1;           % Stopband Frequency
Fpass = 5;           % Passband Frequency
Astop = 45;          % Stopband Attenuation (dB)
Apass = 1;           % Passband Ripple (dB)
match = 'stopband';  % Band to match exactly

% Construct an FDESIGN object and call its BUTTER method.
h  = fdesign.highpass(Fstop, Fpass, Astop, Apass, Fs);
Hd = design(h, 'cheby1', 'MatchExactly', match);

% [EOF]
