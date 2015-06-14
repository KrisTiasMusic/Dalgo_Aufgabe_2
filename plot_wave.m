% Source: http://au.mathworks.com/matlabcentral/answers/33794-3d-surface-sine-wave
function plot_wave(X, Y, xclick, yclick, amp, freq, phi)
    

zeit = clock;
 % phase 

Z = 0;
for click_num = 1:length(xclick)
    k = 2*freq(click_num); % wave vector 
    phi_use = -6 * zeit(6) + phi(click_num);
    R = sqrt((X - xclick(click_num)).^2 + (Y - yclick(click_num)).^2);
    Z = Z + amp(click_num) * sin( k .* R + phi_use ); 
end

surf(X,Y,Z, 'EdgeColor', 'none'); 
zlim([-length(amp) length(amp)]);
colormap(hsv)
view(2);
grid off;

axes_handle = gca;
% get(axes_handle);
set(axes_handle,'Position',[.079 .11 .4742 .815]);

end
