function [ recorder1 ] = record( sampleRate, bitDepth, length, message)
%RECORD creates an audio recording 
    h = waitbar(0,message);
    steps = 1000;
    for step = 1:steps
        % computations take place here
        waitbar(step / steps)
    end
    close(h) 
    recorder1 = audiorecorder(sampleRate, bitDepth, 1, message);
    recordblocking(recorder1, length) % take 3 seconds of input
ends

