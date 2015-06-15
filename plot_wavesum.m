function amp_vec = plot_wavesum(xclick, yclick, surf_z, time_vec, amp_vec)
amp_vec = [amp_vec surf_z(floor(10*(xclick+10)), floor(10*(yclick+10)))];
amp_vec(1) = [];


subplot(2,1,2);
plot(time_vec, amp_vec);
ylim([-1 1]) 