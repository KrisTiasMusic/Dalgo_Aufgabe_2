% Matlab-script to change frequency of wave as written in gui

% Usage:
%     callback of h_FREQ_edit
% Uses: 
%     None
% Input parameter:
%     None
% Output parameter:
%     None
% Output:
%     change frequency of certain wave

% Author: Christoph Eike, Johannes Lühring, Max Zimmermann 
% Version History:
%     1.0         first implementation             12.06.2015 CR JL MZ
%     1.1         improve position parameter change14.06.2015 CR JL MZ
%     1.2         define area of freq              15.06.2015 CR JL MZ
%     1.21        commentation                     15.06.2015 CR JL MZ

%%
stop(t); %stop timer to change parameters of TimerFcn

idx = get(gco,'position'); %get position of certain edit window

idx = (idx(2) - 517) / (-50) + 1; 
    %get info about which freq-edit is selected

freq(idx) = str2double(get(gco,'string')); %change freq in edit window

if freq(idx) > 10
    freq(idx) = 10;
elseif freq(idx) < 0
    freq(idx) = 0;
end
%     control if freq is in certain area to avoid visual aliasing

set(t,'TimerFcn',...
    @(~,~)(plot_wave(X,Y,xclick,yclick,amp,freq,phi,xwave,ywave)));
%     reset TimerFcn

start(t);