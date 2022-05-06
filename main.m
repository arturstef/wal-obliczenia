clearvars
close all
clc

dane;

[reakcja.Va_xy, reakcja.Vc_xy, reakcja.Va_xz, reakcja.Vc_xz] =...
    reakcje(len, F);

[T.tnace_xy, T.tnace_xz] =...
    silyTnace(len, F, reakcja);

[M.moment_xy, M.moment_xz, M.moment_g, M.moment_s, M.moment_zr] =...
    momenty(len, F, reakcja);

[D.minimum_D, D.max_D] = min_D(s, M);

liniaUgiecia = ugiecie(M, len);

katSkrecenia = skrecenie(M, wal);

figure(1)
subplot(2, 1, 1)
plot(len.total_len, T.tnace_xy)
title('siły tnące xy')
xlim([0 len.c])
subplot(2, 1, 2)
plot(len.total_len, T.tnace_xz)
title('siły tnące xz')
xlim([0 len.c])

figure(2)
subplot(2, 1, 1)
plot(len.total_len, M.moment_xy)
title('momenty xy')
xlim([0 len.c])
subplot(2, 1, 2)
plot(len.total_len, M.moment_xz)
title('momenty xz')
xlim([0 len.c])

figure(3)
subplot(3, 1, 1)
plot(len.total_len, M.moment_g)
title('moment gnący')
xlim([0 len.c])
subplot(3, 1, 2)
plot(len.total_len, M.moment_s)
title('moment skręcający')
xlim([0 len.c])
subplot(3, 1, 3)
plot(len.total_len, M.moment_zr)
title('moment zredukowany HMH')
xlim([0 len.c])

figure(4)
plot(len.total_len, D.minimum_D)
title('minimalna średnica wału')
xlim([0 len.c])

figure(5)
plot(len.total_len, liniaUgiecia)
title('linia ugiecia')
xlabel('[m]')
ylabel('[m]')
xlim([0 len.c])

fprintf('kat skrecenia = %12.8f [rad/m] \n', katSkrecenia)