hfig = figure();
set(hfig,'Position',[190 150 631 600],'Color',[1 0.8 0]);
% Position = [0.13 0.11 0.775 0.815]
xy = -10:0.1:10;
[X,Y] = meshgrid(xy); % create rectangullar mesh 

h_WELCOME_text = uicontrol('style', 'text', ...
      'string', 'Welcome! Click somewhere and press RETURN to start', ...
      'position', [215 285 200 30]);

[xclick, yclick] = ginput;
xclick = 20.*xclick - 10;
yclick = 20.*yclick - 10;                     

delete(h_WELCOME_text)
clear h_WELCOME_text

set(hfig,'Position',[190 150 1031 600]);

frames = 20;
% fps = round(100*(1/frames))/100;
amp = ones(length(xclick),1);
freq = zeros(length(xclick),1) + 5;
phi = zeros(length(xclick),1);
xwave = 100;
ywave = 100;

text = ['Position: x = ' int2str((xwave-1)/10-10)...
                    ' y = ' int2str((ywave-1)/10-10)];
                     
h_POSITION_text = uicontrol('style', 'text',...
                            'string',text,...
                            'position',[600 200 180 15]);

t = timer('Period', 1/frames, ...
          'TimerFcn',@(~,~)(plot_wave(X,Y,xclick,yclick,amp,freq,phi,xwave,ywave)),...
          'ExecutionMode', 'FixedRate');
      



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
                         'string','New Wave Field',...
                         'position',[225 563 200 30],...
                         'callback','new_click');

h_NEWWAVE_button = uicontrol('style','pushbutton',...
                         'string','New Position Analysis',...
                         'position',[814 193 200 30],...
                         'callback','new_wave');          
start(t)                     
uiwait(hfig); % macht so lange weiter, bis das Fenster geschlossen wird.
stop(t);
delete(t);

