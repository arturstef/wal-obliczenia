function [moment_xy, moment_xz, moment_g, moment_s, moment_zr]  = momenty(len, F, reakcja)

    moment_xy = zeros(1, length(len.total_len));
    moment_xz = zeros(1, length(len.total_len));
    
    moment_xy(1, 1:len.f*len.a) = -reakcja.Va_xy.*(1/len.f:1/len.f:len.a);
    moment_xy(1, len.f*len.a:len.f*(len.a + len.b)) = ...
    -reakcja.Va_xy.*(len.a:1/len.f:len.b + len.a) + F.F1_t.*((len.a:1/len.f:len.b + len.a) - len.a);
    moment_xy(1, len.f*(len.a + len.b):len.f*len.c) = F.F2_r.*(len.c - (len.b + len.a:1/len.f:len.c));
    
    moment_xz(1, 1:len.f*len.a) = reakcja.Va_xz.*(1/len.f:1/len.f:len.a);
    moment_xz(1, len.f*len.a:len.f*(len.a + len.b)) = ...
    reakcja.Va_xz.*(len.a:1/len.f:len.b + len.a) - F.F1_r.*((len.a:1/len.f:len.b + len.a) - len.a);
    moment_xz(1, len.f*(len.a + len.b):len.f*len.c) = -F.F2_t.*(len.c - (len.b + len.a:1/len.f:len.c));
    
    moment_g = sqrt(moment_xy.^2 + moment_xz.^2);
    
    moment_s = zeros(1, length(len.total_len));
    moment_s(1, len.f*len.a:len.f*len.c + 1) = len.r_2*F.F2_t;
    
    moment_zr = sqrt(moment_g.^2 + (3/4)*moment_s.^2);
    
end
