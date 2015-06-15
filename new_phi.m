% Matlab-script to change phase of wave as written in gui

% Usage:
%     callback of h_PHI_edit
% Uses: 
%     None
% Input parameter:
%     None
% Output parameter:
%     None
% Output:
%     change phase of certain wave

% Author: Christoph Eike, Johannes Lühring, Max Zimmermann 
% Version History:
%     1.0         first implementation             12.06.2015 CR JL MZ
%     1.1         improve position parameter change14.06.2015 CR JL MZ
%     1.11        commentation                     15.06.2015 CR JL MZ
%%
stop(t); %stop timer to reset TimerFcn

idx = get(gco,'position'); %get position of edit window

idx = (idx(2) - 517) / (-50) + 1; 
%     get info which edit window is selected by position

phi(idx) = str2double(get(gco,'string')); %change phase

set(t,'TimerFcn',...
    @(~,~)(plot_wave(X,Y,xclick,yclick,amp,freq,phi,xwave,ywave)));
%     reset TimerFcn

start(t);