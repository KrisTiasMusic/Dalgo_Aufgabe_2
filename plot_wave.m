% Matlab-Function to plot a field of waves and plot of stationary amplitude

% Usage:
%     called by animate_wave
% Uses: 
%     None
% Input parameter:
%     X: x-vector of x-axis of meshgrid
%     Y: y-vector of y-axis of meshgrid
%     xclick: vector of x-coordinates of clicks for wave sources
%     yclick: vector of y-coordinates of clicks for wave sources
%     amp: vector of amplitudes of wave sources (default = 1)
%     freq: vector of frequencies of wave sources (default = 5)
%     phi: vector of phase shifts of wave sources in degree (default = 0)
%     xwave: x-coordinate (places in vector not meshgrid) 
%         of stationary wave plot (default = 100)
%     ywave: y-coordinate (places in vector not meshgrid) 
%         of stationary wave plot (default = 100)
% Output parameter:
%     None
% Output:
%     wave field plot
%     stationary wave plot

% Author: Christoph Eike, Johannes Lühring, Max Zimmermann 
% Version History:
%     1.0         first implementation             12.06.2015 CR JL MZ
%     1.1         improve sine creation and surface13.06.2015 CR JL MZ
%     1.2         improve stationary sine creation
%                   and plot                       14.06.2015 CR JL MZ
%     1.3         make bigger better and prettier  15.06.2015 CR JL MZ
%     1.31        commentation                     15.06.2015 CR JL MZ

%%
% Source: http://au.mathworks.com/matlabcentral/answers/
% 33794-3d-surface-sine-wave
function plot_wave(X, Y, xclick, yclick, amp, freq, phi, xwave, ywave)

zeit = clock; %current time
len = length(xclick);
Z = 0; %future matrix of Z-values of each coordinate
freq = freq./(2*pi); %avoid visual aliasing
Z_wave = 0; %future vector for stationary wave plot
time_past = linspace(0,5,300); %vector to create stationary wave plot

for click_num = 1:len %loop for every wave source coordinate
    phi_use = -2*pi * (freq(click_num) .*  zeit(6) + phi(click_num)/360);
        %variable that changes through every call of timer and makes the 
        %wave field 'move'
    R = sqrt((X - xclick(click_num)).^2 + (Y - yclick(click_num)).^2);
        %radius of current wave source to every point of the field
    Z = Z + amp(click_num) .* sin(2.*pi.*freq(click_num).*R + phi_use);
        %matrix of sum of every wave source on every point of field
 
    phi_use = -2.*pi .* (freq(click_num).*...
        (zeit(6)-time_past)+phi(click_num)./360);
        %phi_use as vector of time that is past for stationary wave plot
    Z_wave = Z_wave + amp(click_num).*...
        sin(2.*pi.*freq(click_num).*R(ywave,xwave)+phi_use);
        %vector of stationary wave plot
end
    
xpoint = (xwave - 1) / 10 - 10;
ypoint = (ywave - 1) / 10 - 10;
%     coordinates of stationary wave plot for plot of point on this
%     position

subplot(1,2,1); %wave field
surf(X,Y,Z, 'EdgeColor', 'none'); %create wave field 
colormap(gray);
hold on
plot3(xpoint,ypoint,len+1,'.m') 
%     plot coordinates of stationary wave plot as magenta colored dot
hold off
zlim([-len len+1.1]); 
%     fix z-axis as highest/lowest possible amplitude + space for dot
view(2); %from above
grid off;
set(gca,'Position',[.079 .11 .4742 .815]);

subplot(1,2,2); %stationary wave plot
plot(time_past,Z_wave) %plot wave form over past time
set(gca,'Position',[.5819 .11 .4 .2]);
xlabel('Time Past in Seconds');
ylim([-len len]); %highest/lowest possible amplitude
xlim([0 5]);
grid on

end