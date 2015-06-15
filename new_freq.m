stop(t);

idx = get(gco,'position');

idx = (idx(2) - 517) / (-50) + 1;

freq(idx) = str2double(get(gco,'string'));

if freq(idx) > 10
    freq(idx) = 10;
elseif freq(idx) < 0
    freq(idx) = 0;
end

set(t,'TimerFcn',@(~,~)(plot_wave(X,Y,xclick,yclick,amp,freq,phi,xwave,ywave)));


start(t);
