% Matlab-Function to define new position of stationary wave plot by
% clicking

% Usage:
%     callback of h_NEWWAVE_button
% Uses: 
%     None
% Input parameter:
%     None
% Output parameter:
%     None
% Output:
%     new position of stationary wave plot

% Author: Christoph Eike, Johannes Lühring, Max Zimmermann 
% Version History:
%     1.0         first implementation             15.06.2015 CR JL MZ
%     1.1         better text field of coordinates 15.06.2015 CR JL MZ
%     1.12        commentation                     15.06.2015 CR JL MZ

%%
stop(t); %stop timer to reset TimerFcn

[xwave, ywave] = ginput(1); 
%     get new position for stationary wave plot by click

delete(h_POSITION_text)
clear h_POSITION_text
%     delete old text field of coordinates

text = ['Position: x = ' num2str(xwave)...
                    ' y = ' num2str(ywave)]; 
%     text string for new text field
                
h_POSITION_text = uicontrol('style', 'text',...
                            'string',text,...
                            'position',[600 200 180 15]); %show new text

xwave = round(10 * (xwave + 10)) + 1;
ywave = round(10 * (ywave + 10)) + 1;
%     adjust coordinates for use in plot_wave

set(t,'TimerFcn',...
    @(~,~)(plot_wave(X,Y,xclick,yclick,amp,freq,phi,xwave,ywave)));
%     reset TimerFcn

start(t);