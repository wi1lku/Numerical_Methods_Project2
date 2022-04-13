function Bsor = iterationMatrix(A11, A12, A23, w)
% Funkcja zwracająca macierz iteracji dla macierzy A
%
% autorzy: Julia Kaznowska, Piotr Wilczyński
% PW, MiNI, IiAD, MN
%
% INPUT:
%   A11, A12, A23 <- bloki A11, A12, A23 macierzy, dla której chcemy wyznaczyć macierz
%        iteracji
% OUTPUT:
%   w <- parametr relaksacji

p = size(A11, 1);
L = cholskyBanachiewicz(A11);

% obliczenie bloków macierzy iteracji
% na podstawie układów równań zawartych w raporcie

% X11
tempM = (1-w)*A11;
X11 = getXBlock(tempM, L, p);

% X12
tempM = (-w)*A12;
X12 = getXBlock(tempM, L, p);

% X13
tempM = zeros(p);
X13 = getXBlock(tempM, L, p);

% X21
tempM = -w*A12'*X11;
X21 = getXBlock(tempM, L, p);

% X22
tempM = (1-w)*A11 - w*A12'*X12;
X22 = getXBlock(tempM, L, p);

% X23
tempM = -w*A23 - w*A12'*X13;
X23 = getXBlock(tempM, L, p);

% X31
tempM = -w*A23'*X21;
X31 = getXBlock(tempM, L, p);

% X32
tempM = -w*A23'*X22;
X32 = getXBlock(tempM, L, p);

% X33
tempM = (1-w)*A11 - w*A23'*X23;
X33 = getXBlock(tempM, L, p);


Bsor = [X11, X12, X13; X21, X22, X23; X31, X32, X33];

end
