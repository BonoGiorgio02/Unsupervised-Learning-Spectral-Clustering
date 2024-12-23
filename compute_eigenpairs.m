function [eigenvectors, eigenvalues] = compute_eigenpairs(A, num_eigenvalues)
% COMPUTE_EIGENPAIRS Calcola i più piccoli autovalori e autovettori di una
% matrice A usando il metodo della potenza inversa con deflazione.

    % Controllo se la matrice è quadrata
    [n, m] = size(A);
    if n ~= m
        error('La matrice A deve essere quadrata.');
    end

    % Preallocazione per autovalori e autovettori
    eigenvectors = zeros(n, num_eigenvalues);
    eigenvalues = zeros(num_eigenvalues, 1);

    % Copia della matrice per la deflazione
    A_copy = A;

    for i = 1:num_eigenvalues
        % Trova il più piccolo autovalore e autovettore della matrice aggiornata
        [v, lambda] = inverse_power_method(A_copy);

        % Salva i risultati
        eigenvectors(:, i) = v;
        eigenvalues(i) = lambda;

        % Applica la deflazione
        A_copy = A_copy - sparse((lambda) * (v * v'));
    end
end
