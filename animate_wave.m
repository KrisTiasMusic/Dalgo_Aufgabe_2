hfig = figure();
set(hfig,'Position',[440 150 600 600])

xy = -10:0.1:10;
[X,Y] = meshgrid(xy); % create rectangullar mesh 

[xclick, yclick] = ginput;
xclick = 20*xclick - 10;
yclick = 20*yclick - 10;   



frames = 25;
% fps = round(100*(1/frames))/100;
amp = 1;
freq = 5;
phi = 0;

time_vec = 0:(1/frames):10;
amplitude = zeros(1, length(time_vec));
amp_vec = 0;

t = timer('Period', 1/frames, ...
          'TimerFcn', @(~,~)(plot_wave(X,Y,xclick,yclick,amp,freq,phi, time_vec, amp_vec, amplitude)),...
          'ExecutionMode', 'FixedRate');

start(t);

h_NEW_button = uicontrol('style','pushbutton',...
                         'string','New wave field',...
                         'position',[0 0 100 30],...
                         'callback','new_click');
                     
h_plot_wavesum_button = uicontrol('style','pushbutton',...
                         'string','Plot wave sum',...
                         'position',[100 0 100 30],...
                         'callback','wavesum');
             
h_AMP_edit = uicontrol('style','edit',...
                       'string','Amplitude (0 to 1)',...
                       'position',[500 710 100 40],...
                       'callback','new_amp');                   
                     
h_FREQ_edit = uicontrol('style','edit',...
                       'string','Frequency (0 to 10)',...
                       'position',[620 710 100 40],...
                       'callback','new_freq');

h_PHI_edit = uicontrol('style','edit',...
                       'string','Phi (0 to 360)',...
                       'position',[740 710 100 40],...
                       'callback','new_amp');
                     
uiwait(hfig); % macht so lange weiter, bis das Fenster geschlossen wird.
stop(t);
delete(t);

