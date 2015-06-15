delete(h_AMP_edit)
clear h_AMP_edit
delete(h_FREQ_edit)
clear h_FREQ_edit
delete(h_PHI_edit)
clear h_PHI_edit

stop(t);

[xclick, yclick] = ginput;

amp = ones(length(xclick),1);
freq = zeros(length(xclick),1) + 5;
phi = zeros(length(xclick),1);

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

set(t,'TimerFcn',@(~,~)(plot_wave(X,Y,xclick,yclick,amp,freq,phi,xwave,ywave)));

start(t);
