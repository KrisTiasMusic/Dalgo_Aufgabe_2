% Source: http://au.mathworks.com/matlabcentral/answers/33794-3d-surface-sine-wave
function plot_wave(X, Y, xclick, yclick, amp, freq, phi, xwave, ywave)

zeit = clock;
len = length(xclick);
Z = 0;
freq = freq./(2*pi);
Z_wave = 0;
time_past = linspace(0,5,300);

for click_num = 1:len
    phi_use = -2*pi * (freq(click_num) .*  zeit(6) + phi(click_num)/360);
    R = sqrt((X - xclick(click_num)).^2 + (Y - yclick(click_num)).^2);
    Z = Z + amp(click_num) .* sin(2.*pi.*freq(click_num).*R + phi_use);
    
    phi_use = -2.*pi .* freq(click_num).*...
        ((zeit(6)-time_past)+phi(click_num)./360);
    Z_wave = Z_wave + amp(click_num).*...
        sin(2.*pi.*freq(click_num).*R(ywave,xwave)+phi_use);
end
    
subplot(1,2,1);
surf(X,Y,Z, 'EdgeColor', 'none'); 
zlim([-len len]);
colormap(gray);
view(2);
grid off;
set(gca,'Position',[.079 .11 .4742 .815]);

subplot(1,2,2);
plot(time_past,Z_wave)
set(gca,'Position',[.5819 .11 .4 .2]);
xlabel('Time Past in Seconds');
ylim([-len len]);
xlim([0 5]);
grid on

end