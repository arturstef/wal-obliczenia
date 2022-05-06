function [Va_xy, Vc_xy, Va_xz, Vc_xz]  = reakcje(len, F)

    Vc_xy = (F.F2_r*len.c + F.F1_t*len.a)/(len.a + len.b);
    Vc_xz = (F.F2_t*len.c + F.F1_r*len.a)/(len.a + len.b);
    
    Va_xy = F.F1_t - Vc_xy + F.F2_r;
    Va_xz = F.F2_t - Vc_xz + F.F1_r;

end

