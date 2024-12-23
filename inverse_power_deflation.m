function [eigenvalues, eigenvectors] = inverse_power_deflation(L, M)
    % L: Matrice di input
    % M: Numero di autovalori/autovettori più piccoli da trovare
    % max_iter: Numero massimo di iterazioni
    % tol: Tolleranza per la convergenza
    max_iter=100;
    tol=1e-6;
    n = size(L, 1);
    eigenvalues = zeros(M, 1);       % Vettore per gli autovalori
    eigenvectors = zeros(n, M);      % Matrice per gli autovettori
    
    % Inizializzazione
    L_curr = L;                     % Inizialmente, la matrice L è quella originale
    for k = 1:M
        % 1. Trova il minimo autovalore tramite il metodo dell'inversa potenza
        [v, lambda] = inverse_power_method(L_curr);
        eigenvalues(k) = lambda;     % Assegna l'autovalore trovato
        
        % 2. Normalizza l'autovettore trovato
        eigenvectors(:, k) = v / norm(v); 
        
        % 3. Deflessione della matrice L
        % Deflessione della matrice per rimuovere l'autovalore appena trovato
        L_curr = L_curr - lambda * (v * v');
    end
end