function [num_connected_components] = num_connect_comp(L)
%The number of connected components in the graph corresponds to the number of zero eigenvalues of LL.
%Number of connected components=Multiplicity of eigenvalue 0
[~, eigenvalues] = eigs(L); % Autovalori più piccoli
num_connected_components = sum(sum(eigenvalues < 1e-10));
end

