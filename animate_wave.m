hfig = figure();
set(hfig,'Position',[190 150 631 600]);
% Position = [0.13 0.11 0.775 0.815]
xy = -10:0.1:10;
[X,Y] = meshgrid(xy); % create rectangullar mesh 

[xclick, yclick] = ginput;
xclick = 20*xclick - 10;
yclick = 20*yclick - 10;                     

set(hfig,'Position',[190 150 1031 600]);

frames = 25;
% fps = round(100*(1/frames))/100;
amp = ones(length(xclick),1);
freq = zeros(length(xclick),1) + 5;
phi = zeros(length(xclick),1);

t = timer('Period', 1/frames, ...
          'TimerFcn', @(~,~)(plot_wave(X,Y,xclick,yclick,amp,freq,phi)),...
          'ExecutionMode', 'FixedRate');

start(t);

for edit_num = 1:length(xclick)
h_AMP_edit(edit_num) = uicontrol('style','edit',...
                                 'string','Amplitude (0 to 1)',...
                                 'position',[600 517-50*(edit_num-1) 100 40],...
                                 'callback','new_amp');
                   
h_FREQ_edit(edit_num) = uicontrol('style','edit',...
                                  'string','Frequency (0 to 10)',...
                                  'position',[720 517-50*(edit_num-1) 100 40],...
                                  'callback','new_freq');

h_PHI_edit(edit_num) = uicontrol('style','edit',...
                                 'string','Phi (0 to 360)',...
                                 'position',[840 517-50*(edit_num-1) 100 40],...
                                 'callback','new_phi');
end

h_NEW_button = uicontrol('style','pushbutton',...
                         'string','New',...
                         'position',[0 0 40 40],...
                         'callback','new_click');

uiwait(hfig); % macht so lange weiter, bis das Fenster geschlossen wird.
stop(t);
delete(t);

