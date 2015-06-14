% Source: http://au.mathworks.com/matlabcentral/answers/33794-3d-surface-sine-wave
function plot_wave(X, Y, xclick, yclick, amp, freq, phi)
    
k = 2*freq; % wave vector 
zeit = clock;
phi= -6 * zeit(6) + phi; % phase 

Z = 0;
for click_num = 1:length(xclick)
    R = sqrt((X - xclick(click_num)).^2 + (Y - yclick(click_num)).^2);
    Z = Z + amp * sin( k .* R + phi ); 
end

surf(X,Y,Z, 'EdgeColor', 'none'); 
colormap(gray)
view(2);
grid off;

end
