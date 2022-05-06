function [katSkrecenia] = skrecenie(M, wal)

    d = wal(:, 2) / 1000; % zamiana na metry
    I = (pi()*d.^4) / 32;
    v = .3;
    G = 205e9 / (2*(1 + v));
    l_over_I = ((wal(:, 1) / 1000) ./ I)';
    Ms = zeros(1, length(wal(:, 1)));
    Ms(3:end) = M.moment_s(end);
    katSkrecenia = sum(Ms.*l_over_I) / G;
    
end