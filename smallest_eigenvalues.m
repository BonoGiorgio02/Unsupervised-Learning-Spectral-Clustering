function [eigenvalues, eigenvectors] = smallest_eigenvalues(A, M)
    % Inputs:
    % A - symmetric matrix
    % M - number of smallest eigenvalues to compute
    tol=1e-6;
    max_iter=100;
    
    % Outputs:
    % eigenvalues - vector of the M smallest eigenvalues
    % eigenvectors - matrix of corresponding eigenvectors (columns)
    
    N = size(A, 1);
    eigenvalues = zeros(M, 1);
    eigenvectors = zeros(N, M);

    % Iterate to find M eigenvalues
    for k = 1:M
        % Step 1: Use Inverse Power Method to find smallest eigenvalue
        [lambda, v] = inverse_power_method(A, tol, max_iter);
        eigenvalues(k) = lambda;
        eigenvectors(:, k) = v;

        % Step 2: Deflation: Remove the contribution of the found eigenpair
        A = A - lambda * (v * v');
    end
end
