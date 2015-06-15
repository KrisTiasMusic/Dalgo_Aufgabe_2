stop(t);

idx = get(gco,'position');

idx = (idx(2) - 517) / (-50) + 1;

amp(idx) = str2double(get(gco,'string'));


set(t,'TimerFcn',@(~,~)(plot_wave(X,Y,xclick,yclick,amp,freq,phi,xwave,ywave)));



start(t);
    


