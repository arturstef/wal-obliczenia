function [tnace_xy, tnace_xz]  = silyTnace(len, F, reakcja)

    tnace_xy = zeros(1, length(len.total_len));
    tnace_xz = zeros(1, length(len.total_len));
    
    tnace_xy(1, 1:len.f*len.a) = -reakcja.Va_xy;
    tnace_xy(1, len.f*len.a:len.f*(len.a + len.b)) = -reakcja.Va_xy + F.F1_t;
    tnace_xy(1, len.f*(len.a + len.b):len.f*len.c + 1) = -F.F2_r;
    
    tnace_xz(1, 1:len.f*len.a) = reakcja.Va_xz;
    tnace_xz(1, len.f*len.a:len.f*(len.a + len.b)) = reakcja.Va_xz - F.F1_r;
    tnace_xz(1, len.f*(len.a + len.b):len.f*len.c + 1) = F.F2_t;
    
end
