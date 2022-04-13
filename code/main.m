function [X, ro, steps] = main(A, b, w)
    % Funkcja rozwiązująca układ równań liniowych Ax = b blokową metodą SOR
    % z współczynnikiem relaksacji w oraz wyznaczająca promień spektralny
    % macierzy iteracji dla tej metody.
    %
    % Macierz A(n x n) jest postaci:
    %     | A11 A12  0  |
    % A = | A21 A11 A23 |
    %     |  0  A32 A11 |,
    % A21 = A12^T oraz A32 = A23^T, A11 jest symetryczna i dodatnio
    % określona
    % bloki A11, A12, A23 są wymiarów (p x p), gdzie p = n/3
    %
    % autorzy: Julia Kaznowska, Piotr Wilczyński
    % PW, MiNI, IiAD, MN
    %
    % INPUT:
    %   A <- macierz A
    %   b <- wektor b
    %   w <- współczynnik relaksacji
    % OUTPUT:
    %   X <- rozwiązanie układu równań Ax = b
    %   ro <- promień spektralny macierzy iteracji
    %   steps <- liczba wykonanych iteracji

    % ustalenie maksymalnej liczby iteracjii
    MAX_REPETITIONS_NUMBER = 1000;
    steps = 0;

    n = size(A, 1);
    p = n/3;

    % podział macierzy na A na bloki A11, A12, A23, określone w treści
    % zadania
    [A11, A12, A23] = matrixDivision(A);

    % rozkład Cholsky'ego-Banachiewicza macierzy A11
    LA11 = cholskyBanachiewicz(A11);
    
    % wyznaczenie b_1, b_2, b_3
    B1 = b(1:p);
    B2 = b((p+1):2*p);
    B3 = b((2*p+1):3*p);
    
    % ustal początkowy wektor x^(0) jako wektor zerowy
    X1new = zeros(n/3, 1);
    X2new = zeros(n/3, 1);
    X3new = zeros(n/3, 1);
    
    % ITERACJA
    for q = 1:MAX_REPETITIONS_NUMBER
        
        % przypisz do zmiennych Xiold wartości wektorów x_1, x_2, x_3 z
        % poprzedniej iteracji 
        X1old = X1new;
        X2old = X2new;
        X3old = X3new;
        
        % wyznacz x^(k+1)
        X1new = (1-w)*X1old + w*solveCholsky(LA11, B1-A12*X2old);
        X2new = (1-w)*X2old + w*solveCholsky(LA11, B2-transpose(A12)*X1new-A23*X3old);
        X3new = (1-w)*X3old + w*solveCholsky(LA11, B3-transpose(A23)*X2new);
        
        % sprawdź czy spełniony jest warunek stopu (warunek Gilla)
        if(conditionGill([X1old; X2old; X3old], [X1new; X2new; X3new]))
            break;
        end
        steps = steps + 1;
    end
    
    % wypisz rozwiązanie układu równań i wykonaną liczbę iterajci
%     disp("Rozwiązanie Ax = b:");
    X = [X1new; X2new; X3new];
%     disp(X);
%     disp("Liczba iteracji: " + steps)

    % wyznacz macierz iteracji
    B = iterationMatrix(A11, A12, A23, w);
    
    % wyznacz i wypisz promień spektralny
%     disp("Promień spektralny macierzy iteracji:");
    ro = max(abs(eig(B))); 
%     disp(ro);

end
