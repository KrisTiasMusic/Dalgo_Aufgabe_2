% [xclick_wavesum, yclick_wavesum] = ginput;
% 
% wave_plot_surf = plot_wave(X,Y,xclick_wavesum,yclick_wavesum,amp,freq,phi);
% 
% t_wavesum = timer('Period', 1/frames, ...
%           'TimerFcn', @(~,~)(plot_wavesum(X,Y,xclick_wavesum,yclick_wavesum)),...
%           'ExecutionMode', 'FixedRate');
% start(t_wavesum);
% uiwait(hfig);
% stop(t_wavesum);
% delete(t_wavesum);
 



