function [ recorder1 ] = record( sampleRate, bitDepth, numChannels, length )
%RECORD creates an audio recording 
    recorder1 = audiorecorder(sampleRate, bitDepth, numChannels);
    recordblocking(recorder1, length) % take 3 seconds of input
ends

