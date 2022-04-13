function [A11, A12, A23] = matrixDivision(A)
    % Funkcja wyznacza bloki A_{11}, A_{12}, A_{23} macierzy A(n x n)
    % w postaci:
    %     | A11 A12 A13 |
    % A = | A21 A22 A23 |
    %     | A31 A32 A33 |,
    % gdzie każdy blok jest (p x p) 
    %
    % autorzy: Julia Kaznowska, Piotr Wilczyński
    % PW, MiNI, IiAD, MN
    %
    % INPUT:
    %   A <- macierz A postaci jak wyżej
    % OUTPUT:
    %   A11 <- blok A11
    %   A12 <- blok A23
    %   A23 <- blok A23

    p = size(A, 1)/3;
    A11 = A(1:p, 1:p);
    A12 = A(1:p, (p+1):(2*p));
    A23 = A((p+1):(2*p), (2*p+1):(3*p));
end
