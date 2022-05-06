len.a = 0.1; %[m]
len.b = 0.16; %[m]
len.c = 0.36; %[m]
len.f = 1000;
len.total_len = 0:1/len.f:len.c; % wektor długości wału

len.r_1 = 0.09; %[m]
len.r_2 = 0.18; %[m]

F.F1_t = 5000; %[N]
F.F1_r = -3600; %[N]
F.F2_t = 2500; %[N]
F.F2_r = -3100; %[N]

s.Rm = 360; %[MPa]
s.kg = s.Rm*0.5; %[MPa]

wal = [
    19   30;
    51.5 42;
    78   45;
    5    52;
    107  47;
    18   40;
    62   38;
    58   36
    ];

