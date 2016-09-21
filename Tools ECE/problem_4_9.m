%Brian McIlwain
%Tools in ECE
%Problem 4.9 text

function [] = problem_4_9()
t = 0:.01:4;
plot(t,Is(Vs(t)).*1000);
xlabel('t (ms)')
ylabel('Is (mA)')
grid on
end

function y = Is(V)
y(-6<=V&V<=3) = V(-6<=V&V<=3).*0;
y(V>3) = (V(V>3)-3)./2000;
y(V<-6) = (V(V<-6)+6)./1000;
end

function [z] = Vs(t)
z = 10*square((t/2)*pi);
end