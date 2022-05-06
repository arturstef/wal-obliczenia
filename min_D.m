function [minimum_D, max_D]  = min_D(s, M)
    
    minimum_D = ((32*M.moment_zr)/(pi*s.kg)).^(1/3);
    max_D = max(minimum_D);
    
end