function bit = conditionGill(Xold, Xnew)
    % Funkcja sprawdzająca czy dane na wejściu wektory Xold i Xnew
    % spełniają warunek gilla z parametrami
    % d1 = 10^(-10)
    % d2 = 10^(-20)
    %
    % autorzy: Julia Kaznowska, Piotr Wilczyński
    % PW, MiNI, IiAD, MN
    %
    % INPUT:
    %   Xold <- wektor x^(k)
    %   Xnew <- wektor x^(k+1)
    % OUTPUT:
    %   bit <- zmienna logiczna, zawierająca informację o tym, czy został
    %   spełniony warunek Gilla
    
    % ustalenie parametrów
    d1 = 10^(-10);
    d2 = 10^(-20);

    % warunek Gilla
    bit = normEuklides(Xnew-Xold) < d1*normEuklides(Xold)+d2;
    
end
