% Matlab-Function to create new wave sources by clicking

% Usage:
%     callback of h_NEW_button
% Uses: 
%     None
% Input parameter:
%     None
% Output parameter:
%     None
% Output:
%     new wave field plot
%     new edit windows corresponding to new wave sources

% Author: Christoph Eike, Johannes Lühring, Max Zimmermann 
% Version History:
%     1.0         first implementation             12.06.2015 CR JL MZ
%     1.1         create new edit windows          13.06.2015 CR JL MZ
%     1.11        get to deal with delete          14.06.2015 CR JL MZ
%     1.12        commentation                     15.06.2015 CR JL MZ

%%
delete(h_AMP_edit)
clear h_AMP_edit
delete(h_FREQ_edit)
clear h_FREQ_edit
delete(h_PHI_edit)
clear h_PHI_edit
%     delete old edit windows

stop(t); %to change parameters of TimerFcn

[xclick, yclick] = ginput; %new wave sources

amp = ones(length(xclick),1);
freq = zeros(length(xclick),1) + 5;
phi = zeros(length(xclick),1);
%     adjust amplitude, frequency and phase to new amount of wave sources
%     and set to default

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
%     create edit windows 3 for every new wave source

set(t,'TimerFcn',...
    @(~,~)(plot_wave(X,Y,xclick,yclick,amp,freq,phi,xwave,ywave)));
%     define TimerFcn with new parameters

start(t);