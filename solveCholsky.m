function x = solveCholsky(L, b)
    % Funkcja rozwiązująca układ równań LL^Tx = b, gdzie macierz L jest
    % macierzą dolnotrójkątną.
    %
    % autorzy: Julia Kaznowska, Piotr Wilczyński
    % PW, MiNI, IiAD, MN
    %
    % INPUT:
    %   L <- macierz dolnotrójkątna
    %   b <- wektor b
    % OUTPUT:
    %   x <- wektor będący rozwiązaniem układu równań LL^Tx = b

    n = size(b, 1);
    y = zeros(n, 1);
    x = zeros(n, 1);

    % rozwiązanie Ly = b
    for i = 1:n
        y(i) = b(i);
        for j=1:(i-1)
            y(i) = y(i) - L(i,j)*y(j);
        end
        y(i) = y(i)/L(i,i);
    end
    
    % rozwiązanie L^Tx = y
    LT = transpose(L);
    for i = n:-1:1
        x(i) = y(i);
        for j = n:-1:(i+1)
            x(i) = x(i) - LT(i,j)*x(j);
        end
        x(i) = x(i)/L(i,i);
    end

end
