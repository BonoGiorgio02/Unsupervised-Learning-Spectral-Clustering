function [lambda, v] = inverse_power_method(A, tol, max_iter)
    % Inputs:
    % A - symmetric matrix
    % tol - tolerance for convergence
    % max_iter - maximum number of iterations

    % Outputs:
    % lambda - smallest eigenvalue
    % v - corresponding eigenvector

    N = size(A, 1);
    v = rand(N, 1); % Random initial vector
    v = v / norm(v); % Normalize

    lambda = 0;
    for iter = 1:max_iter
        % Solve (A - mu*I) * z = v, where mu is close to the smallest eigenvalue
        z = A \ v; % Solve linear system
        v_next = z / norm(z); % Normalize

        % Compute Rayleigh quotient for eigenvalue approximation
        lambda_next = v_next' * A * v_next;

        % Check for convergence
        if abs(lambda_next - lambda) < tol
            lambda = lambda_next;
            v = v_next;
            return;
        end

        % Update for next iteration
        lambda = lambda_next;
        v = v_next;
    end

    error('Inverse Power Method did not converge');
end

