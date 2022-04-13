function A = testMatrixGenerator(p)
    % Funkcja zwracająca macierz (n x n) spełniającą warunki zadania
    %
    % autorzy: Julia Kaznowska, Piotr Wilczyński
    % PW, MiNI, IiAD, MN
    %
    % INPUT:
    %   p <- 1/3 rozmiaru generowanej macierzy
    % OUTPUT:
    %   A <- macierz A(n x n) spełniająca założenia zadania
    
    % losuj macierz dopóki nie będzie zbieżna dla metody SOR
    while(1)
        % wylosuj macierz symetryczną o danych wymiarach i losowych
        % wartościach własnych z predziału (0, 1)
        A = sprandsym(3*p, 1, rand(1, 3*p));

        % zmień bloki (p x p) w lewym dolnym rogu macierzy i prawym górnym
        % rogu macierzy na macierze zerowe
        A(1:p, (2*p+1):(3*p)) = zeros(p);
        A((2*p+1):(3*p), 1:p) = zeros(p);
        
        % zmień bloki na diagonali na A11
        A11 = A(1:p, 1:p);
        A((p+1):(2*p), (p+1):(2*p)) = A11;
        A((2*p+1):(3*p), (2*p+1):(3*p)) = A11;
        
        % jeśli promień spektralny macierzy iteracji dla w=1 jest mniejszy
        % od jeden wyjdź z pętli i zwróć tę macierz
        [A11, A12, A23] = matrixDivision(A);
        if(max(abs(eig(iterationMatrix(A11, A12, A23, 1)))) < 1)
            break;
        end
    end
end
