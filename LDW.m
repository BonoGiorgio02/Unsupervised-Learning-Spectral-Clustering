function [L,D,W] = LDW(W)
%. Construct the degree matrix D and the Laplacian matrix L = D − W .
%The sparse format storage for the matrices W , D and L is strongly preferable
W=sparse(W);
D = spdiags(sum(W,2), 0, size(W, 1), size(W, 2)); % Create diagonal matrix (sparse)
% sum(W,2) is the sum over the row

% Step 2: Compute the Laplacian Matrix L
L = D - W;
end

