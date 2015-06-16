% Matlab-script to start a gui that shows the interaction of wave-forms in
% a plane. It is possible to adjust amplitude, frequency and phase and to
% show the amplitude over time at a certain point.

% Usage: animate_wave
% Uses: 
%     plot_wave, new_amp, new_click, new_freq, new_phi, new_wave
% Input parameter:
%     None
% Output parameter:
%     None
% Output:
%     GUI

% Author: Christoph Eike, Johannes Lühring, Max Zimmermann 
% Version History:
%     1.0         first implementation             12.06.2015 CR JL MZ
%     1.1         build gui-components             13.06.2015 CR JL MZ
%     1.2         improve gui and timer            14.06.2015 CR JL MZ
%     1.3         make better!                     15.06.2015 CR JL MZ
%     1.31        commentation                     15.06.2015 CR JL MZ
%     1.32        maximum of sources = 6           16.06.2015 CR JL MZ

%%
% Copyright (C) 2015  Christoph Eike, Johannes Lühring, Max Zimmermann
% 
% This program is free software: you can redistribute it and/or modify
% it under the terms of the GNU General Public License as published by
% the Free Software Foundation, either version 3 of the License, or
% (at your option) any later version.
% 
% This program is distributed in the hope that it will be useful,
% but WITHOUT ANY WARRANTY; without even the implied warranty of
% MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
% GNU General Public License for more details.
% 
% You should have received a copy of the GNU General Public License
% along with this program.  If not, see <http://www.gnu.org/licenses/>.

%%
hfig = figure();
set(hfig,'Position',[190 150 631 600],'Color',[1 0.6 0]);
    % new size and color of figure
xy = -10:0.1:10;
[X,Y] = meshgrid(xy); % create rectangullar mesh in range of xy 

h_WELCOME_text = uicontrol('style', 'text', ...
      'string', 'Welcome! Click somewhere and press RETURN to start', ...
      'position', [215 285 200 30]);
%   welcome text for user
  
[xclick, yclick] = ginput; %first input click

while length(xclick) > 6
    [xclick, yclick] = ginput;
end
%     limitate amount of possible wave sources to 6

xclick = 20.*xclick - 10;
yclick = 20.*yclick - 10;
%     fit range of click coordinates to -10 to 10
      
delete(h_WELCOME_text)
clear h_WELCOME_text

set(hfig,'Position',[190 150 1031 600]); %new size of figure

frames = 20; %frames of timer-period
amp = ones(length(xclick),1); %default amplitude
freq = zeros(length(xclick),1) + 5; %default frequency
phi = zeros(length(xclick),1); %default phase
xwave = 100; %default x-place of stationary amplitude plot
ywave = 100; %default y-place of stationary amplitude plot

text = ['Position: x = ' int2str((xwave-1)/10-10)...
                    ' y = ' int2str((ywave-1)/10-10)];
%     show position of stationary amplitude plot
                     
h_POSITION_text = uicontrol('style', 'text',...
                            'string',text,...
                            'position',[600 200 180 15]);
%     show text in figure
                        
t = timer('Period', 1/frames, ...
          'TimerFcn',@(~,~)(plot_wave(X,Y,xclick,yclick,amp,freq,phi,xwave,ywave)),...
          'ExecutionMode', 'FixedRate');
%     define timer and call plot_wave as Timer Function      

h_AMP_text = uicontrol('style','text',...
                                 'string','Amplitude (0 to 1)',...
                                 'position',[600 564 100 15]);
h_FREQ_text = uicontrol('style','text',...
                                 'string','Frequency (0 to 10)',...
                                 'position',[720 564 100 15]);
h_PHI_text = uicontrol('style','text',...
                                 'string','Phase (Degree)',...
                                 'position',[840 564 100 15]);
%     texts for recognizing edit windows

for edit_num = 1:length(xclick)
h_AMP_edit(edit_num) = uicontrol('style','edit',...
                                 'string','',...
                           'position',[600 517-50*(edit_num-1) 100 40],...
                                 'callback','new_amp');
                   
h_FREQ_edit(edit_num) = uicontrol('style','edit',...
                                  'string','',...
                           'position',[720 517-50*(edit_num-1) 100 40],...
                                  'callback','new_freq');

h_PHI_edit(edit_num) = uicontrol('style','edit',...
                                 'string','',...
                           'position',[840 517-50*(edit_num-1) 100 40],...
                                 'callback','new_phi');
end
%     for every click create one amplitude frequency and phase edit window


h_NEW_button = uicontrol('style','pushbutton',...
                         'string','New Wave Field',...
                         'position',[225 563 200 30],...
                         'callback','new_click');
%     push button for new wave_field
                     
h_NEWWAVE_button = uicontrol('style','pushbutton',...
                         'string','New Position Analysis',...
                         'position',[814 193 200 30],...
                         'callback','new_wave');          
%     new position for stationary wave plot
                     
start(t) %start timer
uiwait(hfig); %execute timer until window is closed
stop(t); %stop timer
delete(t); %delete timer