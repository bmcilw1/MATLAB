function [ recorder1 ] = record( sampleRate, bitDepth, length )
%RECORD creates an audio recording 
recorder1 = audiorecorder(sampleRate, bitDepth, length);
end

