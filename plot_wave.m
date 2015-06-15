% Source: http://au.mathworks.com/matlabcentral/answers/33794-3d-surface-sine-wave
function plot_wave(X, Y, xclick, yclick, amp, freq, phi, time_vec, amp_vec, amplitude)
    
k = 2*freq; % wave vector 
zeit = clock;
phi= -6 * zeit(6) + phi; % phase 

Z = 0;
for click_num = 1:length(xclick)
    R = sqrt((X - xclick(click_num)).^2 + (Y - yclick(click_num)).^2);
    Z = Z + amp * sin( k .* R + phi ); 
end

subplot(2,1,1);
wave_plot_surf = surf(X,Y,Z, 'EdgeColor', 'none'); 

colormap(bone)
view(2);
grid off;



surf_z = get(wave_plot_surf, 'ZData');

plot_wavesum(xclick, yclick, surf_z, time_vec, amp_vec)

end
