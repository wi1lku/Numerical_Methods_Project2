function X = getXBlock(M, L, p)
    % Funkcja zwracająca blok macierzy iteracji wyznaczona z układu równań
    % zawartego w raporcie
    % 
    % autorzy: Julia Kaznowska, Piotr Wilczyński
    % PW, MiNI, IiAD, MN
    %
    % INPUT:
    %   M <- macierz spełniająca równanie LL^TX = M
    %   L <- macierz trójkątna dolna, wykorzystywana w rozkładzie LL^T
    %   p <- liczba wierszy (i kolumn) wynikowego bloku X
    
    % OUTPUT:
    %   X <- blok macierzy iteracji
    
    X = zeros(p);
    for i=1:p
        x = solveCholsky(L, M(:, i));
        X(:, i) = x;
    end
end