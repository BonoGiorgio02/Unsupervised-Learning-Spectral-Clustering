function [v, lambda] = inverse_power_method(A)
    % A: Matrice per il quale trovare l'autovalore più piccolo
    % max_iter: Numero massimo di iterazioni
    % tol: Tolleranza per la convergenza

    max_iter=100;
    tol=1e-6;

    n = size(A, 1);
    v = rand(n, 1);         % Vettore casuale iniziale
    v = v / norm(v);       % Normalizzazione

    for i = 1:max_iter
        % Risolvi il sistema (A - lambda I)v = b per il vettore v
        w = A \ v;          % Risoluzione di A*v = w
        lambda = norm(w);   % Autovalore corrispondente
        v = w / lambda;     % Nuovo autovettore normalizzato
        
        if norm(A * v - lambda * v) < tol  % Controllo di convergenza
            break;
        end
    end
end