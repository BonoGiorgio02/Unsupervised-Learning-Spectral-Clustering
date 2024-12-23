function [x, lambda_old] = inverse_power_method(A)
% INVERSE_POWER_METHOD Trova il più piccolo autovalore e il corrispondente autovettore
% di una matrice A usando il metodo della potenza inversa.

    % Parametri per la convergenza
    tol = 1e-10; % Tolleranza
    maxIter = 1000; % Numero massimo di iterazioni
    
    mu = 1e-4;

    if ~issparse(A)
        error('La matrice di input deve essere sparsa.');
    end

    n = size(A, 1);
    x = rand(n, 1);
    x = x / norm(x);
    lambda_old = 0;
    I = speye(n); % Matrice identità sparsa
    B = A - mu * I;

    for iter = 1:maxIter
        y = B \ x;
        eigvec = y / norm(y);
        eigval = eigvec' * A * eigvec;

        if abs(eigval - lambda_old) < tol
            break;
        end

        lambda_old = eigval;
        x = eigvec;
    end

    if iter == maxIter
        warning('Il metodo non ha converguto entro il numero massimo di iterazioni.');
    end
end
