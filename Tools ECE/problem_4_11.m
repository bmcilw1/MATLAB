%Brian McIlwain
%Tools in ECE
%Problem 4.11 text

function [] = problem_4_11()
w = [10 100 1000 1e4 1e5];
plot(w,abs(Z(w)),'-o');
set(gca,'xscale','log')
xlabel('omega (rad/s)')
ylabel('Z (Ohms)')
grid on
end

function y = Z(w)
y = 100 + (w.*1j.*1e-3)./(1-w.^2.*1e-3.*10e-6);
end