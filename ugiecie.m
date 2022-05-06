function [liniaUgiecia] = ugiecie(M, len)

    d_min = 36e-3; % [m]
    E = 205e9; % [Pa]
    I = pi()*(d_min.^4) / 64; % [m^4]
    EI_inv = 1/(E*I);
    
    M_double_integral = cumtrapz(cumtrapz(M.moment_g)) / (length(M.moment_g))^2;
    D_const = M_double_integral(2);
    C_const = - (D_const + M_double_integral((len.a + len.b)*len.f + 1)) / (len.a + len.b);
    
    liniaUgiecia = - EI_inv*(M_double_integral + C_const*len.total_len + D_const); 
    
end