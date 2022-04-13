function L = cholskyBanachiewicz(A)
    % Funkcja zwracająca macierz L, będącą macierzą dolnotrójkątną rozkładu
    % Cholsky'ego-Banachiewicza macierzy A = LL^T
    %
    % autorzy: Julia Kaznowska, Piotr Wilczyński
    % PW, MiNI, IiAD, MN
    %
    % INPUT:
    %   A <- macierz symetryczna i dodatnio określona
    % OUTPUT:
    %   L <- macierz dolnotrójkątna

    n = size(A, 1);
    L = zeros(n);

    % algorytm wyznaczania elementów macierzy L rozkładu
    % Chlosky'ego-Banachiewicza LL^T
    for k = 1:n
        L(k, k) = sqrt(A(k,k) - sum(L(k, 1:(k-1)).^2));
        for i = (k+1):n
            L(i, k) = (A(i, k) - sum(L(i, 1:(k-1)).*L(k, 1:(k-1))))/L(k, k);
        end
    end
end
