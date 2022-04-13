function val = normEuklides(X)
    % Funkcja wyliczająca normę euklidesową wektora X
    %
    % autorzy: Julia Kaznowska, Piotr Wilczyński
    % PW, MiNI, IiAD, MN
    %
    % INPUT:
    %   X <- wektor
    % OUTPUT:
    %   val <- norma euklidesowa wektora X

    val = sqrt(sum(X.^2));

end
