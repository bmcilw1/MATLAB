%Brian McIlwain
%DSP
%Problem 2.8 text

function [] = DSP2_8()
Va = [1 -1 1];
AnsA = conv(Va,Va)

Vb = [1 -1 0 1 -1];
AnsB = conv(Vb,Vb)

Vc = [-1 2 0 -2 1];
AnsC = conv(Vc, Vc)
end