%Brian McIlwain
%Tools in ECE
%Problem 4.10 text

function [] = problem_4_10()
Vgs = [2 2.5 3];
scatter(Vgs,Ids(Vgs));
xlabel('Vgs (V)')
ylabel('Ids (mA)')
grid on
end

function y = Ids(Vgs)
y = 4*(Vgs-.8).^2;
end