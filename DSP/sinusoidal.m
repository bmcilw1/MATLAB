%Brian McIlwain
%DSP Text M2.4

function [ x ] = sinusoidal(A, w, phase, L)
% x[n] = A sin(omega * n + phase)
%   L: Length of vector x, A: Amplitude, w: angular frequency [0, 2pi],
%   phase[0, 2pi]

t = 0:1:L;
x = A * sin(w*t + phase);
end