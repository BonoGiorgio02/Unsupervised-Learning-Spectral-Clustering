function [W] = knn_graph(X,k,sigma)
    N = size(X, 1);
    W = zeros(N, N);
    
    % Trova i k vicini più prossimi per ogni punto
    for i = 1:N
        % Trova i k vicini più prossimi usando knnsearch
        [idx, dist] = knnsearch(X, X(i, :), 'K', k); % +1 per includere il punto stesso
        % Imposta la matrice di similarità (usiamo l'equazione della Gaussiana)
        for j = 2:k % Ignora il punto stesso
            W(i, idx(j)) = exp(-dist(j)^2 / (2 * sigma^2));
            W(idx(j), i) = W(i, idx(j)); % Grafo simmetrico
        end
    end
end

