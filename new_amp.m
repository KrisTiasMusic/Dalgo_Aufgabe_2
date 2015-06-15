% Matlab-script to change amplitude of wave as written in gui

% Usage:
%     callback of h_AMP_edit
% Uses: 
%     None
% Input parameter:
%     None
% Output parameter:
%     None
% Output:
%     change amplitude of certain wave

% Author: Christoph Eike, Johannes Lühring, Max Zimmermann 
% Version History:
%     1.0         first implementation             12.06.2015 CR JL MZ
%     1.1         improve position parameter change14.06.2015 CR JL MZ
%     1.2         define area of amp               15.06.2015 CR JL MZ
%     1.21        commentation                     15.06.2015 CR JL MZ
%%
stop(t); %stop timer to reset parameters of TimerFcn

idx = get(gco,'position'); %get position of edit window

idx = (idx(2) - 517) / (-50) + 1; 
%     get info which edit window selected by position

amp(idx) = str2double(get(gco,'string')); %change amplitude

if amp(idx) > 1
    amp(idx) = 1;
elseif amp(idx) < -1
    amp(idx) = -1;
end
%     control if amplitude is in certain area to avoid too big amplitudes
    
set(t,'TimerFcn',...
    @(~,~)(plot_wave(X,Y,xclick,yclick,amp,freq,phi,xwave,ywave)));
%     reset TimerFcn

start(t);