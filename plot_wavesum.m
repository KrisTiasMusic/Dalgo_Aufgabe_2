function amp_vec = plot_wavesum(xclick, yclick, surf_z, time_vec, amp_vec, amplitude)
amp_vec = [amp_vec surf_z(floor(10*(xclick+10)), floor(10*(yclick+10)))];

switch amp_vec(end-1)
    case 0
        
    
    

if length(amp_vec) > length(time_vec)-10
    amp_vec(1) = [];
end

subplot(2,1,2);
plot(time_vec, amp_vec);
ylim([-1 1]) 