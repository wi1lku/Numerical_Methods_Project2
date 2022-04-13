% EXAMPLE 1

% tworzenie macierzy
A11 = [0.2, 0.1; 0.1, 0.2];
A12 = [0.1, 0.1; 0.1, 0.1];
A23 = [0.1, 0.1; 0.1, 0.1];
p = size(A11,1);
O = zeros(p);
Example1 = [A11, A12, O;
            A12', A11, A23;
            O, A23', A11];

% wektor b
b = [0; 8; 1; 0; 0; 1];
[W, T, RO] = exampleHandler(Example1, b);

% wykres zależności liczby iteracji od w
plot(W(2:99), T(2:99))
% wykres zależności promienia spektralnego od w
plot(W(2:99), RO(2:99))

%%%%%%%%%%%%%%%%%%%%%%%

% EXAMPLE 2

% tworzenie macierzy
A11 = [4,1; 1, 4];
A12 = [0.05, 0.1; 0.6, 0.422];
A23 = [0.142, 0.555; 0.907, 0.29];
p = size(A11,1);
O = zeros(p);
Example2 = [A11, A12, O;
            A12', A11, A23;
            O, A23', A11];

% wektor b
b = [1:6]';


[W, T, RO] = exampleHandler(Example2, b);

% wykres zależności liczby iteracji od w
plot(W(2:99), T(2:99))
% wykres zależności promienia spektralnego od w
plot(W(2:99), RO(2:99))

%%%%%%%%%%%%%%%%%%%%%%%

% EXAMPLE 3

% tworzenie macierzy
A11 = [6, 1, 4; 1, 1, 1; 4, 1, 6];
A12 = [0.1, 0.3, 0.1; 0.15, 0.41, 0.33; 0.05, 0.1, 0.04];
A23 = [0.09, 0.3, 0.1422; 0.2137, 0.5, 0.4; 0.420, 0.515, 0.4114];
p = size(A11,1);
O = zeros(p);
Example3 = [A11, A12, O;
            A12', A11, A23;
            O, A23', A11];

% wektor b
b = [1:9]';


[W, T, RO] = exampleHandler(Example3, b);

% wykres zależności liczby iteracji od w
plot(W(2:99), T(2:99))
% wykres zależności promienia spektralnego od w
plot(W(2:99), RO(2:99))

%%%%%%%%%%%%%%%%%%%%%%%

% EXAMPLE 4

% seed
rng(420);
% tworzenie macierzy
Example4 = full(testMatrixGenerator(3));

% wektor b
b = [1:9]';
[W, T, RO] = exampleHandler(Example4, b);

% wykres zależności liczby iteracji od w
plot(W(2:99), T(2:99))
% wykres zależności promienia spektralnego od w
plot(W(2:99), RO(2:99))

%%%%%%%%%%%%%%%%%%%%%%%

% EXAMPLE 5

% seed
rng(42);
% tworzenie macierzy
Example5 = full(testMatrixGenerator(10));

% wektor b
b = rand(30,1);
[W, T, RO] = exampleHandler(Example5, b);

% wykres zależności liczby iteracji od w
plot(W(2:99), T(2:99))
% wykres zależności promienia spektralnego od w
plot(W(2:99), RO(2:99))

%%%%%%%%%%%%%%%%%%%%%%%

% EXAMPLE 6

% seed
rng(1337);
% tworzenie macierzy
Example6 = full(testMatrixGenerator(100));

% wektor b
b = rand(300,1);
[W, T, RO] = exampleHandler(Example6, b);

% wykres zależności liczby iteracji od w
plot(W(2:99), T(2:99))
% wykres zależności promienia spektralnego od w
plot(W(2:99), RO(2:99))