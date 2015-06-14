stop(t);

idx = get(gco,'position');

idx = (idx(2) - 517) / (-50) + 1;

freq(idx) = str2double(get(gco,'string'));


set(t,'TimerFcn',@(~,~)(plot_wave(X,Y,xclick,yclick,amp,freq,phi)));     



start(t);
