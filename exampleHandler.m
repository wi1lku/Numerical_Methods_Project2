function [W, T, RO] = exampleHandler(A, b)
% Funkcja rozwiązująca Ax = b dla różnych wartości w i 
% wyznaczająca optymalny współczynnik relaksacji
%
% autorzy: Julia Kaznowska, Piotr Wilczyński
% PW, MiNI, IiAD, MN
%
% INPUT:
%   A <- macierz A
%   b <- wektor b
% OUTPUT:
%   W <- tablica współczynników relaksacji
%   T <- tablica liczby iteracji
%   RO <- tablica wyliczonych promieni spektralnych

n = size(A,1);
T = zeros(1, 100);
RO = zeros(1, 100);
wopt = -1;
steps_min = 1000;
for i = 2:99
    W = linspace(0, 2, 100);
    [tempX, tempRo, tempS] = main(A, b, W(i));
    T(i) = tempS;
    RO(i) = tempRo;
    if(tempS < steps_min)
        wopt = W(i);
        steps_min = tempS;
    end
end

disp("Optymalne w:")
disp(wopt)

% "wzorowe" rozwiązanie
Xwzor = A\b;

% odchylenie standardowe dla w = wopt
[Xsor, ro, t] = main(A, b, wopt);
odchylenie = sqrt(sum((Xwzor-Xsor).^2)/n);

disp("Liczba iteracji przy optymalnym w: ")
disp(t)

disp("Odchylenie standardowe: ")
disp(odchylenie)

end