function [ recorder1 ] = record( sampleRate, bitDepth, length )
%RECORD creates an audio recording 
    recorder1 = audiorecorder(sampleRate, bitDepth, 1);
    recordblocking(recorder1, length) % take 3 seconds of input
ends

