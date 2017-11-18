function [ recorder1 ] = record( sampleRate, bitLength, numChannels )
%RECORD creates an audio recording 
    recorder1 = audiorecorder(sampleRate, bitLength, numChannels);
end

