stop(t);

idx = get(gco,'position');

idx = (idx(2) - 517) / (-50) + 1;

amp(idx) = str2double(get(gco,'string'));

if amp(idx) > 1
    amp(idx) = 1;
elseif amp(idx) < -1
    amp(idx) = -1
end

    

set(t,'TimerFcn',@(~,~)(plot_wave(X,Y,xclick,yclick,amp,freq,phi,xwave,ywave)));



start(t);
    


